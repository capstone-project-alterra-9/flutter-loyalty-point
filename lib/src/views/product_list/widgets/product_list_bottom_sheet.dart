part of '../product_list_view.dart';

class ProductListBottomSheet extends StatelessWidget {
  const ProductListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    ProductListViewModel productListViewModel =
        context.read<ProductListViewModel>();

    return BottomSheetWidget(
      child: Consumer<ProductListViewModel>(
        builder: (context, value, child) => ElevatedButton(
          onPressed: value.nextButtonDisabled
              ? null
              : productListViewModel.toReedemProductDetail,
          style: Styles.primaryButton,
          child: const Text("Next"),
        ),
      ),
    );
  }
}
