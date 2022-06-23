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

const List<Color> cardColor = [
  Color(0xff2648D1),
  Color(0xffEAEAEA),
  Color(0xffFB5266)
];

const List<Color> circleColor = [
  Color(0xff57574B),
  Color(0xffEAEAEA),
  Color(0xffFB5266),
  Color(0xff39003C),
  Color(0xffD5DC3D),
];

const List<String> newsImageList = [
  "https://ichef.bbci.co.uk/images/ic/896x504/p08tldgz.jpg",
  "https://ichef.bbci.co.uk/live-experience/cps/480/cpsprodpb/260B/production/_125593790_jamie_overton_reuters2.jpg",
  "https://images.theconversation.com/files/466578/original/file-20220601-49499-zn0ef9.jpg?ixlib=rb-1.1.0&rect=23%2C0%2C2627%2C1313&q=45&auto=format&w=668&h=350&fit=crop"
];

const Map<String, IconData> bottomItemList = {
  "Home": FontAwesomeIcons.house,
  "Football": FontAwesomeIcons.futbol,
  "Standings": FontAwesomeIcons.chartColumn,
  "Statistic": FontAwesomeIcons.chartBar,
  "Profile": FontAwesomeIcons.user
};
