import 'package:easyrental/pages/guest/models/house_model.dart';
import 'package:easyrental/pages/guest/screens/detail_screen.dart';
import 'package:easyrental/pages/guest/shared/constant.dart';
import 'package:flutter/material.dart';



class PopularWidget extends StatelessWidget {
  const PopularWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          popular.length,
          (i) => InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const DetailScreen(),
              ),
            ),
            child: Container(
              width: 232,
              height: 210,
              margin: EdgeInsets.only(
                left: i == 0 ? 30 : 0,
                right: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: text.withOpacity(0.06),
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/${popular[i].image}'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popular[i].name,
                              style: semiBold.copyWith(
                                color: black,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              popular[i].city,
                              style: regular.copyWith(
                                color: text,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: orange,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              popular[i].rating.toString(),
                              style: medium.copyWith(
                                color: black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
