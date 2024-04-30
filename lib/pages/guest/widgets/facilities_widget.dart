import 'package:easyrental/pages/guest/models/facility_model.dart';
import 'package:easyrental/pages/guest/shared/constant.dart';
import 'package:flutter/material.dart';


class FacilitiesWidget extends StatelessWidget {
  const FacilitiesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          modernHouseFacilities.length,
          (i) => Container(
            width: 100,
            height: 110,
            margin: const EdgeInsets.only(right: 20, bottom: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: text.withOpacity(0.2),
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 16,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/${modernHouseFacilities[i].image}',
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  modernHouseFacilities[i].name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
