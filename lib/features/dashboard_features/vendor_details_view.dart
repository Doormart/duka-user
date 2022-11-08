import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/features/dashboard_features/view_models/vendor_details_view_model.dart';
import 'package:flutter/material.dart';
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

class _VendorDetailsViewState extends State<VendorDetailsView> {
  late Vendor vendor;

  @override
  void initState() {
    super.initState();
    vendor = widget.vendor;
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
        builder: (_, model, __) => CustomScrollView(
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
                background: Image.network(
                  vendor.publicImage!,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  vendor.name!,
                  style: TextStyle(
                    fontSize: SizeMg.text(20),
                    fontWeight: FontWeight.w500,
                    color: Palette.blackGreen,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                child: Center(
                  child: Text('Scroll to see the SliverAppBar in effect.'),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 100.0,
                    child: Center(
                      child: Text('$index', textScaleFactor: 5),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
