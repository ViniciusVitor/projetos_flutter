import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_app/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBeDrOZjMTr_o-Ij0vIq_RKVacZMI0P8Eo";
const ID_CANAL = "UCFuIUoyHB12qpYa8Jpxoxow";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";



class Api{

  Future<List<Video>> pesquisar(String pesquisa) async{
    http.Response response = await http.get(
        URL_BASE + "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"
    );

    if(response.statusCode == 200){
      //print("resultado: "+ response.body);

      Map<String, dynamic> dadosJson = json.decode(response.body);


      //convertendo videos em uma lista do tipo video
      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);

          }

      ).toList();

      for(var video in videos){
        print("Resultado video: "+ video.titulo);
      }

      return videos;

     // print("Resultado: "+ dadosJson["items"][4]["snippet"]["title"].toString());

    }else{
      print(response.statusCode);

    }

  }
}



