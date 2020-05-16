import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tem_horario_adm/app/modules/internal_modules/menuPage.dart';
import 'package:tem_horario_adm/app/modules/login/select_workplace.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String email;
  @observable
  String password;
  @observable
  String workplaceId;

  void setEmail(String value) {
    this.email = value;
  }

  void setPassword(String value) {
    this.password = value;
  }

  Future<void> authenticate(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) async {
    this.workplaceId =
      await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SelectWorkplace()));
    if(this.workplaceId != null){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MenuPage()),
        (Route<dynamic> route) => false);
    }
    // var data = await ServiceApi.solve(context, scaffoldKey, _personApi.authenticate(email));
    // if(data != null){
    //   personId = data["personId"];
    //   step = StepLoginEndRegister.password;
    // }
  }
}
