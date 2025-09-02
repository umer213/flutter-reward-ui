import '../models/credit_card_bill.dart';
import '../models/reward_data.dart';

class RewardRepository {
  static const double _rewardAmount = 10.0;

  /// Get the current reward data
  Future<RewardData> getRewardData() async {
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 500));

    return RewardData(amount: _rewardAmount);
  }

  /// Get mock credit card bills
  Future<List<CreditCardBill>> getCreditCardBills() async {
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 300));

    return [
      CreditCardBill(
        amount: 250.0,
        date: DateTime(2025, 9, 1),
        status: BillStatus.paid,
      ),
      CreditCardBill(
        amount: 480.0,
        date: DateTime(2025, 9, 10),
        status: BillStatus.due,
      ),
      CreditCardBill(
        amount: 120.0,
        date: DateTime(2025, 8, 20),
        status: BillStatus.pending,
      ),
    ];
  }

  /// Simulate brand selection - always shows navigation message
  Future<void> selectBrand() async {
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 800));
    // In a real app, this would navigate to brand screen
  }
}
