import 'package:dio/dio.dart';
import 'package:tem_horario_adm/app/services/localstorage_service.dart';

class DioRepository {
  final Dio client;

  DioRepository(this.client) {
    client.interceptors.add(InterceptorsWrapper(
      onRequest:(RequestOptions options) async {
        //client.options.baseUrl = AppConfig.baseUrl;
        // client.options.connectTimeout = 5000; //5s
        // client.options.receiveTimeout = 3000;
        
        // if(options.path.indexOf("person/authenticate") > -1 ||
        //   options.path.indexOf("person/authentication-data") > -1 ||
        //   options.path.indexOf("person/validate-code") > -1 ||
        //   options.path.indexOf("person/recover-password") > -1 ||
        //   options.path.indexOf("person/update-password") > -1)
        //   return options;

        var userData = await LocalstorageService.to.getUserData();
        if(userData != null)
          options.headers["authorization"] = "Bearer ${userData.token}";     
        return options;
      },
      onResponse:(Response response) async {        
        return response;
      },
      onError: (DioError e) async {
        return e.response;
      }
    ));
  }

  //TODO validar msg etc...
  static String _handleError(DioError error) {
    String errorDescription = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${error.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }

}
