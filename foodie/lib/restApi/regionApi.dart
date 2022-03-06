import 'dart:convert';

import 'restApi.dart';
import 'package:http/http.dart' as http;

getRegion() async {
  var response = await http.get(Uri.parse('$testUrl$pathRegion'));
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return responseBody;
  }
  return null;
}

getRegionProvince(String provinceName) async {
  var response = await http.get(Uri.parse('$testUrl$pathRegion/$provinceName'));
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return responseBody;
  }
  return null;
}

getRegionSubway() async {
  var response = await http.get(Uri.parse('$testUrl$pathRegionSubway'));
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return responseBody;
  }
  return null;
}

getRegionSubwayProvince(String provinceName) async {
  var response = await http.get(Uri.parse('$testUrl$pathRegionSubway/$provinceName'));
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return responseBody;
  }
  return null;
}

getRegionSubwayProvinceDistrict(String provinceName, String districtName) async {
  var response = await http.get(Uri.parse('$testUrl$pathRegionSubway/$provinceName/$districtName'));
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return responseBody;
  }
  return null;
}

getRegionTown() async {
  var response = await http.get(Uri.parse('$testUrl$pathRegionTown'));
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return responseBody;
  }
  return null;
}