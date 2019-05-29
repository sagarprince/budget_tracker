import 'package:expense_manager/enums.dart';

class Transaction {

  final dynamic category;
  final String title;
  final String description;
  final DateTime date;
  final TransactionTypes type;
  final dynamic amount;

  Transaction({ this.category, this.title, this.description, this.date, this.type, this.amount });

  factory Transaction.fromMap(Map data) {
    data = data ?? { };
    return Transaction(
        category: '',
        title: data['address'] ?? '',
        description: data['description'] ?? '',
        date: data['date'] ?? '',
        type: data['type'] ?? '',
        amount: data['amount'] ?? 0
    );
  }

}