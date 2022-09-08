// ignore_for_file: non_constant_identifier_names, file_names
import 'package:flutter/material.dart';
import 'package:flutter_demo/others/services.dart';

class PageContainer extends StatefulWidget {
  final Widget child;

  const PageContainer({Key? key, required this.child}) : super(key: key);

  @override
  State<PageContainer> createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  late final Services services;

  @override
  void initState() {
    services = Services(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SizedBox(
        width: services.getWidth(),
        height: services.getHeight(),
        child: widget.child,
      ),
    );
  }
}
