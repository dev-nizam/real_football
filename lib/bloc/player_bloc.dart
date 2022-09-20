import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_football_bloc/api/player_Api.dart';
import 'package:real_football_bloc/model/PlayerModel.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerApi playerApi=PlayerApi();
  late PlayerModel playerModel;
  PlayerBloc() : super(PlayerInitial()) {
    on<getPlayers>((event, emit) => getPlayer(event, emit));
  }
  void getPlayer(PlayerEvent playerEvent,Emitter<PlayerState>emit )async{
    emit(PlayerLoading());
    try{
playerModel = await playerApi.Player();
emit(PlayerLoaded());
    }catch(e){
emit(PlayerError());
print("Error>>>>>>>>>>>>>>>>>>>>>"+e.toString());
    }
  }
}
