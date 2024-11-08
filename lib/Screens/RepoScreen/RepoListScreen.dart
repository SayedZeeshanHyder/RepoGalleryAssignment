import 'dart:convert';
import 'package:assignmentredscope/Screens/RepoScreen/RepoFileScreen.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:assignmentredscope/Models/GithubDataModel.dart';
import 'package:assignmentredscope/Services/SharedPreferencesService.dart';
import 'package:flutter/material.dart';

class RepoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List listOfRepoData = jsonDecode(SharedPreferencesService.getData(),);

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: listOfRepoData.length,
      itemBuilder: (context, index) {
        GithubDataModel repoData = GithubDataModel.fromJson(listOfRepoData[index]);
        DateTime createdAtDateTime = DateTime.parse(repoData.createdAt!);
        String createdAt = timeago.format(createdAtDateTime, locale: 'en');
        DateTime updatedAtDateTime = DateTime.parse(repoData.updatedAt!);
        String updatedAt = timeago.format(updatedAtDateTime, locale: 'en');
        return InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            Get.to(()=>RepoFileScreen(files: repoData.files!,),);
          },
          onLongPress: () {
            showDialog(
              context: context,
              builder: (context) {
                Owner repoOwner = repoData.owner!;
                return AlertDialog(
                  title: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(repoOwner.avatarUrl.toString()),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(repoOwner.login!),
                    ],
                  ),
                  content: Text('More Information of ${repoOwner.login} Available on \n ${repoOwner.url}'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: Text('Close'),),
                  ],
                );
              },
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 2.5),
            child: Card(
              shadowColor: Colors.blue,
              elevation: 10,
              color: Colors.grey.shade800,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description : ${repoData.description != null && repoData.description!.isNotEmpty ? repoData.description : "Not Available"}"),
                    Text("Comments : ${repoData.comments}"),
                    Text("Created At: $createdAt"),
                    Text("Updated At: $updatedAt")
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
