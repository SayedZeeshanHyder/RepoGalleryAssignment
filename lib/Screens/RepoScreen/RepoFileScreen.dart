import 'package:assignmentredscope/Models/FilesModel.dart';
import 'package:flutter/material.dart';

class RepoFileScreen extends StatelessWidget {

  final Map<String,dynamic> files;
  RepoFileScreen({required this.files});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Repo Files"),),
      body: files.isEmpty ? Center(child: Text("No Files Found"),) : ListView.builder(itemBuilder: (context,index){
        String key = files.keys.elementAt(index);
        FileModel file = FileModel.fromJson(files.values.elementAt(index));
        List<String> fileNameSplit = file.filename!.split(".");
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            elevation: 10,
            shadowColor: Colors.green,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("File Name : ${fileNameSplit[0]}"),
                  Text("File Size : ${file.size}"),
                  Text("Language : ${file.language}"),
                  Text("File Format : ${fileNameSplit.last}")
                ],
              ),
            ),
          ),
        );
      },itemCount: files.length,),
    );
  }
}
