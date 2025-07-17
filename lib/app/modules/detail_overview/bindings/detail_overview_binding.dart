import 'package:get/get.dart';

import '../controllers/detail_overview_controller.dart';

class DetailOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailOverviewController>(
      () => DetailOverviewController(),
    );
  }
}
