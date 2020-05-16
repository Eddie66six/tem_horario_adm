import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalstorageService {
  LocalstorageService._();
  static LocalstorageService _instance;
  static LocalstorageService get to => _instance ?? LocalstorageService._();
  //keys
  String get _user => "temHorarioUserAdm";

  //func
  Future<Null> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();    
    var _pre = prefs.getString(_user);
    if(_pre == null) return null;
    return null;//UserAuth.fromJson(jsonDecode(_pre));
  }
  setUserData(Map<String, dynamic> user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(user == null) prefs.clear();
    prefs.setString(_user, json.encode(user));
  }
}