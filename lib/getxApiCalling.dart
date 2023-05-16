import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class Getxapicallingpage extends StatelessWidget {
  final Demoapi dm = Get.put(Demoapi());

  @override
  Widget build(BuildContext context) {
    dm.fetchdata();
    return Scaffold(
      appBar: AppBar(
        title: Text('Get API data with GetX'),
      ),
      body: Obx(() => dm.data.value.isNotEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              ),
      ),
    );
  }
}

class Demoapi extends GetxController {
  var data = {}.obs;

  Future<void> fetchdata() async {
    var response = await http.get(Uri.parse('https://www.foodchow.com/api/FoodChowWD/AllRestaurantsWDOfferApp?Country=India&city=Surat&area=&longitude=&latitude=&deliveryMethod=&cuisineId=2,1&clientid=&startlimit=0&endlimit=1000&onoffflag'));
    data.value = jsonDecode(response.body);
    print(data.value);
  }
}
