import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class transaction_item extends StatefulWidget {
  final Transaction tr;
  final void Function(String p1) onRomeve;

  const transaction_item({
    Key? key,
    required this.tr,
    required this.onRomeve,
  }) : super(key: key);

  @override
  State<transaction_item> createState() => _transaction_itemState();
}

class _transaction_itemState extends State<transaction_item> {
  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black,
  ];

  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();

    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                'R\$${widget.tr.value.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('dd/MM/y').format(DateTime.now()) ==
                  DateFormat('dd/MM/y').format(widget.tr.date)
              ? 'Hoje - ${DateFormat('dd/MM/y').format(widget.tr.date)}'
              : DateFormat('dd/MM/y').format(widget.tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? Container(
                width: 100,
                child: IconButton(
                  icon: Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 10),
                      Text(
                        "Excluir",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                    ],
                  ),
                  color: Theme.of(context).colorScheme.error,
                  onPressed: () => this.widget.onRomeve(widget.tr.id),
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
                onPressed: () => this.widget.onRomeve(widget.tr.id),
              ),
      ),
    );
  }
}
