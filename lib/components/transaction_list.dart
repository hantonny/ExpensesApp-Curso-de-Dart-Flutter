import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final void Function(String) onRomeve;

  TransactionList(this.transactions, this.onRomeve);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Container(
                    height: constraints.maxHeight * 0.2,
                    child: Text(
                      'Nenhuma Transação cadastrada!',
                      style: Theme.of(ctx).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions.reversed.toList()[index];
              return transaction_item(
                tr: tr,
                onRomeve: onRomeve,
                key: GlobalObjectKey(tr.id),
              );
            },
          );
  }
}


//  ListView(
//             children: transactions.map((tr) {
//               return transaction_item(
//                 tr: tr,
//                 onRomeve: onRomeve,
//                 key: ValueKey(tr.id),
//               );
//             }).toList(),
//           );