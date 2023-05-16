import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxSumPage extends StatelessWidget {

  TextEditingController a1 = TextEditingController();
  TextEditingController a2 = TextEditingController();

  double ans=0.0;
  GetxCalculation getx = Get.put(GetxCalculation());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Sum"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: a1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Value 1"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: a2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Value 1"),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 50,
                alignment: Alignment.center,
                width: double.infinity,
                child: Obx(() => Text("Sum : ${getx.ans.value}",style: TextStyle(fontSize: 30),))
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  int a =int.parse(a1.text);
                  int b = int.parse(a2.text);
                  getx.sum(a, b);
                  print("displaying width = ${Get.size.width}");
                },
                child: Text("Calculate"))
          ],
        ),
      ),
    );
  }
}

class GetxCalculation extends GetxController {
  RxInt ans = 0.obs;

  void sum(int a, int b) {
    if(a!=null && b!=null){
      ans.value = (a + b);
    }
  }
}
