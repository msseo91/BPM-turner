
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/sample/rach_op17.dart';
import '../bloc/player_bloc.dart';


class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayerBloc(tarantella),
      child: const PlayerView(),
    );
  }
}

class PlayerView extends StatelessWidget {
  const PlayerView({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column()
        ],
      )
    );
  }
}