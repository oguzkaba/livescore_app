import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:livescore_app/app/constants/constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: lightGrey),
          shadowColor: transparent,
          backgroundColor: transparent,
          title: SvgPicture.asset(
            logo,
            height: 30,
          ),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        drawer: Drawer(),
        body: Column(children: [
          Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: Get.width * .9,
                height: Get.height * .15,
                decoration: BoxDecoration(
                    color: dark,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Leagues",
                              style: TextStyle(fontSize: 18, color: white)),
                          Text("VIEW ALL",
                              style: TextStyle(
                                  color: midGrey, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: CircleAvatar(radius: 35),
                            );
                          }),
                          itemCount: 20,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ]),
        bottomNavigationBar: Obx(
          () => _buildBottomNav(homeController),
        ));
  }

  BottomNavigationBar _buildBottomNav(HomeController homeController) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: focusPink,
      unselectedItemColor: midGrey,
      iconSize: 20,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) => homeController.bottomIndex.value = index,
      items: bottomItemList.entries
          .map(
              (e) => BottomNavigationBarItem(label: e.key, icon: Icon(e.value)))
          .toList(),
      currentIndex: homeController.bottomIndex.value,
      backgroundColor: dark,
    );
  }
}
