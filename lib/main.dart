import 'package:crud_online/autoGet.dart';
import 'package:crud_online/deleteData.dart';
import 'package:crud_online/getData.dart';
import 'package:crud_online/postData.dart';
import 'package:crud_online/putPatchData.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AutoGet(),
      debugShowCheckedModeBanner: false,
    );
  }
}
