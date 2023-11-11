import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiManager {
  Future<Response> getData(Uri url) async {
    return http.get(url);
  }
}
