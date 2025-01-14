import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task23/presentation/home.dart';

import 'routes_contant.dart';

class Routes {
  static Map<String, Widget> routes() => {
        RouteList.initial: const HomeScreen(),
      };
  static List<GetPage> getPages() {
    List<GetPage> pages = [];
    routes().forEach((key, value) {
      pages.add(GetPage(name: key, page: () => value));
    });
    return pages;
  }
}
