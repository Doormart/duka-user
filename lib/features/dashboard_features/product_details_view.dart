import 'package:cached_network_image/cached_network_image.dart';
import 'package:duka_user/core/models/simulation/simul_models/product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_product.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/images_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/core/utils/string_utils.dart';
import 'package:duka_user/features/dashboard_features/view_models/product_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductDetailView extends StatefulWidget {
  final VendorProduct vendorProduct;

  const ProductDetailView({
    Key? key,
    required this.vendorProduct,
  }) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  late Product product;
  late VendorProduct vendorProduct;

  @override
  void initState() {
    super.initState();
    vendorProduct = widget.vendorProduct;
    product = widget.vendorProduct.product;
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double largeImageHeight = screenHeight * 0.4;
    double smallImageHeight = largeImageHeight / 4;
    return ViewModelBuilder<ProductDetailViewModel>.reactive(
      viewModelBuilder: () => ProductDetailViewModel(),
      builder: (_, model, __) => Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
            ),
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Container(
                      height: largeImageHeight,
                      padding: EdgeInsets.only(
                        left: SizeMg.width(29),
                      ),
                      margin: EdgeInsets.only(
                        bottom: SizeMg.height(31),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: smallImageHeight,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      SizeMg.radius(10),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: '${product.image2}',
                                      placeholder: (ctx, url) =>
                                          Image.asset(ImageUtils.brandLogo),
                                      errorWidget: (ctx, url, dyn) =>
                                          Image.asset(ImageUtils.brandLogo),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: smallImageHeight,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      SizeMg.radius(10),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: '${product.image3}',
                                      placeholder: (ctx, url) =>
                                          Image.asset(ImageUtils.brandLogo),
                                      errorWidget: (ctx, url, dyn) =>
                                          Image.asset(ImageUtils.brandLogo),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: smallImageHeight,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      SizeMg.radius(10),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: '${product.image4}',
                                      placeholder: (ctx, url) =>
                                          Image.asset(ImageUtils.brandLogo),
                                      errorWidget: (ctx, url, dyn) =>
                                          Image.asset(ImageUtils.brandLogo),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: SizeMg.width(41),
                          ),
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  SizeMg.radius(30),
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${product.image1}',
                                placeholder: (ctx, url) =>
                                    Image.asset(ImageUtils.brandLogo),
                                errorWidget: (ctx, url, dyn) =>
                                    Image.asset(ImageUtils.brandLogo),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${product.name}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: SizeMg.text(30),
                        color: Palette.blackGreen,
                      ),
                    ),
                    SizedBox(
                      height: SizeMg.height(41),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(27),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              SizeMg.radius(30),
                            ),
                            topRight: Radius.circular(
                              SizeMg.radius(30),
                            ),
                          ),
                          color: Palette.offWhite,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: '\u{20A6}',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  fontSize: SizeMg.text(25),
                                  color: Palette.blackGreen,
                                ),
                                children: [
                                  TextSpan(
                                    text: StringUtils.numFormatNoDecimal(
                                        product.price),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Description
                            SizedBox(
                              height: SizeMg.height(21),
                            ),
                            Text(
                              'Description',
                              style: TextStyle(
                                fontSize: SizeMg.text(20),
                                color: Palette.blackGreen,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: SizeMg.height(15),
                            ),
                            Text(
                              '${product.description}',
                              style: TextStyle(
                                fontSize: SizeMg.text(14),
                                color: Palette.darkGrey,
                              ),
                            ),
                            //Select Food Type
                            SizedBox(
                              height: SizeMg.height(24),
                            ),
                            Text(
                              'Select Type',
                              style: TextStyle(
                                fontSize: SizeMg.text(20),
                                color: Palette.blackGreen,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: SizeMg.height(18),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: FoodType.values.map(
                                      (foodType) => RadioListTile<FoodType>(
                                        title: Text(
                                          'Type ${FoodType.values.indexOf(foodType) + 1}',
                                          style: TextStyle(
                                            color: Palette.darkGrey,
                                            fontSize: SizeMg.text(14),
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.zero,
                                        visualDensity: const VisualDensity(
                                          horizontal: VisualDensity.minimumDensity,
                                          vertical: VisualDensity.minimumDensity,
                                        ),
                                        activeColor: Palette.mainOrange,
                                        groupValue: model.foodType,
                                        onChanged: (FoodType? type){
                                          model.changeFoodType(type!);
                                        },
                                        value: foodType,
                                      ),
                              ).toList(),
                            ),
                            //Select Drink Type
                            SizedBox(
                              height: SizeMg.height(24),
                            ),
                            Text(
                              'Select Drink',
                              style: TextStyle(
                                fontSize: SizeMg.text(20),
                                color: Palette.blackGreen,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: SizeMg.height(18),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: DrinkType.values.map(
                                    (drinkType) => RadioListTile<DrinkType>(
                                  title: Text(
                                    'Type ${DrinkType.values.indexOf(drinkType) + 1}',
                                    style: TextStyle(
                                      color: Palette.darkGrey,
                                      fontSize: SizeMg.text(14),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity,
                                  ),
                                  activeColor: Palette.mainOrange,
                                  groupValue: model.drinkType,
                                  onChanged: (DrinkType? type){
                                    model.changeDrinkType(type!);
                                  },
                                  value: drinkType,
                                ),
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: SizeMg.height(86),
          color: Colors.white,
          padding: EdgeInsets.only(
            left: SizeMg.width(27),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: model.productNumber > 1
                    ? model.decreaseProductNumber
                    : null,
                child: Icon(
                  Icons.horizontal_rule_rounded,
                  color: model.productNumber > 1
                      ? Palette.secondaryBlack
                      : Palette.inactiveGrey,
                  size: 30,
                ),
              ),
              Text(
                '${model.productNumber}',
                style: TextStyle(
                  fontSize: SizeMg.text(20),
                  color: Palette.mainOrange,
                ),
              ),
              GestureDetector(
                onTap: model.increaseProductNumber,
                child: const Icon(
                  Icons.add,
                  color: Palette.secondaryBlack,
                  size: 30,
                ),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    model.addToCart(vendorProduct),
                  );
                  Navigator.pop(context);
                },
                child: Container(
                  width: screenWidth / 2,
                  decoration: BoxDecoration(
                    color: Palette.mainOrange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        SizeMg.radius(50),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: '\u{20A6}',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: SizeMg.text(18),
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: StringUtils.numFormatNoDecimal(
                                    product.price),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ]),
                      ),
                      Text(
                        'ADD TO CART',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeMg.text(18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
