import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:flutter_redux_seed/core/navigation.dart';
import 'package:flutter_redux_seed/redux/actions/item_actions.dart';
import 'package:flutter_redux_seed/redux/actions/navigate_actions.dart';
import 'package:flutter_redux_seed/view_models/item_list_vm.dart';
import 'package:flutter_redux_seed/UI/widgets/widgets.dart';
import 'package:flutter_redux_seed/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

const kTitle = 'Title';

class MyHomePage extends StatelessWidget {
  MyHomePage();

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
        onInit: (store) => store.dispatch(GetItemsAction()),
        builder: (BuildContext context, Store<AppState> store) => Scaffold(
              appBar: AppBar(
                title: Text(kTitle),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => store.dispatch(NavigateToAction(Routes.example)),
              ),
              body: StoreConnector<AppState, ItemListViewModel>(
                  converter: (Store<AppState> store) => ItemListViewModel.create(store),
                  builder: (BuildContext context, ItemListViewModel viewModel) => Column(
                        children: <Widget>[
                          AddItemWidget(viewModel),
                          Expanded(child: ItemListWidget(viewModel)),
                          RemoveItemsButton(viewModel),
                        ],
                      )),
              drawer: Container(child: ReduxDevTools(store as DevToolsStore)),
            ));
  }
}

class MyTestPage extends StatelessWidget {
  MyTestPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kTitle),
      ),
      body: Text('tst'),
    );
  }
}
