import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:food_pics/models/photo.dart';
import 'package:get/get.dart';

import '../service.dart';

class PageControl extends GetxController {
  RxInt page = 1.obs;
  List<Photo> list = <Photo>[].obs;
  RxBool loading = false.obs;
  RxBool connected = false.obs;

  check() async {
    List<ConnectivityResult> connectivityResults = [
      ConnectivityResult.mobile,
      ConnectivityResult.wifi
    ];
    ConnectivityResult result = await (Connectivity().checkConnectivity());
    if (connectivityResults.contains(result)) {
      // final addresses = await InternetAddress.lookup('example.com');
      // if (addresses.isNotEmpty && addresses[0].rawAddress.isNotEmpty) {
      //   return true;
      // } else {
      //   return false;
      // }
      connected.value = true;
    } else {
      connected.value = false;
    }
  }

  next() async {
    await check();
    if (connected.value) {
      page++;
      getImages();
    }
  }

  prev() async {
    await check();
    if (connected.value) {
      page--;
      getImages();
    }
  }

  getImages() async {
    await check();
    loading.value = true;
    await FlickrService.getImages(page.value).then((value) {
      list.clear();
      list.addAll(value);
      loading.value = false;
    });
  }
}
