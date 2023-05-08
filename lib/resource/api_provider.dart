import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_rxdart/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/example_model.dart';

class ApiProvider {
  HttpClient httpClient = HttpClient();

  /// Example
  Future<List<ExampleModel>?> fetchExample() async {
    String url = Utils.BASE_URL;

    Map<String, String> headers = {'content-type': 'application/json'};

    try {
      http.Response response = await http
          .post(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 15));
      if (kDebugMode) {
        print(response.body);
      }
      return exampleModelFromJson(utf8.decode(response.bodyBytes));
    } on TimeoutException catch (_) {
      return null;
    } on SocketException catch (_) {
      return null;
    }
  }
}