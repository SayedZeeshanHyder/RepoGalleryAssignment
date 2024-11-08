import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService
{

  static late SharedPreferences prefs;

  static initializePreferences() async{
    prefs = await SharedPreferences.getInstance();
    print("Initialized Shared Preferences");
  }

  static Future<bool> isDataCacheAvailable()async{
    return prefs.getBool("isDataCacheAvailable") ?? false;
  }

  static setDataCacheAvailableTrue()async{
    await prefs.setBool("isDataCacheAvailable", true);
  }

  static updateData(data)async{
    await prefs.setString("Data", data);
  }

  static String getData(){
    return prefs.getString("Data") ?? "";
  }

  static List<String> loadBookMarks(){
    List<String> listOfBookmarks = prefs.getStringList("bookmarks") ?? [];
    return listOfBookmarks;
  }

  static updateBookMarks(List<String> listOfBookMarks)async{
    await prefs.setStringList("bookmarks", listOfBookMarks);
  }
}