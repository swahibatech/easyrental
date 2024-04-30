import 'package:easyrental/pages/guest/shared/constant.dart';
import 'package:easyrental/pages/guest/widgets/popular_widget.dart';
import 'package:easyrental/pages/guest/widgets/recommendation_widget.dart';
import 'package:flutter/material.dart';




class GuestScreen extends StatelessWidget {
  const GuestScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/menu.png',
                      width: 18,
                      height: 14,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Find Your\nIdeal Place!',
                      style: semiBold.copyWith(
                        color: black,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: text.withOpacity(0.1),
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: TextField(
                        style: regular.copyWith(
                          color: black,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Container(
                            margin: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: purple,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          hintText: 'Find your ideal home',
                          hintStyle: regular.copyWith(
                            color: text,
                            fontSize: 14,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const PopularWidget(),
              const SizedBox(
                height: 24,
              ),
              const RecommendationWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
