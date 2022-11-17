import 'package:cached_network_image/cached_network_image.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/images_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/features/home_features/view_models/vendor_details_view_model.dart';
import 'package:duka_user/features/home_features/widgets/vendor_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class VendorDetailsView extends StatefulWidget {
  final Vendor vendor;

  const VendorDetailsView({
    Key? key,
    required this.vendor,
  }) : super(key: key);

  @override
  State<VendorDetailsView> createState() => _VendorDetailsViewState();
}

class _VendorDetailsViewState extends State<VendorDetailsView>
    with SingleTickerProviderStateMixin {
  Color searchFillColor = Palette.staleWhite;
  Color searchIconColor = Palette.inactiveGrey;
  int _tabIndex = 0;
  final FocusManager focusManager = FocusManager.instance;
  final VendorDetailsViewModel vendorDetailsViewModel = VendorDetailsViewModel();

  late TextEditingController _allTextController;
  late TextEditingController _comboTextController;
  late TextEditingController _drinksTextController;
  late TextEditingController _localTextController;


  late Vendor vendor;
  late TabController _tabController;

  @override
  void initState() {
    vendor = widget.vendor;

    _tabController = TabController(length: 4, vsync: this);

    _allTextController = TextEditingController();
    _comboTextController = TextEditingController();
    _drinksTextController = TextEditingController();
    _localTextController = TextEditingController();

    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
        focusManager.primaryFocus?.unfocus();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ViewModelBuilder<VendorDetailsViewModel>.reactive(
        viewModelBuilder: () => VendorDetailsViewModel(),
        onModelReady: (model) => model.getProducts(vendor),
        fireOnModelReadyOnce: true,
        disposeViewModel: false,
        builder: (_, model, __) => Builder(builder: (context) {
          if (model.isBusy) {
            return const Center(
              child: CircularProgressIndicator(
                color: Palette.mainOrange,
              ),
            );
          }
          return WillPopScope(
            onWillPop: () async {
              model.previousScreen();
              return true;
            },
            child: GestureDetector(
              onTap: focusManager.primaryFocus?.unfocus,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: screenHeight * 0.3,
                    leading: GestureDetector(
                      onTap: model.previousScreen,
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(
                            SizeMg.radius(30),
                          ),
                          bottomLeft: Radius.circular(
                            SizeMg.radius(30),
                          ),
                        ),
                        child: Opacity(
                          opacity: 0.7,
                          child: CachedNetworkImage(
                            imageUrl: '${vendor.publicImage}',
                            placeholder: (ctx, url) =>
                                Image.asset(ImageUtils.brandLogo),
                            errorWidget: (ctx, url, dyn) =>
                                Image.asset(ImageUtils.brandLogo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        '${vendor.name}',
                        style: TextStyle(
                          fontSize: SizeMg.text(20),
                          fontWeight: FontWeight.w500,
                          color: Palette.blackGreen,
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(30),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${vendor.name}',
                                style: TextStyle(
                                  fontSize: SizeMg.text(20),
                                  fontWeight: FontWeight.w500,
                                  color: Palette.blackGreen,
                                ),
                              ),
                              SizedBox(
                                width: SizeMg.width(11),
                              ),
                              const Icon(
                                Icons.star_border_rounded,
                                color: Palette.mainOrange,
                              ),
                              Text(
                                '${vendor.rating}(465)',
                                style: TextStyle(
                                  color: Palette.mainOrange,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeMg.text(15),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeMg.height(12),
                          ),
                          Row(
                            children: [
                              Text(
                                '${vendor.address}',
                                style: TextStyle(
                                  fontSize: SizeMg.text(16),
                                  color: Palette.secondaryBlack,
                                ),
                              ),
                              SizedBox(
                                width: SizeMg.width(11),
                              ),
                              const Icon(
                                Icons.info_outline_rounded,
                                color: Palette.secondaryBlack,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeMg.height(12),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time_rounded,
                                color: Palette.secondaryBlack,
                              ),
                              SizedBox(
                                width: SizeMg.width(7),
                              ),
                              Text(
                                '${vendor.prepareTime}',
                                style: TextStyle(
                                  fontSize: SizeMg.text(14),
                                  color: Palette.secondaryBlack,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                ImageUtils.deliveryTruck,
                              ),
                              SizedBox(
                                width: SizeMg.width(7),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: 'Delivery Fee ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: SizeMg.text(14),
                                      color: Palette.secondaryBlack,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: '\u{20A6}',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                        )
                                      ),
                                      TextSpan(
                                        text: '${vendor.minOrder}',
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeMg.height(12),
                          ),
                          Row(
                            children: [
                              Radio<DeliveryArrival>(
                                value: DeliveryArrival.delivery,
                                groupValue: model.deliveryArrival,
                                onChanged: (DeliveryArrival? arrival) {
                                  model.changeDeliveryArrival(arrival!);
                                },
                                visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: Palette.mainOrange,
                              ),
                              SizedBox(
                                width: SizeMg.width(7),
                              ),
                              Text(
                                'Delivery',
                                style: TextStyle(
                                  fontSize: SizeMg.text(14),
                                  color: Palette.secondaryBlack,
                                ),
                              ),
                              SizedBox(
                                width: SizeMg.width(15),
                              ),
                              Radio<DeliveryArrival>(
                                value: DeliveryArrival.pickUp,
                                groupValue: model.deliveryArrival,
                                onChanged: (DeliveryArrival? arrival) {
                                  model.changeDeliveryArrival(arrival!);
                                },
                                visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: Palette.mainOrange,
                              ),
                              SizedBox(
                                width: SizeMg.width(7),
                              ),
                              Text(
                                'Pickup',
                                style: TextStyle(
                                  fontSize: SizeMg.text(14),
                                  color: Palette.secondaryBlack,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TabBar(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeMg.width(30),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Palette.darkGrey,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: SizeMg.text(14),
                      ),
                      indicator: BoxDecoration(
                        color: Palette.mainOrange,
                        borderRadius: BorderRadius.circular(
                          SizeMg.radius(7),
                        ),
                      ),
                      controller: _tabController,
                      tabs: const [
                        Tab(
                          text: 'All',
                        ),
                        Tab(
                          text: 'Combo',
                        ),
                        Tab(
                          text: 'Drinks',
                        ),
                        Tab(
                          text: 'Local',
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: _buildVendorProduct(model, _tabIndex),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildVendorProduct(VendorDetailsViewModel model, int tabIndex){
    switch (tabIndex){
      case 0:
        return VendorProducts(
          productList: model.allProdList,
          searchTextController: _allTextController,
          fillColor: searchFillColor,
          iconColor: searchIconColor,
          vendor: vendor,
          onTextChanged: (value){
            model.searchProducts(value, _tabIndex);
            toggleSearchColor(value);
          },
        );
      case 1:
        return VendorProducts(
          productList: model.comboProdList,
          searchTextController: _comboTextController,
          fillColor: searchFillColor,
          iconColor: searchIconColor,
          vendor: vendor,
          onTextChanged: (value){
            model.searchProducts(value, _tabIndex);
            toggleSearchColor(value);
          },
        );
      case 2:
        return VendorProducts(
          productList: model.drinksProdList,
          searchTextController: _drinksTextController,
          fillColor: searchFillColor,
          iconColor: searchIconColor,
          vendor: vendor,
          onTextChanged: (value){
            model.searchProducts(value, _tabIndex);
            toggleSearchColor(value);
          },
        );
      default:
        return VendorProducts(
          productList: model.localProdList,
          searchTextController: _localTextController,
          fillColor: searchFillColor,
          iconColor: searchIconColor,
          vendor: vendor,
          onTextChanged: (value){
            model.searchProducts(value, _tabIndex);
            toggleSearchColor(value);
          },
        );
    }
  }

  void toggleSearchColor(String s) {
    if (s.isEmpty) {
      setState(() {
        searchFillColor = Palette.staleWhite;
        searchIconColor = Palette.inactiveGrey;
      });
    } else {
      setState(() {
        searchFillColor = Palette.offWhite;
        searchIconColor = Palette.blackGreen;
      });
    }
  }

  @override
  void dispose() {
    _allTextController.dispose();
    _comboTextController.dispose();
    _drinksTextController.dispose();
    _localTextController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
