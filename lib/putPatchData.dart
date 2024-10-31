import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PutPatchData extends StatefulWidget {
  const PutPatchData({super.key});

  @override
  State<PutPatchData> createState() => _PutPatchDataState();
}

class _PutPatchDataState extends State<PutPatchData> {
  @override
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();
  String result = "Data Masih Kosong";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Put Patch Data'),
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
              var res = await http.put(
                  Uri.parse('https://reqres.in/api/users/2'),
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
