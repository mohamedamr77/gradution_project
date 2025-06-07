import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../utils/token_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

@injectable
class ApiService {
  final HttpWithMiddleware _client = HttpWithMiddleware.build(
    middlewares: [HttpLogger(logLevel: LogLevel.BODY)],
  );

  Future<dynamic> get({required String endPoint, String? token}) async {
    Map<String, String> headers = {
      'accept-language': 'ar',
      'Content-Type': 'application/json',
       'x-flutter-secret' :'flutter_client'
    };
    final accessToken = token ?? TokenManager.getToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      headers.addAll({"Authorization": "Bearer $accessToken"});
    }

    debugPrint("EndPoint =$endPoint token=$accessToken");

    try {
      http.Response response = await _client.get(
        Uri.parse(endPoint),
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        final decodedBody = jsonDecode(response.body);
        final message = decodedBody['message'] ?? 'حدث خطأ ما';
        throw message;
      }
    } catch (e) {
      debugPrint("Error in get request: $e");
      throw e.toString();
    }
  }


  Future<dynamic> post({
    required String endPoint,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {
      "x-flutter-secret": "flutter_client",
      "Content-Type": "application/json",
    };

    final accessToken = token ?? TokenManager.getToken();
    if (accessToken != null && accessToken.isNotEmpty) {
      headers.addAll({"Authorization": "Bearer $accessToken"});
    }

    try {
      http.Response response = await _client.post(
        Uri.parse(endPoint),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        debugPrint("Failure Post ${response.body}");
        final decodedBody = jsonDecode(response.body);
        final message = decodedBody['msg'] ?? 'حدث خطأ ما';
        throw message;
      }
    } catch (e) {
      debugPrint("Error in Post request: $e");
      throw e.toString();
    }
  }


  Future<dynamic> put({
    required String endPoint,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};

    final accessToken = token ?? TokenManager.getToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      headers.addAll({"Authorization": "Bearer $accessToken"});
    }
    // debugPrint("EndPoint =$endPoint token=$accessToken");

    if (kDebugMode) {
      // print("EndPoint =$endPoint body=$body token=${TokenManager.getToken()}");
    }
    http.Response response = await _client.put(
      Uri.parse(endPoint),
      body: body,
      headers: headers,
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        debugPrint("Faliure Put : ${response.body}");
        final decodedBody = jsonDecode(response.body);
        final message = decodedBody['message'] ?? 'حدث خطأ ما';
        throw message;
      }
    } catch (e) {
      debugPrint("Error in Put request: $e");
      throw e.toString();
    }
  }

  Future<dynamic> patch({
    required String endPoint,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    final accessToken = token ??TokenManager.getToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      headers.addAll({"Authorization": "Bearer $accessToken"});
    }
    // debugPrint("EndPoint =$endPoint token=$accessToken");

    // Ensure that the body is correctly encoded to JSON
    final encodedBody = jsonEncode(body);

    http.Response response = await _client.patch(
      Uri.parse(endPoint),
      body: body == null ? null : encodedBody,
      headers: headers,
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        debugPrint("Faliure Patch : ${response.body}");
        final decodedBody = jsonDecode(response.body);
        final message = decodedBody['message'] ?? 'حدث خطأ ما';
        throw message;
      }
    } catch (e) {
      debugPrint("Error in Patch request: $e");
      throw e.toString();
    }
  }

  Future<dynamic> delete({
    required String endPoint,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    final accessToken = token ?? TokenManager.getToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      headers.addAll({"Authorization": "Bearer $accessToken"});
    }
    // debugPrint("EndPoint =$endPoint token=$accessToken");
    try {
      http.Response response = await _client.delete(
        Uri.parse(endPoint),
        body: body,
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        debugPrint("Faliure Post ${response.body}");
        final decodedBody = jsonDecode(response.body);
        final message = decodedBody['message'] ?? 'حدث خطأ ما';
        throw message;
      }
    } catch (e) {
      debugPrint("Error in Delete request: $e");
      throw e.toString();
    }
  }
}