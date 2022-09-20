import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_football_bloc/bloc/player_bloc.dart';
import 'package:real_football_bloc/mainHome/MainHome.dart';
import 'package:real_football_bloc/model/PlayerModel.dart';

class PlayerDetails extends StatefulWidget {
  PlayerDetails({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<PlayerDetails> createState() => _PlayerDetailsState();
}

class _PlayerDetailsState extends State<PlayerDetails> {
  late PlayerModel playerModel;
  void initState() {
    BlocProvider.of<PlayerBloc>(context).add(getPlayers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PlayerDetailse"),
        ),
        body: BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
          if (state is PlayerLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PlayerError) {
            return Center(
              child: Text("something went wrong "),
            );
          }
          if (state is PlayerLoaded) {
            playerModel = BlocProvider
                .of<PlayerBloc>(context)
                .playerModel;

            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                elevation: 6,
                child: Container(
                  height: 400,
                  width: 350,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(playerModel
                                .response![widget.index].player!.photo
                                .toString()),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        playerModel.response![widget.index].player!.name
                            .toString(),
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      Text(
                        playerModel.response![widget.index].player!.age
                            .toString(),
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        playerModel.response![widget.index].player!.nationality
                            .toString(),
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            margin: EdgeInsets.all(1),
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 150,
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "GOALS",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "totel=" +
                                        playerModel.response![widget.index]
                                            .statistics![0].goals!.total
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                  Text(
                                    "conceded=" +
                                        playerModel.response![widget.index]
                                            .statistics![0].goals!.conceded
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                  Text(
                                    "assists=" +
                                        playerModel.response![widget.index]
                                            .statistics![0].goals!.assists
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                  Text(
                                    "saves=" +
                                        playerModel.response![widget.index]
                                            .statistics![0].goals!.saves
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(1),
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 150,
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "PASSES",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "total=" +
                                        playerModel.response![widget.index]
                                            .statistics![0].passes!.total
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                  Text(
                                    "key=" + playerModel.response![widget.index]
                                        .statistics![0].passes!.key.toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                  Text(
                                    "accuracy=" +
                                        playerModel.response![widget.index]
                                            .statistics![0].passes!.accuracy
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(1),
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 150,
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "shot",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "total=" +
                                        playerModel.response![widget.index]
                                            .statistics![0].shots!.total
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                  Text(
                                    "on=" + playerModel.response![widget.index]
                                        .statistics![0].shots!.on.toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          } return Container();
        }
        ));
  }
}
