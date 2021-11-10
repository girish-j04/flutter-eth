
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tempapp/services/data.dart';
import 'package:tempapp/slider_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


TransactionsData t1 = new TransactionsData("TX","OXSBJSB","123",DateFormat.jm().format(DateTime.now()));


class WalletPage extends StatefulWidget {
  const WalletPage({Key key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {

  Client httpClient;
  Web3Client ethClient;
  bool data = false;
  int myAmount = 0;

  final myAddress= '0xEf41E48dB5F232b2D8A9fC1596626e8eF4e8BeaB';
  // final myAddress = '0x172C02f3dD8a562DE851a07b6A618dD0A860A9cB';
  List<TransactionsData> list = [];

  var myData;

  @override
  void initState() {
    super.initState();

    httpClient = Client();
    ethClient = Web3Client('https://ropsten.infura.io/v3/6f200a49facb4f79afdf22537137860f', httpClient);
    // ethClient = Web3Client('http://127.0.0.1:8545', httpClient);




    getBalance(myAddress);
  }



  Future<DeployedContract> loadContract() async{
    String abi = await rootBundle.loadString('assets/abi.json');
    String contractAddress = '0xca55075a6Ff6b741dE88B2b0A64d04a489eE96e3';
    // String contractAddress = '0x4fb24D3D2B28fE744e3103bB9BDBb640fF0569A4';

    final contract = DeployedContract(ContractAbi.fromJson(abi, "TestCoin"), EthereumAddress.fromHex(contractAddress));

    return contract;

}

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async{
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(contract: contract, function: ethFunction, params: args);

    return result;
  }

  Future<void> getBalance(String targetAddress) async{
    // EthereumAddress address = EthereumAddress.fromHex(targetAddress);

    List<dynamic> result = await query('getBalance', []);

    myData = result[0];
    data = true;
    setState(() {});
  }


  Future<String> submit(String functionName, List<dynamic> args) async{
    EthPrivateKey credentials = EthPrivateKey.fromHex(
        'c3b2e11e558a9fb5ca2f62294ed725f7802de34a694ad9ae7d70382b4130277c');

    // EthPrivateKey credentials = EthPrivateKey.fromHex(
    //     'ed3d59bd8cba54c33642fe4ea9e1d142f0384890afff7306abf63ea7276ee992');


    DeployedContract contract = await loadContract();

    final ethFunction = contract.function(functionName);
    final result = await ethClient.sendTransaction(credentials,
        Transaction.callContract(contract: contract, function: ethFunction, parameters: args), fetchChainIdFromNetworkId: true, chainId: null);

    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    if(functionName == "depositBalance")
    {

      TransactionsData t = new TransactionsData("RECEIVED",result,args[0].toString(),currentTime);
      list.add(t);
      setState(() {});
    }
    else{
      TransactionsData t = new TransactionsData("PAID",result,args[0].toString(),currentTime);
      list.add(t);
      setState(() {});
    }
    print(result);

    TransactionInformation transactionInfo = await ethClient.getTransactionByHash(result);
    print(transactionInfo.input);


    return result;
  }

  Future<String> send() async{
    var amount = BigInt.from(myAmount);

    var result = await submit('depositBalance', [amount]);

    print('Amount Deposited');
    return result;
  }

  Future<String> withdraw() async{
    var amount = BigInt.from(myAmount);

    var result = await submit('withdrawBalance', [amount]);

    print('Amount Withdrawn');
    return result;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray300,
      body: ZStack([
        VxBox()
        .gray700
        .size(context.screenWidth, context.percentHeight * 30)
        .make(),

        VStack([
          (context.percentHeight * 10).heightBox,
          "\$TESTCOIN".text.bold.white.xl4.makeCentered().py16(),

          VxBox(child: VStack([
            'Balance'.text.gray700.xl2.semiBold.makeCentered(),
            10.heightBox,
            data?'\$${myData}'.text.bold.xl6.makeCentered().shimmer():CircularProgressIndicator().centered()

          ]))
              .p16
              .white
              .size(context.screenWidth, context.percentHeight * 18)
              .rounded
              .shadowXl
              .make()
              .p16(),
          30.heightBox,

          SliderWidget(
            min: 0,
            max: 100,
            finalVal: (value){
              myAmount = (value*100).round();
              print(myAmount);
            },
          ).centered(),

          HStack([
            FlatButton.icon(
              onPressed: () => getBalance(myAddress),
              color: Colors.blue,
              shape: Vx.roundedSm,
              icon: Icon(Icons.refresh_rounded, color: Colors.white,),
              label: 'Refresh'.text.white.make(),
            ).h(50),

            FlatButton.icon(
              onPressed: () => send(),
              color: Colors.green,
              shape: Vx.roundedSm,
              icon: Icon(Icons.call_made_rounded, color: Colors.white,),
              label: 'Deposit'.text.white.make(),
            ).h(50),

            FlatButton.icon(
              onPressed: () => withdraw(),
              color: Colors.red,
              shape: Vx.roundedSm,
              icon: Icon(Icons.call_received_rounded, color: Colors.white,),
              label: 'Withdraw'.text.white.make(),
            ).h(50),
          ],
            alignment: MainAxisAlignment.spaceAround,
            axisSize: MainAxisSize.max,
          ).p16(),



          Expanded(child:
          ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return (
                  ListTile(

                    tileColor: Colors.white,
                    hoverColor: Colors.grey,
                    leading: list[index].name=="PAID"? Icon( Icons.call_made_outlined):Icon( Icons.call_received_outlined),
                    title:  Text(list[index].name),
                    subtitle:  Column(
                        children: [
                          Text('\u{20B9}${list[index].amt}'),
                          Text("Token Hash :"+'${list[index].hash.substring(0,7)}')
                        ]),
                    onTap: () => print("ListTile"),
                    trailing: Text('${list[index].timestamp}'),
                  )).p(10);
            },
          )
          )




        ])
      ]
      ),
    );
  }
}
