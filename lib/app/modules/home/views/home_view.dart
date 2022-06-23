import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:livescore_app/app/constants/constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            iconTheme: IconThemeData(color: lightGrey),
            shadowColor: transparent,
            backgroundColor: transparent,
            title: SvgPicture.asset(
              logo,
              height: 30,
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              )
            ],
          ),
          drawer: Drawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(children: [
                _topCategoryListView(),
                _livescoreListView(),
                _newsListView()
              ]),
            ),
          ),
          bottomNavigationBar: Obx(
            () => _buildBottomNav(homeController),
          )),
    );
  }

  Widget _newsListView() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("Latest News",
                style: TextStyle(
                    fontSize: 20, color: white, fontWeight: FontWeight.bold)),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (var i = 0; i < 3; i++)
              Container(
                margin: const EdgeInsets.only(top: 18.0),
                //padding: const EdgeInsets.only(top: 18.0),
                width: Get.width * .9,
                height: Get.height * .25,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(newsImageList[i])),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              )
          ]),
        ]);
  }

  Widget _livescoreListView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 18, 0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Live Matches",
                style: TextStyle(
                    fontSize: 20, color: white, fontWeight: FontWeight.bold)),
            Text("VIEW ALL",
                style: TextStyle(color: lightGrey, fontWeight: FontWeight.bold))
          ]),
        ),
        Container(
          width: Get.width,
          height: Get.height * .3,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: ((context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Container(
                        //margin: EdgeInsets.fromLTRB(8, 20, 8, 20),
                        width: Get.width * .37,
                        height: Get.height * .23,
                        //child: ,
                        decoration: BoxDecoration(
                            color: cardColor[index],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ],
                );
              })),
        ),
      ],
    );
  }

  Widget _topCategoryListView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: Get.width * .9,
              height: Get.height * .2,
              decoration: BoxDecoration(
                  color: dark,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25))),
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
                  Flexible(
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: CircleAvatar(
                                radius: 30,
                                backgroundColor: circleColor[index]),
                          );
                        }),
                        itemCount: circleColor.length,
                      ),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }

  BottomNavigationBar _buildBottomNav(HomeController homeController) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: focusPink,
      selectedIconTheme: IconThemeData(size: 26),
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
