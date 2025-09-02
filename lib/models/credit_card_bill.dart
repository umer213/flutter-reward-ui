import 'package:equatable/equatable.dart';

class CreditCardBill extends Equatable {
  final double amount;
  final DateTime date;
  final BillStatus status;

  const CreditCardBill({
    required this.amount,
    required this.date,
    required this.status,
  });

  String get formattedAmount => '\$${amount.toStringAsFixed(0)}';

  String get formattedDate {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}';
  }

  @override
  List<Object?> get props => [amount, date, status];
}

enum BillStatus { paid, due, pending }

extension BillStatusExtension on BillStatus {
  String get displayName {
    switch (this) {
      case BillStatus.paid:
        return 'Paid';
      case BillStatus.due:
        return 'Due';
      case BillStatus.pending:
        return 'Pending';
    }
  }
}
