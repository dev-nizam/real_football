import 'dart:convert';

import 'package:http/http.dart';
import 'package:real_football_bloc/api/Api_client.dart';
import 'package:real_football_bloc/model/PlayerModel.dart';



class PlayerApi{
  ApiClient apiClient=ApiClient();
  Future<PlayerModel>Player()async{
    String path="players/topscorers?season=2019&league=39";
    Response response=await apiClient.invokeApi(path: path, method: "GET", body: null);
    return PlayerModel.fromJson(jsonDecode(response.body));

  }
}