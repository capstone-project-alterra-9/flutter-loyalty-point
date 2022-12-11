part of '../product_list_view.dart';

class ProductListAppBar extends StatelessWidget {
  const ProductListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    ProductListViewModel productListViewModel =
        context.read<ProductListViewModel>();

    return SliverAppBar(
      title: Text(productListViewModel.args.categoryProductType.value),
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
