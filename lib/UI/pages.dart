import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:flutter_redux_seed/UI/view_model.dart';
import 'package:flutter_redux_seed/UI/widgets.dart';
import 'package:flutter_redux_seed/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

const kTitle = 'Title';

class MyHomePage extends StatelessWidget {
  final DevToolsStore<AppState> store;

  MyHomePage(this.store);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kTitle),
      ),
      body: StoreConnector<AppState, ViewModel>(
          converter: (Store<AppState> store) => ViewModel.create(store),
          builder: (BuildContext context, ViewModel viewModel) => Column(
                children: <Widget>[
                  AddItemWidget(viewModel),
                  Expanded(child: ItemListWidget(viewModel)),
                  RemoveItemsButton(viewModel),
                ],
              )),
      drawer: Container(child: ReduxDevTools(store)),
    );
  }
}
