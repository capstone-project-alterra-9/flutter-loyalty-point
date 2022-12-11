part of '../payment_view.dart';

class PaymentMethodList extends StatelessWidget {
  const PaymentMethodList({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentViewModel paymentViewModel = context.read<PaymentViewModel>();
    List<PaymentMethodModel> paymentMethodList =
        paymentViewModel.paymentMethodList;

    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate.fixed(
          [
            const Text(
              "E-Wallet",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            ...List.generate(
              paymentMethodList.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Consumer<PaymentViewModel>(
                  builder: (context, value, child) => RadioListTile(
                    value: paymentMethodList[index].name,
                    groupValue: value.paymentMethod,
                    onChanged: (value) =>
                        paymentViewModel.paymentMethod = value!,
                    controlAffinity: ListTileControlAffinity.trailing,
                    tileColor: Colors.white,
                    dense: true,
                    contentPadding: const EdgeInsets.all(16),
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Styles.colorBlack50),
                    ),
                    title: Wrap(
                      spacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(
                            paymentMethodList[index].icon,
                          ),
                        ),
                        Text(
                          paymentMethodList[index].name.value,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
