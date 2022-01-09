import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final int point;
  UserInfo({required int this.id, required String this.name, required String this.email, required String this.phone, required String this.address, required int this.point});
}
Future<UserInfo> getUserInfo() async {
  final pref = await SharedPreferences.getInstance();
  int id = pref.getInt('userId') ?? 0;
  String name = pref.getString('name') ?? '';
  String email = pref.getString('email') ?? '';
  String phone = pref.getString('phone') ?? '';
  String address = pref.getString('address') ?? '';
  int point = pref.getInt('point') ?? 0;
  return UserInfo(id: id, name: name, email: email, phone: phone, address: address, point: point);
}
setUserInfo({required int id, required String name, required String email, required String phone, required String address, required int point}) async {
  final pref = await SharedPreferences.getInstance();
  pref.setInt('userId', id);
  pref.setString('name', name);
  pref.setString('email', email);
  pref.setString('phone', phone);
  pref.setString('address', address);
  pref.setInt('point', point);
}
deleteUserInfo() async {
  final pref = await SharedPreferences.getInstance();
  pref.remove('userId');
  pref.remove('name');
  pref.remove('email');
  pref.remove('phone');
  pref.remove('address');
  pref.remove('point');
}