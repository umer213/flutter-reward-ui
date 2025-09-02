import 'package:equatable/equatable.dart';
import '../models/credit_card_bill.dart';
import '../models/reward_data.dart';

abstract class RewardState extends Equatable {
  const RewardState();

  @override
  List<Object?> get props => [];
}

class RewardInitial extends RewardState {
  const RewardInitial();
}

class RewardLoading extends RewardState {
  const RewardLoading();
}

class RewardLoaded extends RewardState {
  final RewardData rewardData;
  final List<CreditCardBill> bills;

  const RewardLoaded({
    required this.rewardData,
    required this.bills,
  });

  @override
  List<Object?> get props => [rewardData, bills];
}

class RewardError extends RewardState {
  final String message;

  const RewardError({required this.message});

  @override
  List<Object?> get props => [message];
}

class BrandSelectionLoading extends RewardState {
  final RewardData rewardData;
  final List<CreditCardBill> bills;

  const BrandSelectionLoading({
    required this.rewardData,
    required this.bills,
  });

  @override
  List<Object?> get props => [rewardData, bills];
}

class BrandSelectionSuccess extends RewardState {
  final RewardData rewardData;
  final List<CreditCardBill> bills;
  final String message;

  const BrandSelectionSuccess({
    required this.rewardData,
    required this.bills,
    required this.message,
  });

  @override
  List<Object?> get props => [rewardData, bills, message];
}

class BrandSelectionError extends RewardState {
  final RewardData rewardData;
  final List<CreditCardBill> bills;
  final String message;

  const BrandSelectionError({
    required this.rewardData,
    required this.bills,
    required this.message,
  });

  @override
  List<Object?> get props => [rewardData, bills, message];
}
