// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_demo/others/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DialogView extends StatelessWidget {
  final bool isActive;
  final Column child;
  final Function()? closeAction;

  const DialogView({
    Key? key,
    required this.isActive,
    required this.child,
    this.closeAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Services services = Services(context);

    return Stack(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: isActive
              ? SizedBox(
                  key: const ValueKey<int>(1),
                  width: double.infinity,
                  height: double.infinity,
                  child: Container(
                    color: const Color(0x66000000),
                  ),
                )
              : const SizedBox(key: ValueKey<int>(0), width: 0, height: 0),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: isActive
              ? Center(
                  key: const ValueKey<int>(1),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: services.getSize(25),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                services.getSize(
                                  50,
                                ),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: services.getSize(120),
                                    maxHeight: services.getHeight() -
                                        services.getSize(420),
                                  ),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        services.getSize(
                                          20,
                                        ),
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      padding: EdgeInsets.only(
                                        top: services.getSize(100),
                                        left: services.getSize(75),
                                        right: services.getSize(75),
                                        bottom: services.getSize(75),
                                      ),
                                      child: child,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            closeAction != null
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    child: SizedBox(
                                      width: services.getSize(100),
                                      height: services.getSize(100),
                                      child: IconButton(
                                        onPressed: closeAction,
                                        padding: const EdgeInsets.all(0),
                                        splashRadius: 1,
                                        icon: SvgPicture.asset(
                                          "assets/icons/CloseDialog.svg",
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(key: ValueKey<int>(0), width: 0, height: 0),
        ),
      ],
    );
  }
}
