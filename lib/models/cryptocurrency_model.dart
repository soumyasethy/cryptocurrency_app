import 'dart:convert';

CryptocurrencyModel cryptocurrencyModelFromJson(String str) =>
    CryptocurrencyModel.fromJson(json.decode(str));

String cryptocurrencyModelToJson(CryptocurrencyModel data) =>
    json.encode(data.toJson());

class CryptocurrencyModel {
  CryptocurrencyModel({
    this.volume,
    this.last,
    this.timestamp,
    this.bid,
    this.vwap,
    this.high,
    this.low,
    this.ask,
    this.open,
    this.name,
    this.showOrderBook = false,
  });

  String volume;
  String last;
  String timestamp;
  String bid;
  String vwap;
  String high;
  String low;
  String ask;
  double open;
  String name;
  bool showOrderBook;

  factory CryptocurrencyModel.fromJson(Map<String, dynamic> json) =>
      CryptocurrencyModel(
        volume: json["volume"] == null ? null : json["volume"],
        last: json["last"] == null ? null : json["last"],
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        bid: json["bid"] == null ? null : json["bid"],
        vwap: json["vwap"] == null ? null : json["vwap"],
        high: json["high"] == null ? null : json["high"],
        low: json["low"] == null ? null : json["low"],
        ask: json["ask"] == null ? null : json["ask"],
        open: json["open"] == null ? null : json["open"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "volume": volume == null ? null : volume,
        "last": last == null ? null : last,
        "timestamp": timestamp == null ? null : timestamp,
        "bid": bid == null ? null : bid,
        "vwap": vwap == null ? null : vwap,
        "high": high == null ? null : high,
        "low": low == null ? null : low,
        "ask": ask == null ? null : ask,
        "open": open == null ? null : open,
      };
}
