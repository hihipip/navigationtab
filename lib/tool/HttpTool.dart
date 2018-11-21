import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


//單例模式
class HttpTool{
  static final HttpTool _httpTool = new HttpTool._internal();
  factory HttpTool(){
    return _httpTool;
  }
  HttpTool._internal();

  Future post(String url,{Function callback,Map<String, String> headers,Map<String, String> params,Function errorCallback}) async {
    Map<String, String> headerMap = headers == null ? new Map() : headers;
    Map<String, String> paramMap = params == null ? new Map() : params;
    try {

      http.Response res = await http.post(url, headers: headerMap, body: paramMap);
      String errmsg="";
      int httpcode=0;

      print(res.statusCode);
      print(res.body);

      httpcode = res.statusCode;
      if (res.statusCode != 200) {
        errmsg = res.body;
        handError(errorCallback, httpcode, errmsg);
        return;
      }
      Map<String, dynamic> map = json.decode(res.body);
      if (callback != null) {
        callback(map);
      }
    }catch(exception)
    {
      handError(errorCallback,0, exception.toString());
    }
  }

  void handError(Function errorCallback,int httpcode,String errmsg) {
    if (errorCallback != null) {
      errorCallback(httpcode,errmsg);
    }
  }



}