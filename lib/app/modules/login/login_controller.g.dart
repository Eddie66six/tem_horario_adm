// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$workplaceIdAtom = Atom(name: '_LoginControllerBase.workplaceId');

  @override
  String get workplaceId {
    _$workplaceIdAtom.reportRead();
    return super.workplaceId;
  }

  @override
  set workplaceId(String value) {
    _$workplaceIdAtom.reportWrite(value, super.workplaceId, () {
      super.workplaceId = value;
    });
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
workplaceId: ${workplaceId}
    ''';
  }
}
