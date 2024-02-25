import 'package:bpm_turner/data/repository/sheet_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/sample/rach_op17.dart';
import '../bloc/player_bloc.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayerBloc(
        sheet: tarantella,
        sheetRepository: RepositoryProvider.of<SheetRepository>(context),
      ),
      child: const PlayerView(),
    );
  }
}

class PlayerView extends StatelessWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: BlocBuilder<PlayerBloc, PlayerState>(
                builder: (context, state) {
                  if (state is PlayerInitial) {
                    return const ProgressLoading();
                  } else if (state is PlayerSheetLoaded) {
                    return Center(
                      child: Text(
                        state.sheet.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  } else {
                    return const Text('Error');
                  }
                },
              ),
            ),
          ],
        )
      ],
    ));
  }
}

class ProgressLoading extends StatelessWidget {
  const ProgressLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              strokeWidth: 10,
              backgroundColor: Colors.black,
              color: Colors.blue,
            ),
            Center(
                child: Text(
              'Loading file...',
              style: TextStyle(fontSize: 20),
            )),
          ],
        ),
      ),
    );
  }
}
