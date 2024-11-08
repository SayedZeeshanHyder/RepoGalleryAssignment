import 'package:assignmentredscope/Screens/ErrorScreen/ErrorScreen.dart';
import 'package:assignmentredscope/Screens/HomeScreen/HomeScreen.dart';
import 'package:assignmentredscope/Services/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {


  navigate()async{
    bool didGetData = await ApiService.getDataFromApi();
    if(didGetData){
      Get.off(()=>HomeScreen(),);
    }else{
      Get.off(()=>ErrorScreen(),);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(future: navigate(), builder: (context,snapshot){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Lottie.asset("assets/lotties/splashlottie.json",repeat: true),
              ),
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: "Red",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),),
                  TextSpan(text: " Scope",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 20,),),
                ]
              ),),
            ],
          ),
        );
      }),
    );
  }


}
