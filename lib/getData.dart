import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetData extends StatefulWidget {
  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  String result = "tidak ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Data'),
        ),
        body: Column(
          children: [
            Text(result),
            ElevatedButton(
              onPressed: () async {
                var res =
                    await http.get(Uri.parse("https://reqres.in/api/users/2"));
                print(res.body);
                if (res.statusCode == 200) {
                  Map<String, dynamic> data =
                      json.decode(res.body) as Map<String, dynamic>;
                  setState(() {
                    result =
                        '${data["data"]["email"]} - ${data["data"]["first_name"]} ${data["data"]["last_name"]}';
                  });
                  print(res.body);
                } else {
                  print("error cuy");
                }
              },
              child: Text("Get"),
            )
          ],
        ));
  }
}
