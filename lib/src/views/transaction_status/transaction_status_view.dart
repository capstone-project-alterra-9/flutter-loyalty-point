import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';
import 'package:flutter_loyalty_point/src/view_models/transaction_status/transaction_status_view_model.dart';
import 'package:provider/provider.dart';

class TransactionStatusView extends StatelessWidget {
  const TransactionStatusView({super.key});
  static const routeName = "transaction-status";

  @override
  @override
  Widget build(BuildContext context) {
    TransactionStatusViewModel transactionStatusViewModel =
        context.read<TransactionStatusViewModel>();

    final String message =
        transactionStatusViewModel.args.purchaseType == PurchaseType.buy
            ? "You have successfully buy your\nproduct"
            : "You have successfully redeemed\nyour points";

    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              "Congratulations!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              "assets/images/illustration_transaction_success.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              "You will be redirected to the homepage",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
