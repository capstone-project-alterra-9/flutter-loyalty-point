import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class QrView extends StatelessWidget {
  static const routeName = "/qr";
  const QrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text("halaman qr view apabila ada"),
      ),
    );
  }
}
