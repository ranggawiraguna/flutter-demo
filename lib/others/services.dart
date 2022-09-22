import 'package:flutter/material.dart';

class Services {
  late final BuildContext _context;

  Services(this._context);

  double getWidth() => MediaQuery.of(_context).size.width;

  double getHeight() =>
      MediaQuery.of(_context).size.height - MediaQuery.of(_context).padding.top;

  double getSize(double value) => getWidth() * (value / 1080);

  void showSnackBar(String text) {
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Folks',
          ),
        ),
      ),
    );
  }
}
