import 'package:get/get.dart';
import 'package:livescore_app/app/data/remote/model/leagues.dart';
import 'package:livescore_app/app/data/remote/services/services.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final leagues = LeaguesModel().obs;
  final loadedLeagues = false.obs;

  @override
  void onInit() {
    getLeaguesData();
    super.onInit();
  }

  Future<void> getLeaguesData() async {
    loadedLeagues.value = false;
    leagues.value = (await RemoteServices.getLeagues())!;
    loadedLeagues.value = true;
  }
}
