import 'package:flutter_demo/others/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBlack,
      body: Center(
          child: Row(
        children: const [
          Spacer(flex: 150),
          Flexible(
            flex: 730,
            child: FlutterLogo(
              size: double.infinity,
              style: FlutterLogoStyle.horizontal,
              textColor: Colors.white,
            ),
          ),
          Spacer(flex: 200),
        ],
      )),
    );
  }
}

class FutureSplash {
  FutureSplash._();
  static final instance = FutureSplash._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 4));
  }
}
