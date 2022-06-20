import 'package:get/get.dart';

import 'package:livescore_app/app/modules/deneme/bindings/deneme_binding.dart';
import 'package:livescore_app/app/modules/deneme/views/deneme_view.dart';
import 'package:livescore_app/app/modules/home/bindings/home_binding.dart';
import 'package:livescore_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DENEME,
      page: () => DenemeView(),
      binding: DenemeBinding(),
    ),
  ];
}
