import 'package:food_pics/models/photo.dart';
import 'package:get/get.dart';

import '../service.dart';

class PageControl extends GetxController {
  RxInt page = 1.obs;
  List<Photo> list = <Photo>[].obs;
  RxBool loading = false.obs;

  next() {
    page++;
    getImages();
  }

  prev() {
    page--;
    getImages();
  }

  getImages() async {
    loading.value = true;
    await FlickrService.getImages(page.value).then((value) {
      list.clear();
      list.addAll(value);
      loading.value = false;
    });
  }
}
