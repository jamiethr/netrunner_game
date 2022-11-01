import 'package:validators/sanitizers.dart';

/// base API service which other specialized API services are built upon.

class ApiService {
  static const baseUrl = "https://deskofcardsapi.com/api";

  Uri url(
    String path, [
    Map<String, dynamic> params = const {},
  ]) {
    /// creates a URL with a set of parameters which can be used for GET requests.
    /// Creates a URL with the [path] to the API being accessed and fills the URL
    /// with the provided [params].
    /// code from Tyler Codes on YouTube:
    /// https://www.youtube.com/c/TylerCodes
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
}
