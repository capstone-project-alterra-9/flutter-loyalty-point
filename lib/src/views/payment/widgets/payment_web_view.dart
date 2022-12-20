part of '../payment_view.dart';

class PaymentWebView extends StatelessWidget {
  const PaymentWebView({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentViewModel paymentViewModel = context.read<PaymentViewModel>();

    return SliverFillRemaining(
      child: InAppWebView(
        onWebViewCreated: (controller) =>
            paymentViewModel.inAppWebViewController = controller,
        initialUrlRequest: URLRequest(
          url: Uri.parse(paymentViewModel.args.url),
        ),
      ),
    );
  }
}
