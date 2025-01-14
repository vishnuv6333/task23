import 'package:get/get.dart';

import '../../di/dependency_injection.dart';

class InitialBindings extends Bindings {
  @override
  dependencies() async {
    DependencyInjection.init();
  }
}
