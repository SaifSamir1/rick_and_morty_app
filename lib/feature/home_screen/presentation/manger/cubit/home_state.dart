part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}


class GetAllCharactersSuccessState extends HomeState
{
  final List<Results> characters;

  GetAllCharactersSuccessState(this.characters);
}
class GetAllCharactersErrorState extends HomeState {}
