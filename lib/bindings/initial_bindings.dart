import 'package:fnf_womentorship/controllers/auth_controller.dart';
import 'package:fnf_womentorship/controllers/theme_controller.dart';
import 'package:get/get.dart';


class InitialBindings implements Bindings{

  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    }

}