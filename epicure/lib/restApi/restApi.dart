// https://flutter.dev/docs/cookbook/networking/fetch-data

import 'dart:convert';

import 'package:http/http.dart' as http;

String baseUrl = 'https://www.epicure.co.kr';
String route = '/android/';

String path_login = "usr/login.php";
String path_regist = "usr/regist.php";
String path_forget = "usr/reqlogin.php";
String path_buy_coupon = "usr/buy_coupon.php";
String path_use_coupon = "usr/use_coupon.php";
String path_gift_coupon = "usr/gift_coupon.php";
String path_send_coupon = "usr/send_coupon.php";
String path_region_list = "service/region.php";
String path_detail = "service/detail.php";
String path_town = "service/town.php";
String path_subway = "service/subway.php";
String path_scrap = "service/scrap.php";
String path_trial_scrap = "service/trial_scrap.php";
String path_check = "service/check.php";
String path_surround = "service/surround.php";
String path_evaluate = "service/evaluate.php";
String path_report = "service/report.php";
String path_qna = "service/qna.php";
String path_coupon = "service/coupon.php";
String path_fcm = "service/fcm.php";
String path_region3rd = "service/region_3rd.php";
String path_search = "service/search.php";
String path_info_change = "usr/change_info.php";
String path_my_evaluation = "usr/my_evaluation.php";
String path_find_user = "usr/find_user.php";
String path_change_evaluation = "service/change_evaluation.php";
String path_check_premium_user = "service/check_premium_user.php";
String path_check_my_coupon_list = "usr/my_coupon_list.php";
String path_check_my_received_coupon_list = "usr/my_received_coupon_list.php";
String path_review_list = "usr/review_list.php";
String path_invisible_coupon = "usr/invisible_coupon.php";
String path_find_sns_user = "usr/find_sns_user.php";
String path_error_log = "service/error_logger.php";
String path_check_version_code = "service/check_version_code.php";
String path_check_passwd = "usr/check_passwd.php";
String path_find_dong_list = "service/find_dong_list.php";



Future trialScrap() async {
  final response = await http.get(Uri.parse('$baseUrl$route$path_trial_scrap'));
  if(response.statusCode == 200) {
    print(json.decode(response.body));
    print(json.decode(response.body)['content'][0]);
    return json.encode(response.body);
  }
  else {
    print('error');
    return response.body;
  }
}