import 'package:equatable/equatable.dart';

abstract class RewardEvent extends Equatable {
  const RewardEvent();

  @override
  List<Object?> get props => [];
}

class LoadRewardData extends RewardEvent {
  const LoadRewardData();
}
