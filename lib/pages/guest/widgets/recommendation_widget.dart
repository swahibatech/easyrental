import 'package:easyrental/pages/guest/models/house_model.dart';
import 'package:easyrental/pages/guest/shared/constant.dart';
import 'package:flutter/material.dart';




class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended For You',
            style: semiBold.copyWith(
              color: black,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ...List.generate(
            recommendation.length,
            (i) => Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: text.withOpacity(0.06),
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/${recommendation[i].image}'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recommendation[i].name,
                            style: semiBold.copyWith(
                              color: black,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            recommendation[i].city,
                            style: regular.copyWith(
                              color: text,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: orange,
                                size: 14,
                              ),
                              Text(
                                recommendation[i].rating.toString(),
                                style: medium.copyWith(
                                  color: black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const Icon(Icons.chevron_right)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
