part of '../payment_view.dart';

class PaymentBottomBar extends StatelessWidget {
  const PaymentBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentViewModel productListViewModel = context.read<PaymentViewModel>();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Styles.colorBlack50)),
        ),
        child: Consumer<PaymentViewModel>(
          builder: (context, value, child) => ElevatedButton(
            onPressed: value.payButtonDisabled
                ? null
                : productListViewModel.createTransaction,
            style: Styles.primaryButton,
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }
}
