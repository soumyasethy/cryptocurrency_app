import 'package:clover_ag/models/order_book_model.dart';
import 'package:clover_ag/services/api_service.dart';
import 'package:clover_ag/utils/constants.dart';

class OrderBookRepo {
  ApiService _apiService = ApiService();

  Future<OrderBookModel> fetch(String code) async {
    var response = await _apiService.getRequest(Urls.orderBook(code));
    return OrderBookModel.fromJson(response);
  }
}
