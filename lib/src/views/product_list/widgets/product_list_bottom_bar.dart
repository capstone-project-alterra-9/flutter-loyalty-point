part of '../product_list_view.dart';

class ProductListBottomBar extends StatelessWidget {
  const ProductListBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    ProductListViewModel productListViewModel =
        context.read<ProductListViewModel>();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Styles.colorBlack50)),
        ),
        child: Consumer<ProductListViewModel>(
          builder: (context, value, child) => ElevatedButton(
            onPressed: value.nextButtonDisabled
                ? null
                : productListViewModel.toReedemProductDetail,
            style: Styles.primaryButton,
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }
}
