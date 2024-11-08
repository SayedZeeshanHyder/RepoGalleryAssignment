import 'dart:math';

import 'package:assignmentredscope/Controller/BookMarkController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class BookmarkScreen extends StatelessWidget {
  final BookMarkController bookMarkController = Get.find<BookMarkController>();
  final random = Random();

  final List<List<int>> tileSizes = [
    [1, 1],
    [2, 1],
    [1, 2],
    [2, 2],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: bookMarkController.bookmarks.isEmpty? Center(child: Text("No Bookmarks Yet"),) : ListView(
        children: [
          StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: bookMarkController.bookmarks.map((imageUrl) {
              final List<int> size = tileSizes[random.nextInt(tileSizes.length)];
              int crossAxisCellCount = size[0];
              int mainAxisCellCount = size[1];
              return StaggeredGridTile.count(
                crossAxisCellCount: crossAxisCellCount,
                mainAxisCellCount: mainAxisCellCount,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
