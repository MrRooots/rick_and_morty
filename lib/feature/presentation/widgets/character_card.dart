import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/palette/palette.dart';
import 'package:rick_and_morty/feature/domain/entities/character_entity.dart';
import 'package:rick_and_morty/feature/presentation/pages/details.dart';
import 'package:rick_and_morty/feature/presentation/widgets/components/circle.dart';
import 'package:rick_and_morty/feature/presentation/widgets/components/image.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;
  const CharacterCard({Key? key, required final this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => CharacterDetailsPage(character: character),
      )),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        child: Row(
          children: [
            ImageWidget(url: character.image),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Row(
                    children: [
                      Circle(status: character.status),
                      const SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          '${character.status} - ${character.species}',
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    'Last known location:',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(character.location.name),
                  const SizedBox(height: 5.0),
                  Text(
                    'Origin:',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(character.origin.name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
