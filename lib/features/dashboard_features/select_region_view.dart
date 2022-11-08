import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/constants.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/features/dashboard_features/view_models/select_region_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SelectRegionView extends StatefulWidget {
  const SelectRegionView({Key? key}) : super(key: key);

  @override
  State<SelectRegionView> createState() => _SelectRegionViewState();
}

class _SelectRegionViewState extends State<SelectRegionView> {

  Color searchFillColor = Palette.staleWhite;
  Color searchIconColor = Palette.inactiveGrey;

  late TextEditingController _searchTextController;

  @override
  void initState() {
    _searchTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: Text(
          'Select Region',
          style: TextStyle(
            fontSize: SizeMg.text(20),
            color: Palette.blackGreen,
          ),
        ),
        titleSpacing: 0,
      ),
      body: ViewModelBuilder<SelectRegionViewModel>.reactive(
        viewModelBuilder: () => SelectRegionViewModel(),
        builder: (_, model, __) => SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeMg.height(25),
                  horizontal: SizeMg.width(21),
                ),
                child: TextField(
                  controller: _searchTextController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: SizeMg.text(18),
                    fontWeight: FontWeight.w400,
                    color: Palette.blackGreen,
                  ),
                  decoration: kFormTextDecoration.copyWith(
                    hintText: 'Search',
                    fillColor: searchFillColor,
                    prefixIcon: Icon(
                      Icons.search,
                      color: searchIconColor,
                    ),
                  ),
                  onChanged: (value) {
                    model.showRegion(value.toLowerCase());
                    toggleSearchColor(value);
                  },
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context){
                    if (model.regionsList == null || model.regionsList!.isEmpty){
                      return Center(
                        child: Text(
                          'No region found',
                          style: TextStyle(
                            fontSize: SizeMg.text(18),
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: model.regionsList!.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (ctx, index) => GestureDetector(
                        onTap: (){
                          model.selectRegion(model.regionsList![index]);
                          model.previousView();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeMg.width(22),
                            vertical: SizeMg.height(18),
                          ),
                          child: Text(
                            model.regionsList![index].region!,
                            style: TextStyle(
                              fontSize: SizeMg.text(18),
                              color: Palette.secondaryBlack,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toggleSearchColor(String s){
    if (s.isEmpty){
      setState(() {
        searchFillColor = Palette.staleWhite;
        searchIconColor = Palette.inactiveGrey;
      });
    }
    else {
      setState(() {
        searchFillColor = Palette.offWhite;
        searchIconColor = Palette.blackGreen;
      });
    }
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }
}

