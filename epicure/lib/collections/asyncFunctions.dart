import 'package:shared_preferences/shared_preferences.dart';
import 'package:foodie/main.dart';

checkSubscribe() async {
  final pref = await SharedPreferences.getInstance();
  isSubscribe = pref.getBool('isSubscribe') ?? false;
}
setSubscribe() async {
  final pref = await SharedPreferences.getInstance();
  pref.setBool('isSubscribe', isSubscribe);
}