import 'package:assignmentredscope/Controller/BookMarkController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final images = List.generate(10, (index) => 'https://picsum.photos/200/300?random=$index');

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(4),
          child: GestureDetector(
            onTap: () {
              Get.to(()=>FullScreenImage(imageUrl: images[index],),transition: Transition.downToUp);
            },
            child: Image.network(images[index],fit: BoxFit.fill,),
          ),
        );
      },
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  FullScreenImage({required this.imageUrl});

  final BookMarkController bookMarkController = Get.find<BookMarkController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Obx(()=> Icon(bookMarkController.bookmarks.contains(imageUrl) ? Icons.bookmark : Icons.bookmark_border)),
            onPressed: () {
              bookMarkController.updateBookMarkValue(imageUrl);
            },
          )
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: InteractiveViewer(
          child: Image.network(imageUrl,fit: BoxFit.fill,),
        ),
      ),
    );
  }
}
