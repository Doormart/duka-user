import 'package:cached_network_image/cached_network_image.dart';
import 'package:duka_user/core/models/simulation/simul_models/product_model.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/constants.dart';
import 'package:duka_user/core/utils/images_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/core/utils/string_utils.dart';
import 'package:duka_user/features/dashboard_features/view_models/vendor_details_view_model.dart';
import 'package:flutter/material.dart';

class VendorProducts extends StatelessWidget {
  final List<Product>? productList;
  final TextEditingController searchTextController;
  final Color fillColor, iconColor;
  final Function(String)? onTextChanged;

  final VendorDetailsViewModel model = VendorDetailsViewModel();
  final FocusManager focusManager = FocusManager.instance;

  VendorProducts(
      {Key? key,
      required this.productList,
      required this.searchTextController,
      required this.fillColor,
      required this.iconColor,
      required this.onTextChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeMg.height(20),
            horizontal: SizeMg.width(30),
          ),
          child: TextField(
            controller: searchTextController,
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
            cursorColor: Colors.black,
            style: TextStyle(
              fontSize: SizeMg.text(18),
              fontWeight: FontWeight.w400,
              color: Palette.blackGreen,
            ),
            decoration: kFormTextDecoration.copyWith(
              hintText: 'Search menu',
              fillColor: fillColor,
              prefixIcon: Icon(
                Icons.search,
                color: iconColor,
              ),
            ),
            onChanged: onTextChanged,
          ),
        ),
        Builder(
          builder: (ctx) {
            if (productList == null || productList!.isEmpty) {
              return const Center(
                child: Text(
                  'No product available',
                ),
              );
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                top: SizeMg.height(20),
              ),
              itemBuilder: (ctx, index) {
                final product = productList![index];
                return GestureDetector(
                  onTap: () {
                    model.productDetailScreen(product);
                    focusManager.primaryFocus?.unfocus();
                  },
                  child: Container(
                    height: SizeMg.height(151),
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeMg.width(13),
                      vertical: SizeMg.height(20),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeMg.width(30),
                    ),
                    decoration: BoxDecoration(
                      color: Palette.offWhite,
                      borderRadius: BorderRadius.circular(
                        SizeMg.radius(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: SizedBox(
                            height: SizeMg.height(117),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                SizeMg.radius(20),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${product.image1}',
                                placeholder: (ctx, url) =>
                                    Image.asset(ImageUtils.brandLogo),
                                errorWidget: (ctx, url, dyn) =>
                                    Image.asset(ImageUtils.brandLogo),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeMg.width(12),
                        ),
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${product.name}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: SizeMg.text(14),
                                  color: Palette.blackGreen,
                                ),
                              ),
                              Text(
                                '${product.description}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: SizeMg.text(12),
                                  color: Palette.darkGrey,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '\u{20A6}',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeMg.text(14),
                                    color: Palette.altGreen,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: StringUtils.numFormatNoDecimal(product.price),
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  model.addProductToCart(product),
                                );
                                focusManager.primaryFocus?.unfocus();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2.0, color: Palette.altGreen)),
                                child: const Icon(
                                  Icons.add,
                                  color: Palette.altGreen,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) => SizedBox(
                height: SizeMg.height(30),
              ),
              itemCount: productList!.length,
            );
          },
        ),
      ],
    );
  }
}
