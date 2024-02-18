import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:equatable/equatable.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc(TempoSheet sheet) : super(PlayerInitial(sheet)) {
    on<PlayerLoadPage>((event, emit) {
      // TODO: implement event handler
    });
    on<PlayerStop>((event, emit) {
      // TODO: implement event handler
    });
    on<PlayerStart>((event, emit) {
      // TODO: implement event handler
    });
  }
}
