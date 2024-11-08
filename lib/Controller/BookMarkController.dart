import 'package:assignmentredscope/Services/SharedPreferencesService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookMarkController extends GetxController{

  RxList<String> bookmarks = [""].obs;

  @override
  void onInit() {
    super.onInit();
    bookmarks.value = SharedPreferencesService.loadBookMarks();
    print("Loaded Bookmarks as $bookmarks");
  }

  updateBookMarkValue(String imageUrl)async{
    if(bookmarks.contains(imageUrl)){
      bookmarks.remove(imageUrl);
      Get.snackbar("BookMark Removed", "Image was removed from BookMarks Successfully",backgroundColor: Colors.white,colorText: Colors.black,snackPosition: SnackPosition.BOTTOM);
    }else{
      bookmarks.add(imageUrl);
      Get.snackbar("BookMark Added", "Image was added in BookMarks Successfully",backgroundColor: Colors.white,colorText: Colors.black,snackPosition: SnackPosition.BOTTOM);
    }
    await SharedPreferencesService.updateBookMarks(bookmarks);
  }

}