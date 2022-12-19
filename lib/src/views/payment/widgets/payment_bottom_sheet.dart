part of '../payment_view.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentViewModel productListViewModel = context.read<PaymentViewModel>();

    return BottomSheetWidget(
      child: ElevatedButton(
        onPressed: productListViewModel.handleDone,
        style: Styles.primaryButton,
        child: const Text("Done"),
      ),
    );
  }
}
