import 'package:flutter/material.dart';
import 'package:food_pics/controllers/page.dart';
import 'package:food_pics/models/photo.dart';
import 'package:food_pics/models/photo_info.dart';
import 'package:food_pics/service.dart';
import 'package:get/get.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.photo}) : super(key: key);
  final Photo photo;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  PhotoInfo? _info;
  PageControl page = Get.find();
  String comment = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Food Pics'),
        ),
        body: Obx(
          () => page.connected.value
              ? ListView(
                  children: [
                    Hero(
                      tag: '${widget.photo.id}',
                      child: Image.network(
                        'https://live.staticflickr.com/${widget.photo.server ?? ''}/${widget.photo.id ?? ''}_${widget.photo.secret ?? ''}.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    if (_info != null && _info?.id != null)
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _info?.title?.content ?? '',
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              _info?.description?.content ?? '',
                              style: const TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 12),
                            const Divider(thickness: 1),
                            Text(
                              'Comments(${_info?.comments?.content})',
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              onChanged: (text) => setState(() {
                                comment = text;
                              }),
                              maxLength: 130,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: Colors.grey))),
                            ),
                            Visibility(
                                visible: comment.isNotEmpty,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Submit')))
                          ],
                        ),
                      ),
                  ],
                )
              : const Center(
                  child: Text('Internet unavailable'),
                ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  void getInfo() async {
    await page.check();
    if (page.connected.value) {
      _info = await FlickrService.getInfo(
          photoSecret: widget.photo.secret ?? '',
          photoId: widget.photo.id ?? '');
      setState(() {});
    }
  }
}
