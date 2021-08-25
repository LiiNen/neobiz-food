import 'dart:convert';
import 'package:http/http.dart' as http;
import 'restApi.dart';

findAccount({required String name, required String email}) async {
  var requestBody = Map<String, dynamic>();
  requestBody['name'] = name;
  requestBody['email'] = email;

  return await findAccountApi(requestBody: requestBody);
}
findAccountApi({required Map<String, dynamic> requestBody}) async {
  var response = await http.post(Uri.parse('$baseUrl$path_forget'), body: requestBody);

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    print(responseBody);

    if(responseBody != null && responseBody['result'] == 'success') {
      return 0;
    } else {
      return 1;
    }
  } else {
    return -1;
  }
}