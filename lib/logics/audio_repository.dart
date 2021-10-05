import 'dart:io';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

class AudioRepository {

  static Future<RssFeed?> getAudioList({required String url}) async{
    try{
      final response = await http.read(Uri.parse(url));
      if(response.isNotEmpty){
        return RssFeed.parse(response);
      }
    }on SocketException catch(e){
      throw "No Internet connection!";
    }on HttpException catch (e){
      throw "Http Exception Error!";
    }on Exception catch(e){
      throw "Something went wrong";
    }
  }
}