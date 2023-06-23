import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/statistical_controller.dart';

class StatisticalView extends GetView<StatisticalController> {
  const StatisticalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatisticalView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StatisticalView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
