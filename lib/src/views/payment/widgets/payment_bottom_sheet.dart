part of '../payment_view.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentViewModel productListViewModel = context.read<PaymentViewModel>();

    return BottomSheetWidget(
      child: Consumer<PaymentViewModel>(
        builder: (context, value, child) => ElevatedButton(
          onPressed: value.payButtonDisabled
              ? null
              : productListViewModel.createTransaction,
          style: Styles.primaryButton,
          child: const Text("Next"),
        ),
      ),
    );
  }
}
