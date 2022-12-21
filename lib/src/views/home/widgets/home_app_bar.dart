part of "../home_view.dart";

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      floating: true,
      snap: true,
      pinned: true,
      elevation: 1,
      title: Consumer<HomeViewModel>(
        builder: (context, value, child) {
          switch (value.userState) {
            case ViewStateType.none:
              {
                return Text(
                  "Hi, ${value.user?.username ?? ''}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                );
              }
            default:
              {
                return const SkeltonWidget(
                  width: 135,
                  height: 22.5,
                  borderRadius: 15,
                );
              }
          }
        },
      ),
      actions: [
        // icon section
        GestureDetector(
          onTap: context.read<HomeViewModel>().toCustomerService,
          child: SvgPicture.asset("assets/icons/icon_customer_service.svg"),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
