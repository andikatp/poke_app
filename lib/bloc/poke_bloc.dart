import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/models/poke_model.dart';
import 'package:poke_app/services/poke_service.dart';

class PokeBloc extends Cubit<PokeState> {
  PokeBloc() : super(PokeState([]));

  //Fetch Data from poke service file
  Future<void> fetchData() async {
    try {
      final result = await PokeService.fetchData();
      emit(PokeState(result));
    } catch (e) {
      rethrow;
    }
  }
}

class PokeState {
  List<Result> result;
  PokeState(this.result);
}
