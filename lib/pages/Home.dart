import 'package:flutter/material.dart';
import 'package:flutter_demo/others/colors.dart';
import 'package:flutter_demo/others/services.dart';
import 'package:flutter_demo/widgets/PageContainer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final Services services;

  @override
  void initState() {
    services = Services(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Column(
        children: [
          Container(
            height: services.getSize(130),
            color: AppColors.deepBlack,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: services.getSize(20)),
                child: Text(
                  "Material Section",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Folks',
                    fontSize: services.getSize(48),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
