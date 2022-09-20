part of 'player_bloc.dart';

@immutable
abstract class PlayerState {}

class PlayerInitial extends PlayerState {}
class PlayerLoading extends PlayerState {}
class PlayerLoaded extends PlayerState {}
class PlayerError extends PlayerState {}
