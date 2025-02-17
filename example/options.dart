import 'dart:io';
import 'package:dio/dio.dart';

main() async {
  var dio = new Dio(new BaseOptions(
    baseUrl: "http://www.dtworkroom.com/doris/1/2.0.0/",
    connectTimeout: 5000,
    receiveTimeout: 100000,
    // 5s
    headers: {
      HttpHeaders.userAgentHeader: "dio",
      "api": "1.0.0",
    },
    contentType: ContentType.json,
    // Transform the response data to a String encoded with UTF8.
    // The default value is [ResponseType.JSON].
    responseType: ResponseType.plain,
  ));

  Response<String> response;

  response = await dio.get("/test");
  print(response.data);

  Response<Map> responseMap = await dio.get(
    "/test",
    // Transform response data to Json Map
    options: new Options(responseType: ResponseType.json),
  );
  print(responseMap.data);

  response = await dio.post(
    "/test",
    data: {
      "id": 8,
      "info": {"name": "wendux", "age": 25}
    },
    // Send data with "application/x-www-form-urlencoded" format
    options: new Options(
        contentType: ContentType.parse("application/x-www-form-urlencoded")),
  );
  print(response.data);

  response = await dio.request("/get",
      options: RequestOptions(baseUrl: "http://httpbin.org/"));
  print(response.data);
}
