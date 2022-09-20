import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/others/colors.dart';
import 'package:flutter_demo/pages/SectionList.dart';
import 'package:flutter_demo/pages/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(
    FutureBuilder(
      future: FutureSplash.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: AppColors.deepBlack,
              shadowColor: Colors.transparent,
            ),
          ),
          home: snapshot.connectionState == ConnectionState.waiting
              ? const SplashScreen()
              : const SectionList(),
        );
      },
    ),
  );
}
