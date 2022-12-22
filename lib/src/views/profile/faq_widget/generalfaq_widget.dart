import "package:flutter/material.dart";
import 'package:flutter_loyalty_point/src/view_models/profile/faq_viewmodel.dart';
import 'package:flutter_loyalty_point/src/view_models/profile/generalfaq_viewmodel.dart';
import 'package:provider/provider.dart';

import '../faqdetail_view.dart';

class GeneralFAQWidget extends StatelessWidget {
  const GeneralFAQWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<FAQViewModel>(
          builder: (context, value, child) => ListView.builder(
            shrinkWrap: true,
            itemCount: value.dataFAQGeneral.length,
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
                          value.dataFAQGeneral[index].title.toString(),
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
