import 'package:flutter/material.dart';
import 'package:foodie/mainNavView/mainNavView.dart';
import 'functions.dart';

import 'package:foodie/loginView/signInView.dart';
import 'package:foodie/loginView/signUpView.dart';

import 'package:foodie/mainNavView/homeView/homeView.dart';

void homeRoute(BuildContext context) { navigatorPush(context: context, route: HomeView(), isReplace: true); }
void welcomeRoute(BuildContext context) { navigatorPush(context: context, route: WelcomeView(), isReplace: true); }
void loginRoute(BuildContext context) { navigatorPush(context: context, route: SignInView(), isReplace: true);}
void navRoute(BuildContext context) { navigatorPush(context: context, route: MainNavView());}