import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/deneme_controller.dart';

class DenemeView extends GetView<DenemeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DenemeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DenemeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
