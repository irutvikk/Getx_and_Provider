import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Providerpage extends StatelessWidget {

  TextEditingController a1 = TextEditingController();
  TextEditingController a2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider")),
      body: ChangeNotifierProvider(
        create: (context) => ProviderCalculation(),
        child: Consumer<ProviderCalculation>(
          builder: (context, value, child) {
            return Column(
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
                    child: Text("Sum = ${value.ans}",style: TextStyle(fontSize: 30),)),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      int a =int.parse(a1.text);
                      int b = int.parse(a2.text);

                      value.providerSum(a, b);

                    },
                    child: Text("Calculate"))
              ],
            );
          },
        ),
      ),
    );
  }
}
class ProviderCalculation extends ChangeNotifier{
  int ans=0;

void providerSum(int a, int b){
  ans=a+b;
  notifyListeners();
}
}
