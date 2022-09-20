import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_football_bloc/bloc/player_bloc.dart';
import 'package:real_football_bloc/mainHome/playerdetails.dart';
import 'package:real_football_bloc/model/PlayerModel.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  late PlayerModel playerModel;
  void initState() {
    BlocProvider.of<PlayerBloc>(context).add(getPlayers());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PlayersList"),
        ),
        body:BlocBuilder<PlayerBloc,PlayerState>(builder: (context,state){
          if(state is PlayerLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is PlayerLoaded){
            playerModel =BlocProvider.of<PlayerBloc>(context).playerModel;
            return
              Container(
                child: ListView.separated(
                  itemCount: playerModel.response!.length
                  ,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => PlayerDetails(index: index,
                                )));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(playerModel.response![index].player!.photo.toString()),
                        ),
                        title: Text(playerModel.response![index].player!.name.toString()
                            .toString()),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 5,
                    );
                  },

                ),
              );
          }if(state is PlayerError){
            return Center(
              child: Text("something went wrong "),
            );
          }return Container();
        })
        
        );
  }
}
