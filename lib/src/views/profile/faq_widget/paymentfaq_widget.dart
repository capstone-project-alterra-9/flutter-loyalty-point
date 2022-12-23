import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../../../utils/types/view_state_type.dart';
import '../../../view_models/profile/faq_viewmodel.dart';
import '../../widgets/skelton_widget.dart';
import '../faqdetail_view.dart';

class PaymentFAQWidget extends StatelessWidget {
  const PaymentFAQWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<FAQViewModel>(
          builder: (context, value, child) {
            switch (value.faqListState) {
              case ViewStateType.loading:
                return const SkeltonWidget(
                  width: double.infinity,
                  height: 40,
                  borderRadius: 8,
                  margin: EdgeInsets.only(bottom: 12),
                  // margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
                );
              case ViewStateType.none:
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.dataFAQPayment.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(FAQDetailView.routeName,
                            arguments: value.dataFAQPayment[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 1.0)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Text(
                                value.dataFAQPayment[index].title.toString(),
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            Image.asset(
                              "assets/images/arrow_back.png",
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              default:
                return const SizedBox();
            }
          },
        )
      ],
    );
  }
}
