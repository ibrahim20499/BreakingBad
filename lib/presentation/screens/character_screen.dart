//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breakingbad/business_logic/cubit/character_cubit.dart';
import 'package:flutter_breakingbad/constants/colors.dart';
import 'package:flutter_breakingbad/data/models/characters.dart';
import 'package:flutter_breakingbad/presentation/widgets/characters_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Character> allCharacters;
   late List<Character> searchedCharacters;

  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).fetchAllCharacters();
    //print(allCharacters.toString());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.Yellow,
        leading: _isSearching
            ? BackButton(
          color: MyColors.Grey,
        )
            : Container(),
        title: _isSearching
            ? _searchField()
            : Text(
          "Characters",
          style: TextStyle(color: MyColors.Grey,),
        ),
        actions: _buildAppBarActions(),
      ),
      body: buildCharacter()
    );
  }
  Widget buildCharacter() {
    return BlocBuilder<CharacterCubit, CharacterState>(builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = state.characters_a;
            return loadedCharacter();
          } else {
            return loadingIndicator();
          }
        });
  }

  Widget loadedCharacter(){
    return SingleChildScrollView(
      child: Container(
        color: MyColors.Grey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount:  _searchTextController.text.isNotEmpty ? searchedCharacters.length : allCharacters.length ,
      itemBuilder: (context, index) {
        return CharacterItem(
          characters: _searchTextController.text.isNotEmpty? searchedCharacters[index] : allCharacters[index],
        );
      },

    );
  }
  Widget loadingIndicator(){
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.Yellow,
      ),
    );
  }
  Widget _searchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.Grey,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search...',
        hintStyle: TextStyle(color: MyColors.Grey, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.Grey, fontSize: 18),
      onChanged: (searchedCharacter) {
        searchedItem(searchedCharacter);
      },
    );
  }

  void searchedItem(String searchedCharacter) {
    searchedCharacters = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
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
          icon: Icon(
            Icons.clear,
            color: MyColors.Grey,
          ),
        )
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(
            Icons.search,
            color: MyColors.Grey,
          ),
        )
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
  }