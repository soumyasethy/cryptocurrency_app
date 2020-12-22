import 'package:clover_ag/models/cryptocurrency_model.dart';
import 'package:clover_ag/utils/constants.dart';
import 'package:flutter/material.dart';

Widget initialRender() {
  return Column(
    children: [
      Icon(
        Icons.search,
        size: 200,
        color: Colors.grey.withOpacity(0.50),
      ),
      Text(CommonStrings.enterACurrencyPairToLoadData)
    ],
  );
}

Widget renderTicker(CryptocurrencyModel data) {
  return Column(
    children: [
      SizedBox(
        height: 16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(data.name), Text(data.timestamp)],
      ),
      SizedBox(
        height: 24,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleWithText(
              primaryText: CommonStrings.open,
              secondaryText: data.open.toString()),
          titleWithText(
              primaryText: CommonStrings.high,
              secondaryText: data.high.toString()),
        ],
      ),
      SizedBox(
        height: 24,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleWithText(
              primaryText: CommonStrings.low,
              secondaryText: data.low.toString()),
          titleWithText(
              primaryText: CommonStrings.last,
              secondaryText: data.last.toString()),
        ],
      ),
      SizedBox(
        height: 24,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleWithText(
              primaryText: CommonStrings.volume,
              secondaryText: data.volume.toString()),
        ],
      ),
    ],
  );
}

Widget renderSearchBar({@required Function onSearch}) {
  final TextEditingController textEditingController = TextEditingController();
  var focusNode = FocusNode();

  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4), color: Color(0xffF4F4F4)),
    child: TextField(
      controller: textEditingController,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      focusNode: focusNode,
      onChanged: (String keyword) {},
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: CommonStrings.enterCurrencyPair,
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: IconButton(
            onPressed: () {
              onSearch(textEditingController.text);
            },
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.black,
                // size: 16,
              ),
            ),
          )),
    ),
  );
}

Widget titleWithText({String primaryText = '', String secondaryText = ''}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [Text(primaryText), Text(secondaryText)],
  );
}

Widget renderOrderBookHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        CommonStrings.bidPrice,
      ),
      Text(
        CommonStrings.qty,
      ),
      Text(
        CommonStrings.qty,
      ),
      Text(
        CommonStrings.askPrice,
      ),
    ],
  );
}
