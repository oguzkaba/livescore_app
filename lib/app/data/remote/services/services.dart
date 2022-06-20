import 'package:http/http.dart' as http;
import 'package:livescore_app/app/data/remote/model/leagues.dart';

class RemoteServices {
  static Future<LeaguesModel?> getLeagues() async {
    var headers = {
      "accept": "*/*",
      'origin': '*',
      'x-rapidapi-key': '38a1e88d3c2af91739638978d1d32fe1',
      'x-rapidapi-host': 'v3.football.api-sports.io'
    };
    var request = http.Request(
        'GET', Uri.parse('https://v3.football.api-sports.io/leagues'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var result = leaguesModelFromJson(await response.stream.bytesToString());
      return result;
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }
}
