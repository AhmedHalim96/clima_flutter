import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.url});
  final String url;

  Future getData({latitude, long}) async {
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      var decodedJson = jsonDecode(res.body);

      return decodedJson;
    } else {
      // return res.statusCode;
      print(res.statusCode);
    }
  }
}
