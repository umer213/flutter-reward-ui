import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/reward_repository.dart';
import 'reward_event.dart';
import 'reward_state.dart';

class RewardBloc extends Bloc<RewardEvent, RewardState> {
  final RewardRepository _repository;

  RewardBloc({required RewardRepository repository})
    : _repository = repository,
      super(const RewardInitial()) {
    on<LoadRewardData>(_onLoadRewardData);
  }

  Future<void> _onLoadRewardData(
    LoadRewardData event,
    Emitter<RewardState> emit,
  ) async {
    emit(const RewardLoading());

    try {
      final rewardData = await _repository.getRewardData();
      final bills = await _repository.getCreditCardBills();

      emit(RewardLoaded(rewardData: rewardData, bills: bills));
    } catch (e) {
      emit(RewardError(message: 'Failed to load reward data: $e'));
    }
  }
}
