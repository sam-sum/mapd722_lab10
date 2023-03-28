import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.hostUrl, this.endPoint, this.queryParameters);
  final String hostUrl;
  final String endPoint;
  final Map<String, String> queryParameters;

  Future<dynamic> getData() async {
    final url = Uri.https(hostUrl, endPoint, queryParameters);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("getData() error: ${response.statusCode}");
    }
  }
}
