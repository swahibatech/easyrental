// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easyrental/components/adds/addprop.dart';
import 'package:easyrental/components/payment/landlordpay.dart';
import 'package:easyrental/pages/chat_home_page.dart';
import 'package:easyrental/pages/landlord/application/application.dart';
import 'package:easyrental/pages/landlord/tedits/pages/docs.dart';
import 'package:flutter/material.dart';

class OptionsTab extends StatelessWidget {
  const OptionsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CustomIcon> customIcons = [
      CustomIcon(name: "Applications", icon: 'assets/Applications.png'),
      CustomIcon(name: "Tenants", icon: 'assets/tenants.png'),
      CustomIcon(name: "Payments", icon: 'assets/pay.png'),
      CustomIcon(name: "More", icon: 'assets/more.png'),
    ];
    List<CustomIcon> main = [
      CustomIcon(name: "Applications", icon: 'assets/Applications.png'),
      CustomIcon(name: "Tenant", icon: 'assets/tenants.png'),
      CustomIcon(name: "Chat", icon: 'assets/chat.png'),
      CustomIcon(name: "Doccuments", icon: 'assets/cer.png'),
    ];
    List<CustomIcon> prop = [
      CustomIcon(name: "Add Property", icon: 'assets/addprop.png'),
      CustomIcon(name: "Analytics", icon: 'assets/analytics.png'),
      CustomIcon(name: "Payments", icon: 'assets/pay.png'),
      CustomIcon(name: "Help", icon: 'assets/help.png'),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(customIcons.length, (index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                if (index == customIcons.length - 1) {
                  // Show modal bottom sheet for "More" button
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    builder: (context) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        height: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // main SECTION
                            Text(
                              "Main Categories",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                main.length,
                                (index) {
                                  return buildIcon(context, main[index]);
                                },
                              ),
                            ),
                            SizedBox(height: 30),
                            //prop section
                            Text(
                              "Property Tabs",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                prop.length,
                                (index) {
                                  return buildIcon(context, prop[index]);
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  // Navigate to respective page based on the selected CustomIcon
                  navigateToPage(context, customIcons[index]);
                }
              },
              borderRadius: BorderRadius.circular(90),
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  customIcons[index].icon,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(customIcons[index].name)
          ],
        );
      }),
    );
  }

  // Function to build icon widget
  Widget buildIcon(BuildContext context, CustomIcon customIcon) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigate to respective page based on the selected CustomIcon
            navigateToPage(context, customIcon);
          },
          borderRadius: BorderRadius.circular(90),
          child: Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              customIcon.icon,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(customIcon.name)
      ],
    );
  }

  // Function to navigate to respective page based on selected CustomIcon
  void navigateToPage(BuildContext context, CustomIcon customIcon) {
    switch (customIcon.name) {
      case 'Applications':
        // Navigate to ApplicationsPage
         Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ApplicationsPage()),
        );
        break;
      case 'Tenants':
        // Navigate to TenantsPage
        break;
      case 'Payments':
        // Navigate to PaymentsPage
         Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LandlordPay()),
  );
        break;
      case 'Chat':
        // Navigate to ChatPage
        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ChatHomePage()),
  );
        break;
      case 'Add Property':
  // Navigate to PropertyPage
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AddProp()),
  );
  break;

      // Add cases for other functionalities here
      case 'Doccuments':
  // Navigate to docs
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  AddDocs()),
  );
  break;
    }
  }
}

class CustomIcon {
  final String name;
  final String icon;

  CustomIcon({
    required this.name,
    required this.icon,
  });
}
