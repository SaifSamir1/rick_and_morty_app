import 'package:charachters_info_app/core/utils/constnts/colors.dart';
import 'package:charachters_info_app/feature/home_screen/presentation/manger/cubit/home_cubit.dart';
import 'package:charachters_info_app/feature/home_screen/presentation/views/widgets/character_gide_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../../../core/utils/widgets.dart';
import '../../data/models/character_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Results> allCharacters;
  List<Results> searchedForCharacters = [];
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getAllCharacters();
  }
  Widget buildAppBarTitle() {
    return const Text(
      'Characters',
      style: TextStyle(color: MyColors.myWhite),
    );
  }


  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myWhite, fontSize: 18),
      ),
      style: const TextStyle(color: MyColors.myWhite, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
        character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    //فايدة ال set state هنا انها تغيرلي
    // الحاله علشان يحصل تحديث لل ui كل ما ادخل علي ال fun دي واقدر استغني عنها
    // لو عملت ال fun دي جوا ال cubit وعملت emit ل state جديده وبذلك هتحدث معايا ال ui
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear, color: MyColors.myWhite),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
            color: MyColors.myWhite,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  Widget _buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            _buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCharactersList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedForCharacters.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return CharacterGridItem(
          characters: _searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchedForCharacters[index],
        );
      },
    ) ;
  }



  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getAllCharacters();
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching
            ? const BackButton(
                color: MyColors.myWhite,
              )
            : Container(),
        backgroundColor: MyColors.myYellow,
        title: _isSearching ? _buildSearchField() : buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body : OfflineBuilder(
          connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
          ){
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected){
              return BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is GetAllCharactersSuccessState) {
                      allCharacters = (state).characters;
                      return _searchTextController.text.isNotEmpty && searchedForCharacters.isEmpty ?
                          buildNoResultFound():
                        _buildLoadedListWidget();
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(
                            color: MyColors.myYellow,
                          ));
                    }
                  });
            }
            else{
              return buildNoInternetWidget();
            }
          },
          child: const Center(child: CircularProgressIndicator(color: MyColors.myYellow,),),
          ),
    );
  }



}
