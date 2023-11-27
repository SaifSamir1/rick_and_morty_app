import 'package:bloc/bloc.dart';

part 'home_state.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsCubit> {
  CharacterDetailsCubit() : super(CharacterDetailsInitial());
}
