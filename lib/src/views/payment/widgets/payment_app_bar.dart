part of '../payment_view.dart';

class PaymentAppBar extends StatelessWidget {
  const PaymentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text("Payment Method"),
      automaticallyImplyLeading: false,
      pinned: true,
      elevation: 1,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const HeroIcon(
          HeroIcons.arrowLeft,
          style: HeroIconStyle.outline,
          size: 24,
          color: Styles.colorBlack400,
        ),
      ),
    );
  }
}
