import 'package:clover_ag/bloc/order_book_bloc.dart';
import 'package:clover_ag/bloc/search_bloc.dart';
import 'package:clover_ag/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/cryptocurrency_model.dart';
import 'widgets/common_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SearchBloc _searchBloc = SearchBloc();
  final OrderBookBloc _orderBookBloc = OrderBookBloc();
  CryptocurrencyModel cryptocurrency;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          body: Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: ListView(
              children: [
                renderSearchBar(onSearch: (String word) {
                  _searchBloc.search(word);
                }),
                SizedBox(
                  height: 16,
                ),
                BlocBuilder(
                  cubit: _searchBloc,
                  builder: (BuildContext context, state) {
                    if (state is Success) {
                      cryptocurrency = state.cryptocurrency;
                      _orderBookBloc.hideOrderBook();
                      return renderTicker(cryptocurrency);
                    } else if (state is Loading)
                      return Center(child: CircularProgressIndicator());
                    else
                      return initialRender();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                BlocBuilder(
                  cubit: _orderBookBloc,
                  builder: (BuildContext context, state) {
                    if (state is InitialOrderBook) {
                      cryptocurrency.showOrderBook = false;
                      return Align(
                        alignment: Alignment.centerRight,
                        child: MaterialButton(
                          onPressed: () {
                            _orderBookBloc.fetchDetails(cryptocurrency.name);
                          },
                          child: Text(CommonStrings.viewOrderBook),
                        ),
                      );
                    } else if (state is SuccessOrderBook) {
                      cryptocurrency.showOrderBook = true;
                      return Align(
                        alignment: Alignment.centerRight,
                        child: MaterialButton(
                          onPressed: () {
                            _orderBookBloc.hideOrderBook();
                          },
                          child: Text(CommonStrings.hideOrderBook),
                        ),
                      );
                    }

                    return SizedBox();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                BlocBuilder(
                  cubit: _orderBookBloc,
                  builder: (BuildContext context, state) {
                    if (state is SuccessOrderBook)
                      return Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(CommonStrings.orderBook)),
                          SizedBox(
                            height: 8,
                          ),
                          Card(
                              child: ListView.builder(
                                  padding: EdgeInsets.all(16),
                                  shrinkWrap: true,
                                  itemCount: 6,
                                  itemBuilder: (context, index) {
                                    if (index == 0)
                                      return renderOrderBookHeader();
                                    index = index - 1;
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 24.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(state.data.bids[index][0]),
                                          Text(state.data.bids[index][1]),
                                          Text(state.data.asks[index][1]),
                                          Text(state.data.asks[index][0]),
                                        ],
                                      ),
                                    );
                                  })),
                        ],
                      );
                    else if (state is LoadingOrderBook)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    else
                      return SizedBox();
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: BlocBuilder(
              cubit: _searchBloc,
              builder: (BuildContext context, state) {
                if (state is Success)
                  return FloatingActionButton(
                      onPressed: () {
                        _searchBloc.search(cryptocurrency.name);
                        _orderBookBloc.fetchDetails(cryptocurrency.name);
                      },
                      child: const Icon(Icons.refresh));
                return SizedBox();
              })),
    );
  }
}
