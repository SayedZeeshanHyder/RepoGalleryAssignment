import 'package:assignmentredscope/Screens/GalleryScreen/BookMarkScreen.dart';
import 'package:assignmentredscope/Screens/GalleryScreen/GalleryList.dart';
import 'package:assignmentredscope/Screens/RepoScreen/RepoListScreen.dart';
import 'package:assignmentredscope/Services/ApiService.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  bool isLoading = false;

  refresh() async {
    setState(() {
      isLoading = true;
    });
    bool didGetData = await ApiService.getDataFromApi();
    if (!didGetData) {
      Get.snackbar(
        "Umable to Refresh",
        "Check your Internet Connection and try again",
      );
    }

    //Adding this InkDrop Just for UI Purpose cause it Looks Good :)
    await Future.delayed(const Duration(seconds: 3),);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      RepoListScreen(),
      GalleryScreen(),
    ];
    return Scaffold(
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              onPressed: refresh,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              child: isLoading ? LoadingAnimationWidget.inkDrop(color: Colors.black, size: 25) : Icon(Icons.refresh,),
            )
          : SizedBox(),
      appBar: AppBar(
        title: Text(
          currentIndex == 0 ? "Repositories" : "Gallery",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
        actions: [
          currentIndex == 1
              ? IconButton(
                  onPressed: () {
                    Get.to(
                      () => BookmarkScreen(),
                    );
                  },
                  icon: Icon(
                    Icons.bookmark,
                  ),
                )
              : SizedBox(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey.shade600,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.code,
              ),
              label: "Repos"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.image,
              ),
              label: "Gallery"),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: pages[currentIndex],
    );
  }
}
