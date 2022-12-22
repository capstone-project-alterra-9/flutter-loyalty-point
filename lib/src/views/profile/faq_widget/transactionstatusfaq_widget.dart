import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/profile/faq_viewmodel.dart';
import '../faqdetail_view.dart';

class TransactionStatusFAQWidget extends StatelessWidget {
  const TransactionStatusFAQWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<FAQViewModel>(
          builder: (context, value, child) => ListView.builder(
            shrinkWrap: true,
            itemCount: value.dataFAQTransactionStatus.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(FAQDetailView.routeName);
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 1.0)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          value.dataFAQTransactionStatus[index].title
                              .toString(),
                          style: TextStyle(fontSize: 12),
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
          ),
        )
      ],
    );
  }
}
