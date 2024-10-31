import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AutoGet extends StatelessWidget {
  AutoGet({super.key});

  Future getAllUsers() async {
    try {
      var res = await http.get(Uri.parse("https://reqres.in/api/users"));
      var data = (json.decode(res.body) as Map<String, dynamic>)["data"];
      data.forEach((e) => allUser.add(e));
    } catch (e) {
      print(e);
    }
  }

  List allUser = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Future Builder'),
        ),
        body: FutureBuilder(
          future: getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // You can access the data here
              var data = snapshot.data;
              return ListView.builder(
                itemCount: allUser.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(allUser[index]["avatar"]),
                    ),
                    title: Text("Nama"),
                    subtitle: Text("Subtitle"),
                  );
                },
              );
            } else if (snapshot.hasError) {
              // You can handle the error here
              return Text('Error: ${snapshot.error}');
            } else {
              // You can show a loading indicator here
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
