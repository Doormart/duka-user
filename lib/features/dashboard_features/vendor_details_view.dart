import 'package:cached_network_image/cached_network_image.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/constants.dart';
import 'package:duka_user/core/utils/images_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/features/dashboard_features/view_models/vendor_details_view_model.dart';
import 'package:duka_user/features/dashboard_features/widgets/vendor_products.dart';
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

  late TextEditingController _searchTextController;
  late Vendor vendor;
  late TabController _tabController;

  @override
  void initState() {
    vendor = widget.vendor;

    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
      });
    });

    _searchTextController = TextEditingController();
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
          return GestureDetector(
            onTap: focusManager.primaryFocus?.unfocus,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  snap: false,
                  expandedHeight: screenHeight * 0.3,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
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
                            Text(
                              'Delivery Fee N${vendor.minOrder}',
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
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeMg.height(20),
                    horizontal: SizeMg.width(30),
                  ),
                  sliver: SliverToBoxAdapter(
                    child: TextField(
                      controller: _searchTextController,
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
                        fillColor: searchFillColor,
                        prefixIcon: Icon(
                          Icons.search,
                          color: searchIconColor,
                        ),
                      ),
                      onChanged: (value) {
                        searchResults(_tabIndex);
                        toggleSearchColor(value);
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _buildVendorProduct(model, _tabIndex),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void searchResults(int index) {
    switch (index) {
      case 0:
        print('0');
        return;
      case 1:
        print('1');
        return;
      case 2:
        print('2');
        return;
      case 3:
        print('3');
        return;
      default:
        print('0');
        return;
    }
  }

  Widget _buildVendorProduct(VendorDetailsViewModel model, int tabIndex){
    switch (tabIndex){
      case 0:
        return VendorProducts(
          productList: model.prodList,
        );
      case 1:
        return VendorProducts(
          productList: model.prodList,
        );
      case 2:
        return VendorProducts(
          productList: model.prodList,
        );
      default:
        return VendorProducts(
          productList: model.prodList,
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
    _searchTextController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
