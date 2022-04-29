import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/domain/entities/character_entity.dart';
import 'package:rick_and_morty/feature/presentation/widgets/circle.dart';
import 'package:rick_and_morty/feature/presentation/widgets/image.dart';

class CharacterDetailsPage extends StatelessWidget {
  final CharacterEntity character;

  const CharacterDetailsPage({Key? key, required final this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_rounded),
          splashRadius: .1,
        ),
        title: Text(character.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageWidget(url: character.image, rounded: true, size: 250),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Circle(status: character.status),
                const SizedBox(width: 8),
                Text(
                  'Currently ${character.status.toLowerCase()}',
                ),
              ],
            ),
            ..._buildRichText(context, 'Species: ', character.species),
            ..._buildRichText(context, 'Gender: ', character.gender),
            ..._buildRichText(context, 'Origin: ', character.origin.name),
            ..._buildRichText(
              context,
              'Type',
              character.type == '' ? 'Not specified' : character.type,
            ),
            ..._buildRichText(
              context,
              'Number of episodes: ',
              character.episodes.length.toString(),
            ),
            ..._buildRichText(
              context,
              'Last known location: ',
              character.location.name,
            ),
            ..._buildRichText(
              context,
              'Record created: ',
              character.created.toString(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRichText(
    final BuildContext context,
    final String first,
    final String second,
  ) {
    return [
      const SizedBox(height: 10),
      Text(first, style: Theme.of(context).textTheme.subtitle1),
      Text(second),
    ];
  }
}
