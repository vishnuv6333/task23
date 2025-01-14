// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:http/http.dart';
// ignore: implementation_imports
import "package:http/src/multipart_file.dart" as multipart;
// ignore: implementation_imports,
import 'package:http/src/response.dart' as res;
import 'package:http_parser/http_parser.dart';
import 'package:task23/core/utils/logger.dart';

import '../../core/constants/api_contant.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  Future<Map<String, dynamic>> fakeRequest(String path, String params) async {
    await Future.delayed(const Duration(seconds: 3));
    return {"name": "pranav"};
  }

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    consoleLog(getPath(path));
    final response = await _client.get(
      getPath(path),
      headers: {
        "Accept": "application/json",
        'Content-Type': 'application/json',
        'Authorization':  'Bearer ',
      },
    );
    consoleLog(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, Map<dynamic, dynamic> params) async {
 
    final response = await _client.post(
      getPath(path),
      body: jsonEncode(params),
      headers: {
        "Accept": "application/json",
        'Content-Type': 'application/json',
        'Authorization': 'Bearer '
          ,
      },
    );
    consoleLog(response.statusCode);
    consoleLog(response.body);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      return responseJson;
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic formData(
      {Map<String, dynamic>? data,
      Map<String, List<File>>? listImage,
      Map<String, File>? images,
      required String path}) async {
    // AuthController authController = Get.find();
    consoleLog("path--$path");
    var request =
        MultipartRequest("POST", Uri.parse(ApiConstants.defaultWebUrl + path));
    request.headers.addAll({
      "Accept": "application/json",
      'Content-Type': 'application/json',
      'Authorization':  'Bearer '
          ,
    });
    consoleLog("sds");
    if (data != null) {
      data.forEach((key, value) {
        if (value is List) {
          for (var element in value) {
            final index = value.indexOf(element);
            final fieldString = "$key[$index]";
            consoleLog(fieldString);
            consoleLog(element.toString());
            request.fields[fieldString] = element.toString();
          }
        } else {
          request.fields[key] = value.toString();
        }
      });
    }
    if (images != null) {
      images.forEach((key, value) async {
        var multipartFile = await multipart.MultipartFile.fromPath(
            key, value.path,
            contentType: MediaType("image", "jpg"));
        request.files.add(multipartFile);
      });
    }

    if (listImage != null) {
      consoleLog(listImage);
      listImage.forEach((key, value) async {
        for (var element in value) {
          final index = value.indexOf(element);
          final fieldString = "$key[$index]";

          var multipartFile = await multipart.MultipartFile.fromPath(
              fieldString, element.path,
              contentType: MediaType("image", "jpg"));
          request.files.add(multipartFile);
        }
      });
    }

    final response = await request.send();
    var httpResponse = await res.Response.fromStream(response);
    consoleLog(httpResponse.body);
    if (httpResponse.statusCode == 200) {
      final jsonresposne = json.decode(httpResponse.body);
      return jsonresposne;
    }
  }

  dynamic deleteWithBody(String path, {Map<dynamic, dynamic>? params}) async {
    Request request = Request('DELETE', getPath(path));
    request.headers['Content-Type'] = 'application/json';
    request.body = jsonEncode(params);
    final response = await _client.send(request).then(
          (value) => res.Response.fromStream(value),
        );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath(String path, {Map<dynamic, dynamic>? params}) {
    return Uri.parse(ApiConstants.defaultWebUrl);
  }
}
