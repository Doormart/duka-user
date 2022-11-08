import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';

class CarouselStack extends StatelessWidget {
  final Vendor vendor;
  final VoidCallback onTap;

  const CarouselStack({
    Key? key,
    required this.vendor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                SizeMg.radius(15),
              ),
              image: DecorationImage(
                image: NetworkImage(vendor.publicImage!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0.5,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Palette.imageGradBegin,
                    Palette.imageGradEnd,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.5,
                    0.8,
                  ],
                ),
                borderRadius: BorderRadius.circular(
                  SizeMg.radius(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeMg.width(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${vendor.name}',
                      style: TextStyle(
                        fontSize: SizeMg.text(16),
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${vendor.prepareTime}',
                      style: TextStyle(
                        fontSize: SizeMg.text(12),
                        color: Palette.imageDetails,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_border_rounded,
                          color: Palette.imageDetails,
                          size: 14,
                        ),
                        Text(
                          '${vendor.rating}(465)',
                          style: TextStyle(
                            color: Palette.imageDetails,
                            fontSize: SizeMg.text(12),
                          ),
                        ),
                        const Spacer(),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(SizeMg.radius(8)),
                            color: Palette.imageHeart,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeMg.width(5.0),
                              vertical: SizeMg.height(5.0),
                            ),
                            child: const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeMg.height(12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
