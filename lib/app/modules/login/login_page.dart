import 'package:flutter/material.dart';
import 'package:tem_horario_adm/app/components/buttons/button_widget.dart';
import 'package:tem_horario_adm/app/components/inputs/text_field_widget.dart';
import 'package:tem_horario_adm/app/components/scaffold/Scaffold_widget.dart';
import 'package:tem_horario_adm/app/modules/login/login_controller.dart';
import 'package:tem_horario_adm/app/modules/login/login_module.dart';
import 'package:tem_horario_adm/app_theme.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _c = LoginModule.to.getBloc<LoginController>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      scaffoldKey: scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppThemeData.to.defaultHorizontalMargin),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/5.7, bottom: 20),
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              TextFieldWidget(
                labelText: "Email",
                callbackValue: (value) {}, type: TextInputType.emailAddress),
              TextFieldWidget(
                labelText: "Senha",
                callbackValue: (value) {}, isVisible: false),
              ButtonWidget(text: "Entrar", callback: (){
                _c.authenticate(context, scaffoldKey);
              })
            ],
          ),
        ),
      ),
    );
  }
}
