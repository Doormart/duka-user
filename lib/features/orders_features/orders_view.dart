import 'package:dotted_line/dotted_line.dart';
import 'package:duka_user/core/models/simulation/simul_models/order_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_product.dart';
import 'package:duka_user/core/shared_widgets/buttons.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/constants.dart';
import 'package:duka_user/core/utils/images_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/core/utils/string_utils.dart';
import 'package:duka_user/features/orders_features/view_models/orders_view_model.dart';
import 'package:duka_user/features/dashboard_features/widgets/completed_order_box.dart';
import 'package:duka_user/features/dashboard_features/widgets/order_container.dart';
import 'package:duka_user/features/dashboard_features/widgets/placedOrderContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final FocusManager focusManager = FocusManager.instance;

  Color addressFillColor = Palette.staleWhite;
  Color instructionsFillColor = Palette.staleWhite;
  Color couponFillColor = Palette.staleWhite;

  Color addressIconColor = Palette.inactiveGrey;
  Color couponIconColor = Palette.inactiveGrey;

  late TextEditingController _addressController;
  late TextEditingController _instructionsController;
  late TextEditingController _couponController;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    _addressController = TextEditingController();
    _instructionsController = TextEditingController();
    _couponController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      backgroundColor: Palette.offWhite,
      appBar: AppBar(
        title: Text('Orders',
            style: TextStyle(
              fontSize: SizeMg.text(20),
              fontWeight: FontWeight.w500,
              color: Palette.blackGreen,
            ),),
        centerTitle: true,
        bottom: TabBar(
          labelStyle: TextStyle(
            fontSize: SizeMg.text(18),
          ),
          labelColor: Palette.secondaryBlack,
          indicatorColor: Palette.mainOrange,
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Ongoing',
            ),
            Tab(
              text: 'Completed',
            )
          ],
        ),
      ),
      body: ViewModelBuilder<OrdersViewModel>.reactive(
        viewModelBuilder: () => OrdersViewModel(),
        onModelReady: (model) => model.init(),
        fireOnModelReadyOnce: true,
        disposeViewModel: false,
        builder: (_, model, __) => TabBarView(
          controller: _tabController,
          children: [
            Builder(
              builder: (ctx) {
                if (model.isBusy){
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Palette.mainOrange,
                    ),
                  );
                }

                if (model.orderProduct.isEmpty &&
                    model.placedOrderProduct.isEmpty) {
                  return Center(
                    child: Text(
                      'No ongoing order. Order something',
                      style: TextStyle(
                        fontSize: SizeMg.text(18),
                        color: Palette.blackGreen,
                      ),
                    ),
                  );
                }

                return ListView(
                  padding: EdgeInsets.only(
                    top: SizeMg.height(10),
                  ),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Visibility(
                      visible: model.placedOrderProduct.isNotEmpty,
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                          bottom: SizeMg.height(20),
                        ),
                        shrinkWrap: true,
                        itemCount: model.placedOrderProduct.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          final VendorProduct vendorProduct =
                              model.placedOrderProduct.keys.elementAt(index);
                          final int productAmount =
                              model.placedOrderProduct.values.elementAt(index);
                          return PlacedOrderContainer(
                            vendorProduct: vendorProduct,
                            productAmount: productAmount,
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: model.orderProduct.isNotEmpty,
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: model.orderProduct.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) {
                              final VendorProduct vendorProduct =
                                  model.orderProduct.keys.elementAt(index);
                              final int productAmount =
                                  model.orderProduct.values.elementAt(index);
                              return OrderContainer(
                                vendorProduct: vendorProduct,
                                productAmount: productAmount,
                              );
                            },
                          ),
                          //Delivery Details
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeMg.width(31),
                              vertical: SizeMg.height(10),
                            ),
                            child: Text(
                              'Delivery Details',
                              style: TextStyle(
                                fontSize: SizeMg.text(20),
                                color: Palette.blackGreen,
                              ),
                            ),
                          ),
                          ColoredBox(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                //Address
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeMg.width(31),
                                    vertical: SizeMg.height(14),
                                  ),
                                  child: Text(
                                    'Address',
                                    style: TextStyle(
                                      fontSize: SizeMg.text(16),
                                      color: Palette.secondaryBlack,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeMg.width(31),
                                  ),
                                  child: Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      controller: _addressController,
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.streetAddress,
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                        fontSize: SizeMg.text(18),
                                        fontWeight: FontWeight.w400,
                                        color: Palette.blackGreen,
                                      ),
                                      decoration: kFormTextDecoration.copyWith(
                                        hintText: 'Enter address',
                                        fillColor: addressFillColor,
                                        prefixIcon: Icon(
                                          Icons.location_on_outlined,
                                          color: addressIconColor,
                                        ),
                                      ),
                                      onChanged: (value) => _toggleAddressColor(
                                        value,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Address cannot be empty';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: SizeMg.height(14),
                                  ),
                                  child: const DottedLine(
                                    dashGapLength: 0,
                                    dashColor: Palette.borderLine,
                                  ),
                                ),
                                //Time
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeMg.width(31),
                                  ),
                                  child: Text(
                                    'Time',
                                    style: TextStyle(
                                      fontSize: SizeMg.text(16),
                                      color: Palette.secondaryBlack,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: SizeMg.width(14),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: RadioListTile<DeliveryTime>(
                                          title: Text(
                                            'Now',
                                            style: TextStyle(
                                              fontSize: SizeMg.text(14),
                                              color: Palette.secondaryBlack,
                                            ),
                                          ),
                                          activeColor: Palette.mainOrange,
                                          value: DeliveryTime.now,
                                          groupValue: model.deliveryTime,
                                          onChanged: (time) {
                                            model.changeDeliveryTime(time!);
                                          },
                                          visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: RadioListTile<DeliveryTime>(
                                          title: Text(
                                            'Schedule',
                                            style: TextStyle(
                                              fontSize: SizeMg.text(14),
                                              color: Palette.secondaryBlack,
                                            ),
                                          ),
                                          activeColor: Palette.mainOrange,
                                          value: DeliveryTime.schedule,
                                          groupValue: model.deliveryTime,
                                          onChanged: (time) {
                                            model.changeDeliveryTime(time!);
                                          },
                                          visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: SizeMg.height(10),
                                  ),
                                  child: const DottedLine(
                                    dashGapLength: 0,
                                    dashColor: Palette.borderLine,
                                  ),
                                ),
                                //PaymentMethod
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeMg.width(31),
                                  ),
                                  child: Text(
                                    'Payment Method',
                                    style: TextStyle(
                                      fontSize: SizeMg.text(16),
                                      color: Palette.secondaryBlack,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: SizeMg.width(14),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: RadioListTile<PaymentMethod>(
                                          title: Text(
                                            'Wallet',
                                            style: TextStyle(
                                              fontSize: SizeMg.text(14),
                                              color: Palette.secondaryBlack,
                                            ),
                                          ),
                                          activeColor: Palette.mainOrange,
                                          value: PaymentMethod.wallet,
                                          groupValue: model.paymentMethod,
                                          onChanged: (payment) {
                                            model.changePaymentMethod(payment!);
                                          },
                                          visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: RadioListTile<PaymentMethod>(
                                          title: Text(
                                            'Card',
                                            style: TextStyle(
                                              fontSize: SizeMg.text(14),
                                              color: Palette.secondaryBlack,
                                            ),
                                          ),
                                          activeColor: Palette.mainOrange,
                                          value: PaymentMethod.card,
                                          groupValue: model.paymentMethod,
                                          onChanged: (payment) {
                                            model.changePaymentMethod(payment!);
                                          },
                                          visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //DeliveryInstructions
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeMg.width(31),
                                    vertical: SizeMg.height(10),
                                  ),
                                  child: Text(
                                    'Delivery Instructions',
                                    style: TextStyle(
                                      fontSize: SizeMg.text(16),
                                      color: Palette.secondaryBlack,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeMg.width(31),
                                  ),
                                  child: TextField(
                                    controller: _instructionsController,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.text,
                                    cursorColor: Colors.black,
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: SizeMg.text(18),
                                      fontWeight: FontWeight.w400,
                                      color: Palette.blackGreen,
                                    ),
                                    decoration: kFormTextDecoration.copyWith(
                                      hintText: 'Enter instructions',
                                      fillColor: instructionsFillColor,
                                    ),
                                    onChanged: (value) =>
                                        _toggleInstructionsColor(
                                      value,
                                    ),
                                  ),
                                ),
                                //Coupon
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeMg.width(31),
                                    vertical: SizeMg.height(10),
                                  ),
                                  child: Text(
                                    'Coupon?',
                                    style: TextStyle(
                                      fontSize: SizeMg.text(16),
                                      color: Palette.secondaryBlack,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeMg.width(31),
                                  ),
                                  child: TextField(
                                    controller: _couponController,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.text,
                                    cursorColor: Colors.black,
                                    style: TextStyle(
                                      fontSize: SizeMg.text(18),
                                      fontWeight: FontWeight.w400,
                                      color: Palette.blackGreen,
                                    ),
                                    decoration: kFormTextDecoration.copyWith(
                                      hintText: 'Enter coupon',
                                      fillColor: couponFillColor,
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            left: SizeMg.width(10)),
                                        child: SvgPicture.asset(
                                          ImageUtils.coupon,
                                          color: couponIconColor,
                                        ),
                                      ),
                                      prefixIconConstraints: BoxConstraints(
                                        maxHeight: SizeMg.height(24),
                                        maxWidth: SizeMg.width(40),
                                      ),
                                      prefix: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: SizeMg.width(5),
                                        ),
                                      ),
                                    ),
                                    onChanged: (value) => _toggleCouponColor(
                                      value,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: SizeMg.height(40),
                                  ),
                                  child: const DottedLine(
                                    dashLength: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeMg.height(20),
                          ),
                          //Checkout
                          ColoredBox(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeMg.width(31),
                                vertical: SizeMg.height(24),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  //Sub-total
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Sub-total',
                                        style: TextStyle(
                                          fontSize: SizeMg.text(18),
                                          color: Palette.secondaryBlack,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: '\u20A6',
                                          style: TextStyle(
                                            fontSize: SizeMg.text(18),
                                            fontWeight: FontWeight.w500,
                                            color: Palette.secondaryBlack,
                                            fontFamily: 'Roboto',
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  StringUtils.numFormatDecimal(
                                                      model.subTotal),
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeMg.height(10),
                                  ),
                                  //Delivery Fee
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Delivery Fee',
                                        style: TextStyle(
                                          fontSize: SizeMg.text(18),
                                          color: Palette.secondaryBlack,
                                        ),
                                      ),
                                      Builder(
                                        builder: (ctx) {
                                          if (model.deliveryFee == 0) {
                                            return Text(
                                              'Free',
                                              style: TextStyle(
                                                fontSize: SizeMg.text(18),
                                                color: Palette.secondaryBlack,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            );
                                          }

                                          return RichText(
                                            text: TextSpan(
                                              text: '\u20A6',
                                              style: TextStyle(
                                                fontSize: SizeMg.text(18),
                                                fontWeight: FontWeight.w500,
                                                color: Palette.secondaryBlack,
                                                fontFamily: 'Roboto',
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: StringUtils
                                                      .numFormatDecimal(
                                                          model.deliveryFee),
                                                  style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeMg.height(10),
                                  ),
                                  //Total
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                          fontSize: SizeMg.text(18),
                                          color: Palette.mainOrange,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: '\u20A6',
                                          style: TextStyle(
                                            fontSize: SizeMg.text(18),
                                            fontWeight: FontWeight.w500,
                                            color: Palette.mainOrange,
                                            fontFamily: 'Roboto',
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  StringUtils.numFormatDecimal(
                                                      model.total),
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //Buttons
                          PrimaryButton(
                            margin: EdgeInsets.symmetric(
                              horizontal: SizeMg.width(31),
                              vertical: SizeMg.height(21),
                            ),
                            buttonConfig: ButtonConfig(
                              text: 'Place Order',
                              action: () async {
                                if (_formKey.currentState!.validate()) {
                                  _buildPreparingOrder(model);
                                }
                                focusManager.primaryFocus?.unfocus();
                              },
                              disabled: _addressController.text.isEmpty,
                            ),
                          ),
                          PrimaryButton(
                            margin: EdgeInsets.only(
                              left: SizeMg.width(31),
                              right: SizeMg.width(31),
                              bottom: SizeMg.height(20),
                            ),
                            textColor: Colors.red,
                            color: Palette.lightRed,
                            buttonConfig: ButtonConfig(
                              text: 'Cancel Order',
                              action: () {
                                model.cancelOrder();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Builder(
              builder: (ctx) {
                if (model.isBusy){
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Palette.mainOrange,
                    ),
                  );
                }

                if (model.completedOrders == null || model.completedOrders!.isEmpty) {
                  return Center(
                    child: Text(
                      'No completed order. Order something',
                      style: TextStyle(
                        fontSize: SizeMg.text(18),
                        color: Palette.blackGreen,
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: model.completedOrders!.length,
                  padding: EdgeInsets.symmetric(
                    vertical: SizeMg.height(10),
                  ),
                  itemBuilder: (ctx, index){
                    Order completedOrder = model.completedOrders![index];
                    return GestureDetector(
                      onTap: (){
                        _buildCompletedBottomSheet(model, completedOrder);
                      },
                      child: CompletedOrderBox(
                        completedOrder: completedOrder,
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) => const DottedLine(
                    dashGapLength: 0,
                    dashColor: Palette.inactiveGrey,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _buildPreparingOrder(OrdersViewModel model) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeMg.radius(30),
          ),
        ),
        children: [
          Image.asset(
            ImageUtils.placingOrderGif,
            fit: BoxFit.cover,
            height: SizeMg.height(86),
          ),
          SizedBox(
            height: SizeMg.height(10),
          ),
          Text(
            'Processing Order',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeMg.text(18),
              color: Palette.secondaryBlack,
            ),
          ),
        ],
      ),
    );
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    model.checkOut();
    _popDialog();
  }

  void _popDialog() {
    Navigator.pop(context);
  }

  Future _buildCompletedBottomSheet(OrdersViewModel model, Order completedOrder){
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            SizeMg.radius(50),
          ),
          topLeft: Radius.circular(
            SizeMg.radius(50),
          ),
        ),
        child: ColoredBox(
          color: Colors.white,
          child: DraggableScrollableSheet(
            expand: false,
            maxChildSize: 0.8,
            builder: (ctx, scrollController){
              DateTime departure = completedOrder.deliveryDeparture;
              DateTime arrival = completedOrder.deliveryArrival;
              return ListView(
                controller: scrollController,
                padding: EdgeInsets.symmetric(
                  horizontal: SizeMg.width(26),
                ),
                shrinkWrap: true,
                children: [
                  Container(
                    height: SizeMg.height(10),
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeMg.width(140),
                      vertical: SizeMg.height(30),
                    ),
                    decoration: BoxDecoration(
                      color: Palette.darkGrey,
                      borderRadius:
                      BorderRadius.circular(SizeMg.radius(30),),
                    ),
                  ),
                  //Order id
                  Text(
                    'Order ${completedOrder.id}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: SizeMg.text(20),
                      color: Palette.blackGreen,
                    ),
                  ),
                  SizedBox(
                    height: SizeMg.height(21),
                  ),
                  //From
                  Row(
                    children: [
                      Text(
                        'From',
                        style: TextStyle(
                          fontSize: SizeMg.text(16),
                          color: Palette.blackGreen,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: SizeMg.width(10),
                      ),
                      Flexible(
                        child: Text(
                          '${completedOrder.vendor.address}',
                          style: TextStyle(
                            fontSize: SizeMg.text(16),
                            color: Palette.secondaryBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeMg.height(21),
                  ),
                  //To
                  Row(
                    children: [
                      Text(
                        'To',
                        style: TextStyle(
                          fontSize: SizeMg.text(16),
                          color: Palette.blackGreen,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: SizeMg.width(32),
                      ),
                      Flexible(
                        child: Text(
                          completedOrder.address,
                          style: TextStyle(
                            fontSize: SizeMg.text(16),
                            color: Palette.secondaryBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeMg.height(21),
                  ),
                  //DeliveryTime
                  Row(
                    children: [
                      Text(
                        'Delivery Time',
                        style: TextStyle(
                          fontSize: SizeMg.text(14),
                          color: Palette.blackGreen,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: SizeMg.width(10),
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: '${StringUtils.timeDiffInMinutes(departure, arrival)}mins ',
                          style: TextStyle(
                            fontSize: SizeMg.text(14),
                            fontWeight: FontWeight.w500,
                            color: Palette.secondaryBlack,
                          ),
                          children: [
                            TextSpan(
                              text: '(${StringUtils.formatTime12(departure)} - ${StringUtils.formatTime12(arrival)})',
                              style: const TextStyle(
                                color: Palette.darkGrey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //Product Container
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: SizeMg.height(20),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeMg.width(14),
                      vertical: SizeMg.height(17),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        SizeMg.radius(10),
                      ),
                      color: Palette.offWhite,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '${completedOrder.quantity}x ${completedOrder.product.name}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeMg.text(16),
                            color: Palette.blackGreen,
                          ),
                        ),
                        SizedBox(
                          height: SizeMg.height(14),
                        ),
                        //Sub-total
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub-Total',
                              style: TextStyle(
                                fontSize: SizeMg.text(14),
                                color: Palette.secondaryBlack,
                              ),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: '\u20A6',
                                style: TextStyle(
                                  fontSize: SizeMg.text(14),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  color: Palette.secondaryBlack,
                                ),
                                children: [
                                  TextSpan(
                                    text: StringUtils.numFormatDecimal(completedOrder.product.price! * completedOrder.quantity),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        //Delivery Fee
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery',
                              style: TextStyle(
                                fontSize: SizeMg.text(14),
                                color: Palette.secondaryBlack,
                              ),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: '\u20A6',
                                style: TextStyle(
                                  fontSize: SizeMg.text(14),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  color: Palette.secondaryBlack,
                                ),
                                children: [
                                  TextSpan(
                                    text: completedOrder.vendor.minOrder,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        //Total
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: SizeMg.text(14),
                                color: Palette.secondaryBlack,
                              ),
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: '\u20A6',
                                style: TextStyle(
                                  fontSize: SizeMg.text(14),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  color: Palette.secondaryBlack,
                                ),
                                children: [
                                  TextSpan(
                                    text: StringUtils.numFormatDecimal(completedOrder.total),
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Rating
                  Text(
                    'Rate your order',
                    style: TextStyle(
                      fontSize: SizeMg.text(16),
                      fontWeight: FontWeight.w500,
                      color: Palette.blackGreen,
                    ),
                  ),
                  SizedBox(
                    height: SizeMg.height(20),
                  ),
                  RatingBar(
                    initialRating: completedOrder.rating ?? 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemPadding: EdgeInsets.symmetric(
                      horizontal: SizeMg.width(4.0),
                    ),
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      half: const Icon(
                        Icons.star_half,
                        color: Colors.amber,
                      ),
                      empty: const Icon(
                        Icons.star_outline_outlined,
                        color: Palette.inactiveGrey,
                      ),
                    ),
                    onRatingUpdate: (rating) {
                      model.rateOrder(rating);
                      Navigator.pop(context);
                      },
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  void _toggleAddressColor(String s) {
    if (s.isEmpty) {
      setState(() {
        addressFillColor = Palette.staleWhite;
        addressIconColor = Palette.inactiveGrey;
      });
    } else {
      setState(() {
        addressFillColor = Palette.offWhite;
        addressIconColor = Palette.secondaryBlack;
      });
    }
  }

  void _toggleInstructionsColor(String s) {
    if (s.isEmpty) {
      setState(() {
        instructionsFillColor = Palette.staleWhite;
      });
    } else {
      setState(() {
        instructionsFillColor = Palette.offWhite;
      });
    }
  }

  void _toggleCouponColor(String s) {
    if (s.isEmpty) {
      setState(() {
        couponIconColor = Palette.inactiveGrey;
        couponFillColor = Palette.staleWhite;
      });
    } else {
      setState(() {
        couponFillColor = Palette.offWhite;
        couponIconColor = Palette.secondaryBlack;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _addressController.dispose();
    _instructionsController.dispose();
    _couponController.dispose();
    super.dispose();
  }
}
