import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/services/network_info.dart';
import 'package:rick_and_morty/feature/presentation/pages/search.dart';
import 'package:rick_and_morty/feature/presentation/widgets/characters_list.dart';
import 'package:rick_and_morty/feature/presentation/widgets/components/circle.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FutureBuilder<bool>(
          future: GetIt.instance.get<NetworkInfo>().isConnected,
          initialData: false,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return snapshot.data
                  ? _getStatus('Characters: Online', 'Alive')
                  : _getStatus('Characters: Offline', 'Dead');
            } else {
              return _getStatus('Characters: Unknown', '');
            }
          },
        ),
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            ),
            icon: const Icon(Icons.search),
            iconSize: 28.0,
          )
        ],
      ),
      body: CharactersList(),
    );
  }

  Row _getStatus(final String text, final String status) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(text), const SizedBox(width: 10), Circle(status: status)],
    );
  }
}
