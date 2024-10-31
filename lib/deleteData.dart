import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteData extends StatelessWidget {
  const DeleteData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Data'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var res =
                await http.delete(Uri.parse("https://reqres.in/api/users/2"));
            print(res.body);
            if (res.statusCode == 204) {
              print("Data Terhapus");
            } else {
              print("Gagal hapus cuy");
            }
          },
          child: Text('Hapuskeun!'),
        ),
      ),
    );
  }
}
