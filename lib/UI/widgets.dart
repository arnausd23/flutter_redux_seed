import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux_seed/UI/view_model.dart';
import 'package:flutter_redux_seed/model/model.dart';

class AddItemWidget extends StatefulWidget {
  final ViewModel model;

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
      decoration: InputDecoration(hintText: 'add an item'),
      onSubmitted: (String s) {
        widget.model.onAddItem(s);
        controller.text = '';
      },
    );
  }
}

class ItemListWidget extends StatelessWidget {
  final ViewModel model;

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
                )))
            .toList());
  }
}

class RemoveItemsButton extends StatelessWidget {
  final ViewModel model;

  RemoveItemsButton(this.model);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(child: Text('Delete all items'), onPressed: () => model.onRemoveItems());
  }
}
