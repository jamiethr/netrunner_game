import 'dart:convert';

import 'package:validators/sanitizers.dart';
import 'package:http/http.dart' as http;

/// base API service which other specialized API services are built upon.

class ApiService {
  static const baseUrl = "https://deskofcardsapi.com/api";

  /// Creates a query string with the [path] to the API being accessed and returns a URL
  /// with the provided [params].
  ///
  /// Code from Tyler Codes on YouTube:
  /// https://www.youtube.com/c/TylerCodes
  Uri _url(
    String path, [
    Map<String, dynamic> params = const {},
  ]) {
    String queryString = "";
    if (params.isNotEmpty) {
      queryString = "?";
      params.forEach(
        (k, v) {
          queryString += "$k=${v.toString()}&";
        },
      );
    }

    path = rtrim(path, '/');
    path = ltrim(path, '/');
    queryString = rtrim(queryString, '&');

    final url = '$baseUrl/$path/$queryString';
    return Uri.parse(url);
  }

  /// Builds and sends a GET request.
  ///
  /// Code from Tyler Codes on YouTube:
  /// https://www.youtube.com/c/TylerCodes
  Future<Map<String, dynamic>> httpGet(
    String path, {
    Map<String, dynamic> params = const {},
  }) async {
    final url = _url(path, params);

    final response = await http.get(url);
    if (response.bodyBytes.isEmpty) {
      return {};
    }

    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  /// TODO: make functions for POST, PATCH, DELETE

}
