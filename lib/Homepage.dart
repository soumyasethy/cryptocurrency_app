import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/order_book_bloc.dart';
import 'bloc/search_bloc.dart';
import 'models/cryptocurrency_model.dart';
import 'utils/common_colors.dart';
import 'utils/constants.dart';
import 'widgets/common_widgets.dart';

class Homepage extends StatelessWidget {
  final SearchBloc _searchBloc = SearchBloc();
  final OrderBookBloc _orderBookBloc = OrderBookBloc();
  CryptocurrencyModel cryptocurrency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          color: Colors.white,
          child: ListView(
            children: [
              renderSearchBar(context, onSearch: (String word) {
                _searchBloc.search(word);
              }),
              SizedBox(
                height: 16,
              ),
              BlocBuilder(
                cubit: _searchBloc,
                builder: (BuildContext context, state) {
                  if (state is SuccessSearch) {
                    cryptocurrency = state.cryptocurrency;
                    _orderBookBloc.hideOrderBook();
                    return renderTicker(context, cryptocurrency);
                  } else if (state is LoadingSearch)
                    return Center(child: CircularProgressIndicator());
                  else
                    return initialRender(context);
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
                        child: Text(
                          CommonStrings.viewOrderBook,
                          style: Theme.of(context).textTheme.button,
                        ),
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
                        child: Text(
                          CommonStrings.hideOrderBook,
                          style: Theme.of(context).textTheme.button,
                        ),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                CommonStrings.orderBook,
                                style: Theme.of(context).textTheme.headline3,
                              )),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Card(
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(16),
                                shrinkWrap: true,
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  if (index == 0)
                                    return renderOrderBookHeader(context);
                                  index = index - 1;
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 24.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.data.bids[index][0],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        Text(
                                          state.data.bids[index][1],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        Text(
                                          state.data.asks[index][1],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        Text(
                                          state.data.asks[index][0],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
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
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        floatingActionButton: BlocBuilder(
            cubit: _searchBloc,
            builder: (BuildContext context, state) {
              if (state is SuccessSearch)
                return FloatingActionButton(
                    backgroundColor: CommonColors.primaryColor,
                    onPressed: () {
                      _searchBloc.search(cryptocurrency.name);
                      if (cryptocurrency.showOrderBook)
                        _orderBookBloc.fetchDetails(cryptocurrency.name);
                    },
                    child: const Icon(Icons.autorenew));
              return SizedBox();
            }));
  }
}
