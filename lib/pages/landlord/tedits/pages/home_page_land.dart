import 'package:easyrental/components/calender.dart';
import 'package:easyrental/components/mydrawer.dart';
import 'package:easyrental/pages/chat_home_page.dart';
import 'package:easyrental/pages/landlord/tedits/widgets/optionstab.dart';
import 'package:easyrental/pages/landlord/tedits/widgets/upcoming_card.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:easyrental/pages/landlord/tedits/widgets/mainrequest.dart';
import 'package:easyrental/pages/profilepage.dart';

class HomePageLandy extends StatelessWidget {
  const HomePageLandy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi, Landlord"),
            Text(
              "How can we assist you today?",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.notifications_outline),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
            icon: const Icon(Ionicons.people_circle_outline),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          const LandlordCard(),
          const SizedBox(height: 20),
          Text(
            "Category",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          const OptionsTab(),
          const SizedBox(height: 25),
          Text(
            "Maintenace Requests",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          const MaintenaceReq(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            activeIcon: Icon(Ionicons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.calendar_outline),
            activeIcon: Icon(Ionicons.calendar),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.chatbubble_ellipses_outline),
            label: "Chat",
            activeIcon: Icon(Ionicons.chatbubble_ellipses),
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            activeIcon: Icon(Ionicons.person),
            label: "Profile",
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            // Navigate to Home Page
            
            // Implement navigation logic here
          } else if (index == 1) {
            // Navigate to Calendar Page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CalendarPage(),
              ),
            );
            // Implement navigation logic here
          } else if (index == 2) {
            // Navigate to Chat Page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatHomePage(),
              ),
            );
            
          } else if (index == 3) {
            // Navigate to Profile Page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          }
        },
      ),
    );
  }
}
