import 'package:flutter/cupertino.dart';

class Services {
  late final BuildContext context;

  Services(this.context);

  double getWidth() => MediaQuery.of(context).size.width;

  double getHeight() =>
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  double getSize(double value) => getWidth() * (value / 1080);
}
