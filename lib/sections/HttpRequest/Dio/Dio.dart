import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/PageContainer.dart';

class Dio extends StatefulWidget {
  const Dio({Key? key}) : super(key: key);

  @override
  State<Dio> createState() => _DioState();
}

class _DioState extends State<Dio> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: 'Dio',
      withBackButton: true,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
