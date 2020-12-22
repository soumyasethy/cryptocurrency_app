import 'dart:convert';

OrderBookModel orderBookModelFromJson(String str) =>
    OrderBookModel.fromJson(json.decode(str));

String orderBookModelToJson(OrderBookModel data) => json.encode(data.toJson());

class OrderBookModel {
  OrderBookModel({
    this.timestamp,
    this.microtimestamp,
    this.bids,
    this.asks,
  });

  String timestamp;
  String microtimestamp;
  List<List<String>> bids;
  List<List<String>> asks;

  factory OrderBookModel.fromJson(Map<String, dynamic> json) => OrderBookModel(
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        microtimestamp:
            json["microtimestamp"] == null ? null : json["microtimestamp"],
        bids: json["bids"] == null
            ? null
            : List<List<String>>.from(
                json["bids"].map((x) => List<String>.from(x.map((x) => x)))),
        asks: json["asks"] == null
            ? null
            : List<List<String>>.from(
                json["asks"].map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp == null ? null : timestamp,
        "microtimestamp": microtimestamp == null ? null : microtimestamp,
        "bids": bids == null
            ? null
            : List<dynamic>.from(
                bids.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "asks": asks == null
            ? null
            : List<dynamic>.from(
                asks.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
