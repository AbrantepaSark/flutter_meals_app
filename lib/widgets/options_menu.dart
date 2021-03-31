//Not part of project setup
//but for reference to create
//popup menu
//It performs no operation

import 'package:flutter/material.dart';

enum OptionItems { Option_1, Option_2, Option_3, Option_4 }

class Options extends StatelessWidget {
  final BuildContext ctx;
  Options(this.ctx);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<OptionItems>(
      padding: EdgeInsets.all(5),
      elevation: 4,
      child: Icon(Icons.more_vert),
      onSelected: (OptionItems result) {},
      itemBuilder: (ctx) => <PopupMenuEntry<OptionItems>>[
        const PopupMenuItem<OptionItems>(
          value: OptionItems.Option_1,
          child: ListTile(
            leading: Icon(Icons.add),
            title: Text('Option 1'),
          ),
        ),
        const PopupMenuItem<OptionItems>(
          value: OptionItems.Option_2,
          child: ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Option 2'),
          ),
        ),
        const PopupMenuItem<OptionItems>(
          value: OptionItems.Option_3,
          child: ListTile(
            leading: Icon(Icons.search),
            title: Text('Option 3'),
          ),
        ),
        const PopupMenuItem<OptionItems>(
          value: OptionItems.Option_4,
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('Option 4'),
          ),
        ),
      ],
    );
  }
}
