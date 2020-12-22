import 'package:clover_ag/models/cryptocurrency_model.dart';
import 'package:clover_ag/utils/common_colors.dart';
import 'package:clover_ag/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget initialRender(BuildContext context) {
  return Column(
    children: [
      Icon(
        Icons.search,
        size: 200,
        color: CommonColors.greyIcon,
      ),
      Text(
        CommonStrings.enterACurrencyPairToLoadData,
        style: Theme.of(context).textTheme.caption,
      )
    ],
  );
}

Widget renderTicker(BuildContext context, CryptocurrencyModel data) {
  var date = DateTime.fromMicrosecondsSinceEpoch(int.parse(data.timestamp));
  final DateFormat formatter = DateFormat('dd MMM yyyy, HH:mm:s');
  return Column(
    children: [
      SizedBox(
        height: 16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data.name.toUpperCase(),
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            formatter.format(date),
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
      SizedBox(
        height: 24,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleWithText(context,
              primaryText: CommonStrings.open,
              secondaryText: data.open.toString()),
          titleWithText(context,
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
          titleWithText(context,
              primaryText: CommonStrings.low,
              secondaryText: data.low.toString()),
          titleWithText(context,
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
            context,
            isCurrency: false,
            primaryText: CommonStrings.volume,
            secondaryText: data.volume.toString(),
          ),
        ],
      ),
    ],
  );
}

Widget renderSearchBar(BuildContext context, {@required Function onSearch}) {
  final TextEditingController textEditingController = TextEditingController();
  var focusNode = FocusNode();

  return Container(
    padding: EdgeInsets.fromLTRB(16, 4, 8, 4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4), color: CommonColors.textBox),
    child: TextField(
      controller: textEditingController,
      style: Theme.of(context).inputDecorationTheme.hintStyle,
      focusNode: focusNode,
      onChanged: (String keyword) {},
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: CommonStrings.enterCurrencyPair,
          hintStyle: TextStyle(color: CommonColors.textHint),
          suffixIcon: IconButton(
            onPressed: () {
              onSearch(textEditingController.text);
            },
            icon: Icon(
              Icons.search,
              color: Colors.black,
              // size: 16,
            ),
          )),
    ),
  );
}

Widget titleWithText(BuildContext context,
    {String primaryText = '', String secondaryText = '', isCurrency = true}) {
  final formatCurrency = NumberFormat("#,##0.00", "en_US");
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        primaryText,
        style: Theme.of(context).textTheme.headline2,
      ),
      SizedBox(
        height: 4,
      ),
      Text(
        isCurrency
            ? '\$ ${formatCurrency.format(double.parse(secondaryText))}'
            : secondaryText,
        style: Theme.of(context).textTheme.bodyText2,
      )
    ],
  );
}

Widget renderOrderBookHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        CommonStrings.bidPrice,
        style: Theme.of(context).textTheme.headline2,
      ),
      Text(
        CommonStrings.qty,
        style: Theme.of(context).textTheme.headline2,
      ),
      Text(
        CommonStrings.qty,
        style: Theme.of(context).textTheme.headline2,
      ),
      Text(
        CommonStrings.askPrice,
        style: Theme.of(context).textTheme.headline2,
      ),
    ],
  );
}
