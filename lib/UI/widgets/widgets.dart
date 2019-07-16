import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux_seed/UI/view_models/item_list_vm.dart';
import 'package:flutter_redux_seed/models/item.dart';

const kDeleteAllButton = 'Delete all items';
const kAddItemPlaceholder = 'add an item';

/// Widget with an input and submission
class AddItemWidget extends StatefulWidget {
  final ItemListViewModel model;

  AddItemWidget(this.model);

  @override
  _AddItemWidgetState createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: kAddItemPlaceholder),
      onSubmitted: (String s) {
        widget.model.onAddItem(s);
        controller.text = '';
      },
    );
  }
}

/// Row for item in items
class ItemListWidget extends StatelessWidget {
  final ItemListViewModel model;

  ItemListWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: model.items
            .map((Item item) => ListTile(
                title: Text(item.body),
                leading: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => model.onRemoveItem(item),
                ),
                trailing: Checkbox(
                    value: item.completed,
                    onChanged: (b) {
                      model.onCompleted(item);
                    })))
            .toList());
  }
}

/// Widget with a remove all button
class RemoveItemsButton extends StatelessWidget {
  final ItemListViewModel model;

  RemoveItemsButton(this.model);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(child: Text(kDeleteAllButton), onPressed: () => model.onRemoveItems());
  }
}
