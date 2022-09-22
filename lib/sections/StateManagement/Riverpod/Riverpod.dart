import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/PageContainer.dart';

class Riverpod extends StatefulWidget {
  const Riverpod({Key? key}) : super(key: key);

  @override
  State<Riverpod> createState() => _RiverpodState();
}

class _RiverpodState extends State<Riverpod> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: 'Riverpod',
      withBackButton: true,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
