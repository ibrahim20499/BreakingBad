import 'package:flutter/material.dart';
import 'package:flutter_breakingbad/constants/colors.dart';
import 'package:flutter_breakingbad/constants/strings.dart';
import 'package:flutter_breakingbad/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character characters;

  const CharacterItem({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.White,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetails , arguments:characters ),
        child: GridTile(
          child: Hero(
            tag: characters.charId,
            child: Container(
              color: MyColors.Grey,
              child: characters.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'asset/images/loading.gif',
                      image: characters.image,
                      fit: BoxFit.cover,
                    )
                  : Image.asset("asset/images/loading.gif"),
            ),
          ),
          footer: Container(
            width: double.infinity,
            color: Colors.black54,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.bottomCenter,
            child: Text(
              '${characters.name}',
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: MyColors.White,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
