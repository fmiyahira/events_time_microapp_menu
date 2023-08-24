import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:events_time_microapp_menu/src/products/domain/models/category_model.dart';
import 'package:events_time_microapp_menu/src/products/domain/models/product_model.dart';
import 'package:events_time_microapp_menu/src/products/presentation/pages/view_product_page.dart';
import 'package:events_time_microapp_menu/src/products/presentation/pages/widgets/increment_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExampleCategorySection extends StatelessWidget {
  const ExampleCategorySection({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  void _viewProduct(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const ViewProductPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _viewProduct(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: kLayoutSpacerXS),
        margin: const EdgeInsets.only(bottom: kLayoutSpacerXS),
        color: DSColors.neutral.s100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSectionTileHeader(context),
            _buildProductTileList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProductTileList(BuildContext context) {
    return Column(
      children: List<Widget>.generate(
        category.products.length,
        (int index) {
          final ProductModel product = category.products[index];
          final bool isLastIndex = index == category.products.length - 1;
          return Column(
            children: [
              const SizedBox(height: kLayoutSpacerXS),
              Row(
                children: [
                  Image.asset(
                    '', // image here,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 130,
                  ),
                  const SizedBox(width: kLayoutSpacerXS),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DSText(
                          product.name,
                          type: DSTextType.NUMBER,
                        ),
                        const SizedBox(height: kLayoutSpacerXXXS),
                        DSText(
                          product.stand.name,
                          type: DSTextType.NUMBER_SMALL,
                          color: DSColors.primary.base,
                        ),
                        const SizedBox(height: kLayoutSpacerXXXS),
                        DSText(
                          product.name,
                          type: DSTextType.LABEL_SMALL,
                        ),
                        const SizedBox(height: kLayoutSpacerXXXS),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: kLayoutSpacerXXS),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DSText(
                    'R\$${NumberFormat.currency(locale: 'br', symbol: '').format(product.price)}',
                    type: DSTextType.NUMBER,
                  ),
                  IncrementItemWidget(count: 0),
                ],
              ),
              const SizedBox(height: kLayoutSpacerXS),
              DSDivider(
                theme: DSDividerTheme(color: DSColors.neutral.s72),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionTileHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: kLayoutSpacerXS),
        _sectionTitle(context),
        const SizedBox(height: kLayoutSpacerXXS),
      ],
    );
  }

  Widget _sectionTitle(BuildContext context) {
    return Row(
      children: <Widget>[
        DSText(category.name, type: DSTextType.HEADING3),
      ],
    );
  }

  Widget _buildProductImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5), // Image border
      child: Image.asset(
        url,
        width: 110,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}
