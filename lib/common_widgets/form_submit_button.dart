import 'package:tempapp/common_widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';
const col = const Color(0xFF640000);
class FormSubmitButton extends CustomRaisedButton{
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
}) : super(
    child: Text(
      text,
    style: TextStyle(color: Colors.white, fontSize: 20),
    ),
    onPressed: onPressed,
    height: 44,
    borderRadius: 0,
    color: col,
  );
}