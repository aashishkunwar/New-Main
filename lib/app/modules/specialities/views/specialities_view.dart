import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/specialities_controller.dart';

class SpecialitiesView extends GetView<SpecialitiesController> {
  const SpecialitiesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpecialitiesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SpecialitiesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
