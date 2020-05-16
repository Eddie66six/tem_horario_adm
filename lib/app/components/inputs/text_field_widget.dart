import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final TextInputType type;
  final bool isVisible;
  final Function callbackValue;
  final EdgeInsets margin;
  final String labelText;
  TextFieldWidget({
    Key key,
    this.margin, 
    this.isVisible = true,
    this.type = TextInputType.text,
    this.callbackValue,
    this.labelText  
  })
    : assert(callbackValue != null, "callbackValue is required"),
    super(key: key);
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  var isVisiblePassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:widget.margin ?? EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        obscureText: !widget.isVisible && !isVisiblePassword,
        onSubmitted: widget.callbackValue,
        onChanged: widget.callbackValue,
        keyboardType: widget.type,
        decoration: InputDecoration(
          labelText: widget.labelText ?? "",
          suffixIcon: widget.isVisible ? null :
            GestureDetector(
              onTap: () {
                setState(() {
                  isVisiblePassword = !isVisiblePassword;
                });
              },
              child: Icon(isVisiblePassword ? Icons.visibility : Icons.visibility_off)
            )
        ),
      ),
    );
  }
}