import 'package:flutter/material.dart';
import 'package:flutter_demo/others/colors.dart';
import 'package:flutter_demo/others/services.dart';

class CardInfo extends StatelessWidget {
  final String title;
  final int count;

  const CardInfo({Key? key, required this.title, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Services services = Services(context);

    return AspectRatio(
      aspectRatio: 8 / 9,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Card(
          clipBehavior: Clip.hardEdge,
          color: AppColors.deepBlack,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: services.getSize(160),
                  height: services.getSize(160),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(1000),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: services.getSize(160),
                  height: services.getSize(160),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(1000),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: services.getSize(40),
                    left: services.getSize(50),
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Folks',
                      fontWeight: FontWeight.bold,
                      fontSize: services.getSize(42),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: services.getSize(40),
                    right: services.getSize(50),
                  ),
                  child: Text(
                    "Total\nCount",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Folks',
                      fontSize: services.getSize(42),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Folks',
                    fontWeight: FontWeight.bold,
                    fontSize: services.getSize(84),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
