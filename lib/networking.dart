import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper({required this.url});

  final String url;

  Future getData() async {
    var requestUrl = Uri.parse(url);
    http.Response response = await http.get(requestUrl);
    if(response.statusCode == 200){
      String data = response.body;
      return jsonDecode(data);
    }else{
      print('Response Code: ${response.statusCode}');
    }
  }
}