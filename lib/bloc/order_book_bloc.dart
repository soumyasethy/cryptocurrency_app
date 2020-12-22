import 'package:clover_ag/models/order_book_model.dart';
import 'package:clover_ag/repo/order_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBookState {}

class HideOrderBook extends OrderBookState {}

class InitialOrderBook extends OrderBookState {}

class LoadingOrderBook extends OrderBookState {}

class SuccessOrderBook extends OrderBookState {
  final OrderBookModel data;

  SuccessOrderBook(this.data);
}

class FailOrderBook extends OrderBookState {}

class OrderBookBloc extends Cubit<OrderBookState> {
  OrderBookBloc() : super(HideOrderBook());
  OrderBookRepo _orderBookRepo = OrderBookRepo();

  void fetchDetails(String code) async {
    emit(LoadingOrderBook());
    OrderBookModel _orderBookModel = await _orderBookRepo.fetch(code);
    if (_orderBookModel != null)
      emit(SuccessOrderBook(_orderBookModel));
    else
      FailOrderBook();
  }

  void hideOrderBook() {
    emit(InitialOrderBook());
  }
}
