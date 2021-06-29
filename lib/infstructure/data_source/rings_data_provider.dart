import 'dart:html';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RingsDataProvider {
  static Future<List<dynamic>> getRinsgFutureList() async {
    final _url = Uri.parse('http://localhost:3000/rings');
    final _response = await http.Client().get(_url);

    final List<dynamic> _responseList =
        convert.jsonDecode(_response.body)['products'];
    print(_responseList);
    return _responseList;
  }
}
