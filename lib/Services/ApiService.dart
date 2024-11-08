import 'dart:convert';

import 'package:assignmentredscope/Services/SharedPreferencesService.dart';
import 'package:assignmentredscope/apivariable.dart';
import 'package:http/http.dart' as http;
class ApiService{

  static Future<bool> getDataFromApi()async{
    try {
      final response = await http.get(
          Uri.parse(repoDataApi), headers: jsonHeader);
      final decodedData = jsonDecode(response.body);
      print(decodedData[0]);
      await SharedPreferencesService.updateData(jsonEncode(decodedData),);
      await SharedPreferencesService.setDataCacheAvailableTrue();
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }


}