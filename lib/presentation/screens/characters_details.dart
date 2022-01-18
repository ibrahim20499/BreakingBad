import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_breakingbad/constants/colors.dart';
import 'package:flutter_breakingbad/data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  Widget sliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.Grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickName,
          style: TextStyle(
            color: MyColors.White,
          ),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(character.image,
            fit: BoxFit.cover,
          ),

        ),
      ),
    );
  }

  Widget characterInfo (String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children:[
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.White,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.White,
              fontSize: 16,
            ),
          ),
        ]
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Grey,
      body: CustomScrollView(
        slivers: [
          sliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding:EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo("Name : ", character.name),
                      characterInfo("Birthday : ", character.birthday),
                      characterInfo("Ocupaion : ", character.occupation.join(" / ")),
                      characterInfo("Portrayed : ", character.portrayed),
                      characterInfo("Status : ", character.status),
                      //characterInfo("Category : ", character.category.join(" / ")),
                      characterInfo("Breaking Bad Appearance : ", character.appearance.join(" / ")),
                      character.better_call_saul_appearance.isEmpty ? Container() :
                      characterInfo("Better Call Saul Appearance : ", character.better_call_saul_appearance.join(" / ")),
                    ],
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
