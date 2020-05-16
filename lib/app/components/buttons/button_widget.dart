import 'package:flutter/material.dart';
import 'package:tem_horario_adm/app_theme.dart';
import 'package:tem_horario_adm/app/helpers/extension/string_extension.dart';

enum ButtonWidgetType{
  normal,
  progress,
  cancel
}

class ButtonWidget extends StatefulWidget {
  final String text;
  final ButtonWidgetType type;
  final EdgeInsets margin;
  final Function callback;
  ButtonWidget({Key key,
    this.text, 
    this.type = ButtonWidgetType.normal, 
    this.margin,
    this.callback
  })
    : assert(!text.isNullOrEmpty(), "text is required"),
      assert(callback != null, "callback is required"),
    super(key: key);
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  _getColor(){
    switch(widget.type){
      case ButtonWidgetType.progress:
        return AppThemeData.to.colors.secondary;
      case ButtonWidgetType.cancel:
        return AppThemeData.to.colors.negative;
      default:
        return AppThemeData.to.colors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { widget.callback(); },
      child: Container(
        margin:widget.margin ?? EdgeInsets.symmetric(vertical: 10),
        height: 60,
        decoration: BoxDecoration(
          color: _getColor(),
          borderRadius: BorderRadius.circular(AppThemeData.to.defaultRadius)
        ),
        //color: Colors.grey,
        child: Center(
          child: Text(widget.text,
            style: TextStyle(fontSize: AppThemeData.to.fontSize.large, color: Colors.white))
        ),
      ),
    );
  }
}