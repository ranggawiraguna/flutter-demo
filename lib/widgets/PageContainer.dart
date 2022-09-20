import 'package:flutter/material.dart';
import 'package:flutter_demo/others/colors.dart';
import 'package:flutter_demo/others/services.dart';

class PageContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final bool withBackButton;

  const PageContainer({
    Key? key,
    required this.title,
    required this.child,
    this.withBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Services services = Services(context);

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SizedBox(
        width: services.getWidth(),
        height: services.getHeight(),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(minHeight: services.getSize(130)),
              color: AppColors.deepBlack,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  withBackButton
                      ? IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          padding: const EdgeInsets.only(bottom: 7),
                          icon: Icon(
                            Icons.keyboard_arrow_left_rounded,
                            color: Colors.white,
                            size: services.getSize(100),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: services.getSize(20)),
                        child: Text(
                          title,
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
                  withBackButton
                      ? Opacity(
                          opacity: 0,
                          child: IconButton(
                            onPressed: null,
                            padding: const EdgeInsets.only(bottom: 7),
                            icon: Icon(
                              Icons.keyboard_arrow_left_rounded,
                              color: Colors.white,
                              size: services.getSize(100),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFF7F7FE),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
