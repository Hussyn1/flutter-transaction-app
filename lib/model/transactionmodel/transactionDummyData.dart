import 'package:transaction_application/model/transactionmodel/transaction.dart';

List<TransactionModel> transactions = [
  TransactionModel(
    logoAssetPath: 'assets/images/amazon-logo.png',
    name: 'Amazon Shopping',
    time: 'Today, 12:45 PM',
    amountPaid: '\$59.99',
    amountSaved: '\$10.00',
  ),
  TransactionModel(
    logoAssetPath: 'assets/images/starbucks-logo.png',
    name: 'Starbucks Coffee',
    time: 'Today, 9:15 AM',
    amountPaid: '\$5.80',
    amountSaved: '\$1.00',
  ),
  TransactionModel(
    logoAssetPath: 'assets/images/netflix-logo.png',
    name: 'Netflix Subscription',
    time: 'Yesterday, 7:30 PM',
    amountPaid: '\$15.99',
    amountSaved: '\$3.00',
  ),
  TransactionModel(
    logoAssetPath: 'assets/images/uber-logo.png',
    name: 'Uber Ride',
    time: 'Monday, 6:00 PM',
    amountPaid: '\$12.75',
    amountSaved: '\$2.00',
  ),
];
