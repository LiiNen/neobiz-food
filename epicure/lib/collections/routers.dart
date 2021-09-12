import 'package:flutter/material.dart';
import 'functions.dart';

import 'package:foodie/loginView/signInView.dart';
import 'package:foodie/loginView/signUpView.dart';

import 'package:foodie/homeView.dart';

void homeRoute(BuildContext context) { navigatorPush(context: context, route: HomeView(), isReplace: true); }
void welcomeRoute(BuildContext context) { navigatorPush(context: context, route: WelcomeView(), isReplace: true); }
void loginRoute(BuildContext context) { navigatorPush(context: context, route: SignInView(), isReplace: true);}