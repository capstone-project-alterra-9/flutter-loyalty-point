part of '../product_list_view.dart';

class ProductListFormField extends StatelessWidget {
  const ProductListFormField({super.key});

  @override
  Widget build(BuildContext context) {
    ProductListViewModel productListViewModel =
        context.read<ProductListViewModel>();

    if (productListViewModel.args.categoryProductType ==
            CategoryProductType.other ||
        productListViewModel.args.categoryProductType ==
            CategoryProductType.cashout) {
      return const SliverToBoxAdapter();
    }

    String? hintFormField;
    Widget? prefixFormField;

    switch (productListViewModel.args.categoryProductType) {
      case CategoryProductType.credits:
        {
          hintFormField = "823 2222 3333";

          prefixFormField = const Padding(
            padding: EdgeInsets.only(left: 24, right: 4, bottom: 2),
            child: Text(
              "+62",
              style: TextStyle(fontSize: 16),
            ),
          );
          break;
        }

      case CategoryProductType.dataQuota:
        {
          hintFormField = "823 2222 3333";
          prefixFormField = const Padding(
            padding: EdgeInsets.only(left: 24, right: 4, bottom: 2),
            child: Text(
              "+62",
              style: TextStyle(fontSize: 16),
            ),
          );
          break;
        }

      case CategoryProductType.eMoney:
        {
          hintFormField = "0000 1111 2222 3333";
          break;
        }

      default:
        {
          hintFormField = "Input your number";
        }
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
        child: TextFormField(
          onChanged: (value) => productListViewModel.identifierNumber = value,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: Styles.textFieldAuth.copyWith(
            hintText: hintFormField,
            filled: true,
            fillColor: Colors.white,
            prefixIcon: prefixFormField,
            prefixIconConstraints: const BoxConstraints(),
          ),
        ),
      ),
    );
  }
}
