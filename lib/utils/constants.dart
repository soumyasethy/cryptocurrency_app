class Urls {
  static String ticker(String cryptoCode) =>
      'https://www.bitstamp.net/api/ticker/$cryptoCode';

  static String orderBook(String cryptoCode) =>
      'https://www.bitstamp.net/api/order_book/$cryptoCode';
}

class CommonStrings {
  static String viewOrderBook = 'VIEW ORDER BOOK';
  static String hideOrderBook = 'HIDE ORDER BOOK';
  static String orderBook = 'ORDER BOOK';
  static String enterACurrencyPairToLoadData =
      'Enter a currency pair to load data';
  static String enterCurrencyPair = 'Enter Currency pair';
  static String bidPrice = 'BID PRICE';
  static String qty = 'QTY';
  static String askPrice = 'ASK PRICE';
  static String open = 'OPEN';
  static String high = 'HIGH';
  static String low = 'LOW';
  static String last = 'LAST';
  static String volume = 'VOLUME';
}
