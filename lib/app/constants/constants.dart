import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//ui_template=https://dribbble.com/shots/15381127-Sports-Live-Score-App-Dark/attachments/7144294?mode=media

const String baseURL = "https://v3.football.api-sports.io/";
const String token = "38a1e88d3c2af91739638978d1d32fe1";

const Color dark = Color(0xff131313);
const Color darkGrey = Color(0xff555555);
const Color focusPink = Color(0xffFF5757);
const Color midGrey = Color(0xff555555);
const Color lightGrey = Color(0xff777777);
const Color transparent = Colors.transparent;
const Color white = Colors.white;

const String logo = "assets/svg/live_logo.svg";

const Map<String, IconData> bottomItemList = {
  "Home": FontAwesomeIcons.house,
  "Football": FontAwesomeIcons.futbol,
  "Standings": FontAwesomeIcons.futbol,
  "Statistic": FontAwesomeIcons.chartBar,
  "Profile": FontAwesomeIcons.user
};
