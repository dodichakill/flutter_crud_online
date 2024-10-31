import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();
  String result = "Data Masih Kosong";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Data'),
      ),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        TextField(
            controller: nameC,
            decoration: InputDecoration(label: Text('Name'))),
        TextField(
            controller: jobC, decoration: InputDecoration(label: Text('Job'))),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () async {
              var res = await http.post(
                  Uri.parse('https://reqres.in/api/users'),
                  body: {"name": nameC.text, "job": jobC.text});

              print(res.body);
              setState(() {
                result = res.body;
              });
            },
            child: const Text('Submit')),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),
        Text(result)
      ]),
    );
  }
}
