import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:safeherven_app/screens/places.dart';
import 'package:safeherven_app/screens/alert.dart';
import 'package:safeherven_app/screens/home.dart';


class MenuBottom extends StatelessWidget {
  const MenuBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const SignInScreen(providerConfigs: [
                        EmailProviderConfiguration(),
                      ],);
                    }
                    return HomeScreen(user: snapshot.data!);
                  }
                ),
              ),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PlacesScreen()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AlertScreen()),
            );
            break;
        }
      },
      items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Places',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            label: 'Alert',
          ),
        ],
        selectedItemColor: Colors.purple[500],
    );
  }
}