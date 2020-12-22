import 'package:clover_ag/models/cryptocurrency_model.dart';
import 'package:clover_ag/repo/ticker_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchState {}

class InitialSearch extends SearchState {}

class LoadingSearch extends SearchState {}

class SuccessSearch extends SearchState {
  final CryptocurrencyModel cryptocurrency;

  SuccessSearch(this.cryptocurrency);
}

class FailSearch extends SearchState {}

class SearchBloc extends Cubit<SearchState> {
  SearchBloc() : super(InitialSearch());
  TickerRepo _tickerRepo = TickerRepo();

  void search(String code) async {
    emit(LoadingSearch());
    CryptocurrencyModel cryptocurrencyModel = await _tickerRepo.fetch(code);
    cryptocurrencyModel.name = code;
    if (cryptocurrencyModel != null)
      emit(SuccessSearch(cryptocurrencyModel));
    else
      FailSearch();
  }
}
