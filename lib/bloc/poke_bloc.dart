import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/services/poke_service.dart';

import '../models/poke_model.dart';

class PokeBloc extends Cubit<PokeState> {
  PokeBloc() : super(PokeState(pokeResult: []));

  Future<void> fetchData({int offset = 0, int limit = 20}) async {
    try {
      final res = await PokeService.pokeData(offset: offset, limit: limit);
      emit(PokeState(pokeResult: res));
    } catch (e) {
      rethrow;
    }
  }
}

class PokeState {
  List<PokeItemModel>? pokeResult;
  PokeState({
    required this.pokeResult,
  });
}
