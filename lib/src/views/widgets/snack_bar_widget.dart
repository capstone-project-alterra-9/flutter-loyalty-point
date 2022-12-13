import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/utils/extensions/string_extension.dart';
import 'package:flutter_loyalty_point/src/utils/types/snack_bar_type.dart';
import 'package:heroicons/heroicons.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.snackBarType,
  });

  final String title;
  final String subtitle;
  final SnackBarType snackBarType;

  @override
  SnackBar build(BuildContext context) {
    Color backgroundColor;
    Color borderColor;
    HeroIcon icon;

    if (snackBarType == SnackBarType.error) {
      backgroundColor = const Color(0xffFFF1F1);
      borderColor = const Color(0xffDB999A);
      icon = const HeroIcon(
        HeroIcons.exclamationTriangle,
        style: HeroIconStyle.solid,
        color: Color(0xffDB4324),
        size: 24,
      );
    } else {
      backgroundColor = const Color(0xffFFF9ED);
      borderColor = const Color(0xffFFECBC);
      icon = const HeroIcon(
        HeroIcons.exclamationCircle,
        style: HeroIconStyle.solid,
        color: Color(0xffFFB224),
        size: 24,
      );
    }

    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(15),
      ),
      content: SizedBox(
        height: 48,
        child: Row(
          children: [
            icon,
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.capitalize(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Styles.colorBlack400,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    subtitle.capitalize(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Styles.colorBlack300,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              child: const HeroIcon(
                HeroIcons.xMark,
                size: 16,
              ),
            )
          ],
        ),
      ),
      // content: ListTile(
      //   leading: icon,
      //   title:
      //   subtitle:
      //   trailing: HeroIcon(HeroIcons.xMark),
      // ),
    );
  }
}
