import 'package:flutter/material.dart';
import 'package:flutter_demo/sections/HttpRequest/Dio/Dio.dart';
import 'package:flutter_demo/sections/StateManagement/FlutterHooks/FlutterHooks.dart';
import 'package:flutter_demo/sections/StateManagement/Riverpod/Riverpod.dart';

final List<Map<String, dynamic>> content = [
  {
    "title": "Animation & Gesture",
    "icon": Icons.animation_rounded,
    "color": const Color(0xFFFF7A7A),
    "list": <Map<String, dynamic>>[
      //
    ],
  },
  {
    "title": "Firebase",
    "icon": Icons.storage_rounded,
    "color": const Color(0xFFFF907A),
    "list": <Map<String, dynamic>>[
      {
        "name": "Cloud Messaging",
      },
    ],
  },
  {
    "title": "HTTP Request",
    "icon": Icons.public_rounded,
    "color": const Color(0xFFFFC17A),
    "list": <Map<String, dynamic>>[
      {
        "name": "Basic",
      },
      {
        "name": "Dio",
        "route": const Dio(),
      }
    ],
  },
  {
    "title": "Interact",
    "icon": Icons.settings_suggest_rounded,
    "color": const Color(0xFFFFDC7A),
    "list": <Map<String, dynamic>>[
      //
    ],
  },
  {
    "title": "Other",
    "icon": Icons.dashboard_rounded,
    "color": const Color(0xFFDCE59F),
    "list": <Map<String, dynamic>>[
      {
        "name": "Project Architecture",
      },
      {
        "name": "Project Stucture",
      },
    ],
  },
  {
    "title": "Package",
    "icon": Icons.library_books,
    "color": const Color(0xFFB0E29F),
    "list": <Map<String, dynamic>>[
      //
    ],
  },
  {
    "title": "State Management",
    "icon": Icons.stream_rounded,
    "color": const Color(0xFFA1DEDC),
    "list": <Map<String, dynamic>>[
      {
        "name": "Flutter Hooks",
        "route": const FlutterHooks(),
      },
      {
        "name": "Riverpod",
        "route": const Riverpod(),
      },
    ],
  },
  {
    "title": "Styling",
    "icon": Icons.color_lens_rounded,
    "color": const Color(0xFF7AB8FF),
    "list": <Map<String, dynamic>>[
      //
    ],
  },
  {
    "title": "Testing",
    "icon": Icons.build_rounded,
    "color": const Color(0xFFB17AFF),
    "list": <Map<String, dynamic>>[
      //
    ],
  },
  {
    "title": "Widget",
    "icon": Icons.widgets_rounded,
    "color": const Color(0xFFF47AFF),
    "list": <Map<String, dynamic>>[
      //
    ],
  },
];
