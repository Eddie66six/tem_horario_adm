import 'package:flutter/material.dart';
import 'package:tem_horario_adm/app/app_module.dart';

void main() => runApp(AppModule());


class Loading {
  static Future<void> hide(BuildContext context) async {
    Navigator.of(context, rootNavigator: true).pop();
  }
  static Future<void> show(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            //key: _stateKey,
            backgroundColor: Colors.black54,
            children: [
              Center(
                child: Column(children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10,),
                    Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                  ]),
              )
            ])
        );
      });
  }
}

class Toaster {
  static Future<void> show(dynamic msg, GlobalKey<ScaffoldState> scaffoldKey) async {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          backgroundColor: msg.runtimeType != String && msg.length > 0 && msg[0]["warning"] ? Colors.yellow : Colors.red,
          content: Text(msg.runtimeType != String && msg.length > 0 ? _formatMsg(msg) : msg ?? "Error"),
          duration: Duration(seconds: 3),
      ));
  }

  static _formatMsg(List<dynamic> lstMgs){
    if(lstMgs == null || lstMgs.length == 0) return "Error";
    var result = "";
    for (var i = 0; i < lstMgs.length; i++) {
      result += lstMgs[i]["message"] + (i < lstMgs.length -1 ? "|" : ""); 
    }
    return result;
  }
}