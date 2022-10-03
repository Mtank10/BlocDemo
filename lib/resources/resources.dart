import 'dart:convert';
import 'package:http/http.dart';
import '../models/model.dart';


class UserData {
  String endpoint = 'https://jsonplaceholder.typicode.com/users';
  Future<List<CustomerModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200){
      final List result = jsonDecode(response.body);
      print(result.length);
      return result.map(((e) => CustomerModel.fromJson(e))).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}