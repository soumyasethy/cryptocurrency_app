import 'package:clover_ag/models/cryptocurrency_model.dart';
import 'package:clover_ag/services/api_service.dart';
import 'package:clover_ag/utils/constants.dart';

class TickerRepo {
  ApiService _apiService = ApiService();

  Future<CryptocurrencyModel> fetch(String code) async {
    var response = await _apiService.getRequest(Urls.ticker(code));
    return CryptocurrencyModel.fromJson(response);
  }
}
