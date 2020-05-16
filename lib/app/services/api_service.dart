import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tem_horario_adm/app/modules/login/login_module.dart';
import 'package:tem_horario_adm/app/services/localstorage_service.dart';
import 'package:tem_horario_adm/main.dart';

class ApiService {
  static Future<dynamic> solve (BuildContext context, GlobalKey<ScaffoldState> scaffoldKey, Future<Response<dynamic>> futureFunc, { bool showLoading = true }) async {
    if(showLoading)
      Loading.show(context);
    try {
      return await futureFunc.then((result) async {
        if(result.statusCode == 401){
          Toaster.show("Sessao expirada", scaffoldKey);
          await LocalstorageService.to.setUserData(null);
          Future.delayed(Duration(seconds: 2), (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> LoginModule()), (route) => false);
          });
          return null;
        }
        if(result.statusCode == 200 || result.statusCode == 204){
          if(showLoading)
            Loading.hide(context);
          return result.data;
        } else {
          Toaster.show(result.data, scaffoldKey);
          if(showLoading)
            await Loading.hide(context);
          return null;
        }
      });
    } catch (e) {
      if(showLoading)
        Loading.hide(context);
      Toaster.show(e.message, scaffoldKey);
      return await Future.delayed(Duration(seconds: 2), (){
        return null;
      });
    }
  }
}