import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class Providerapipage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Sum"),
      ),
      floatingActionButton: InkWell(onTap: () {
        Demoapiprovider().fetchdata();
      },child: Icon(Icons.refresh)),
      body: Column(
        children: [
          Container(color: Colors.green.shade200,height: 80,child: FloatingActionButton(onPressed: () {
            Demoapiprovider().fetchdata();
          },)),
          ChangeNotifierProvider(
            create: (context) => Demoapiprovider(),
            builder: (context, child) {
              return  Consumer<Demoapiprovider>(
                builder: (context, value, child) {
                 if(value.vv.isEmpty){
                   return Center(child: CircularProgressIndicator());
                 }
                 else{
                   return Expanded(
                     child: ListView.builder(
                       itemCount: value.vv.length,
                       itemBuilder: (context, index) {
                       return Card(child: Text("${value}"),);
                     },),
                   );
                 }
                },

              );
            },

          ),
        ],
      ),
    );
  }
}

class Demoapiprovider extends ChangeNotifier{
  List vv = [];

  Future<void> fetchdata() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/quotes'));
    var data = jsonDecode(response.body);
    vv = data['quotes'];
    print("vv=$vv");
    notifyListeners();
  }

}
