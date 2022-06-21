import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../controllers/home_controller.dart';

class DeprecateCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.put(HomeController());
    var forList =
        List.generate(30, (int index) => index * index, growable: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => _homeController.loadedLeagues.value
            ? ListView.builder(
                itemCount: _homeController.leagues.value.response!.length,
                itemBuilder: (context, index) {
                  return StickyHeader(
                      header: Container(
                        height: 30.0,
                        color: Colors.blueGrey[700],
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.network(
                                  _homeController.leagues.value.response![index]
                                      .country!.flag
                                      .toString(),
                                  height: 18),
                            ),
                            Text(
                              "${_homeController.leagues.value.response![index].country!.name} - "
                              "${_homeController.leagues.value.response![index].league!.name}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      content: SizedBox(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: forList.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Text(
                                    forList[index].toString(),
                                  ),
                                );
                              })));
                })
            : SizedBox()),
      ),
    );
  }
}
