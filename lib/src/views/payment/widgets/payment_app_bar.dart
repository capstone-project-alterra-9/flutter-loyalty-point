part of '../payment_view.dart';

class PaymentAppBar extends StatelessWidget {
  const PaymentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentViewModel productListViewModel = context.read<PaymentViewModel>();

    handleBack() async {
      if (await productListViewModel.inAppWebViewController!.canGoBack()) {
        productListViewModel.inAppWebViewController!.goBack();
        return false;
      } else {
        return true;
      }
    }

    return SliverAppBar(
      title: const Text("Payment Method"),
      automaticallyImplyLeading: false,
      pinned: true,
      elevation: 1,
      leading: WillPopScope(
        onWillPop: handleBack,
        child: IconButton(
          onPressed: handleBack,
          icon: const HeroIcon(
            HeroIcons.arrowLeft,
            style: HeroIconStyle.outline,
            size: 24,
            color: Styles.colorBlack400,
          ),
        ),
      ),
    );
  }
}
