import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class LoginDataSource {
  Future<void> login(String username, String password) async {
    final Uri uri = Uri.parse('https://reqres.in/api/login');
    final Map<String, dynamic> body = {"email": username, "password": password};
    Response response = await post(uri, body: body);
    var responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      log('${responseData is Map<String, dynamic>}');
    } else {
      throw Exception(responseData['error']);
    }
  }
}
