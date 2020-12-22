import 'package:clover_ag/models/cryptocurrency_model.dart';
import 'package:clover_ag/repo/ticker_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchState {}

class Initial extends SearchState {}

class Loading extends SearchState {}

class Success extends SearchState {
  final CryptocurrencyModel cryptocurrency;

  Success(this.cryptocurrency);
}

class Fail extends SearchState {}

class SearchBloc extends Cubit<SearchState> {
  SearchBloc() : super(Initial());
  TickerRepo _tickerRepo = TickerRepo();

  void search(String code) async {
    emit(Loading());
    CryptocurrencyModel cryptocurrencyModel = await _tickerRepo.fetch(code);
    cryptocurrencyModel.name = code;
    if (cryptocurrencyModel != null)
      emit(Success(cryptocurrencyModel));
    else
      Fail();
  }
}
