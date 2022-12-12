part of "../home_view.dart";

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      toolbarHeight: 61,
      floating: true,
      snap: true,
      pinned: true,
      elevation: 1,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Row(
            children: [
              // leading section
              Expanded(
                child: Consumer<HomeViewModel>(
                  builder: (context, value, child) {
                    switch (value.userState) {
                      case ViewStateType.none:
                        {
                          return Wrap(
                            spacing: 16,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              // icon user
                              CircleAvatar(
                                backgroundColor: Styles.colorGreen500,
                                radius: 22.5,
                                child: Text(
                                  value.user?.username
                                          ?.substring(0, 1)
                                          .toUpperCase() ??
                                      "",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),

                              // user name
                              Text(
                                "Hi, ${value.user?.username ?? ''}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          );
                        }
                      default:
                        {
                          return const SizedBox();
                        }
                    }
                  },
                ),
              ),

              // icon section
              SvgPicture.asset("assets/icons/icon_customer_service.svg"),
            ],
          ),
        ),
      ),
    );
  }
}
