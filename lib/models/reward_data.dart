import 'package:equatable/equatable.dart';

class RewardData extends Equatable {
  final double amount;

  const RewardData({
    required this.amount,
  });

  String get formattedAmount => '\$${amount.toStringAsFixed(0)}';

  @override
  List<Object?> get props => [amount];
}
