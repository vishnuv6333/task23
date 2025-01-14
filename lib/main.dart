import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/utils/init_state_utils.dart';
import 'routes/routes.dart';
import 'routes/routes_contant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteList.initial,
      getPages: Routes.getPages(),
      title: 'Task23',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
