import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_pics/controllers/page.dart';
import 'package:food_pics/models/photo.dart';
import 'package:food_pics/screens/second_screen.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late Future<List<Photo>> photos;
  PageControl page = Get.put(PageControl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Pics'),
        actions: [
          IconButton(onPressed: page.getImages, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => page.loading.value
                    ? SizedBox(
                        height: Get.mediaQuery.size.height * 0.7,
                        child: const Center(child: CircularProgressIndicator()))
                    : CarouselSlider.builder(
                        itemCount: page.list.length,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            // color: Colors.red,
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                    () => SecondScreen(
                                          photo: page.list[index],
                                        ),
                                    duration: const Duration(milliseconds: 300),
                                    transition: Transition.fade);
                              },
                              child: Hero(
                                tag: '${page.list[index].id}',
                                child: Image.network(
                                    'https://live.staticflickr.com/${page.list[index].server}/${page.list[index].id}_${page.list[index].secret}.jpg'),
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                            height: Get.mediaQuery.size.height * 0.7,
                            enableInfiniteScroll: false))
                // Column(
                //         children: List.generate(page.list.length,
                //             (index) => Text(page.list[index].title ?? '')),
                //       ),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                        onPressed: page.page.value == 1
                            ? null
                            : () {
                                page.prev();
                              },
                        icon: const Icon(Icons.arrow_back_rounded),
                        label: const Text('Back')),
                  ),
                ),
                Obx(() => Text(page.page.value.toString())),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                      onPressed: () {
                        page.next();
                      },
                      icon: const Icon(Icons.arrow_forward_rounded),
                      label: const Text('Next')),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    page.getImages();
  }
}
