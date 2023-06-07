import 'package:http/http.dart' as http;
class HttpService {

  Future<http.Response> get(String url) async {
    http.Response? response;
    try{
      response = await http.get(Uri.parse(url));
      return response;
    } catch (e){
      rethrow;
    }
  }
}