import 'package:easyrental/pages/chat_home_page.dart';
import 'package:easyrental/pages/landlord/tedits/pages/home_page_land.dart';
import 'package:easyrental/pages/tenant/topoedits/dashboard/homepagetenant.dart';
import 'package:easyrental/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // User is logged in
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              // Check user's email
              switch (user.email) {
                case 'tenant@mail.com':
                  return MyHomePageTenant();
                case 'landlord@mail.com':
                  return HomePageLandy();
                default:
                  return ChatHomePage(); // Default page for other users
              }
            } else {
              return LoginOrRegister(); // Show login or register page if user is null
            }
          } else {
            return LoginOrRegister(); // Show login or register page if there's no data
          }
        },
      ),
    );
  }
}
