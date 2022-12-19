part of '../payment_view.dart';

class PaymentWebView extends StatelessWidget {
  const PaymentWebView({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentViewModel productListViewModel = context.read<PaymentViewModel>();

    return SliverFillRemaining(
      child: InAppWebView(
        onWebViewCreated: (controller) =>
            productListViewModel.inAppWebViewController = controller,
        initialUrlRequest: URLRequest(
          url: Uri.parse(productListViewModel.args.url),
        ),
      ),
    );
  }
}
