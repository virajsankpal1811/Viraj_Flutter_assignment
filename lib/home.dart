import 'package:assignment/OrderScreen.dart';
import 'package:assignment/ProfileScreen.dart';
import 'package:assignment/main.dart';
import 'package:assignment/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Bodypart(),
    const OrderScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async {
                    var sharedpref = await SharedPreferences.getInstance();
                    sharedpref.setBool(SplashScreenState.KEYLOGIN, false);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                  child: Text('Logout')),
            )
          ],
          backgroundColor: Colors.white60,
          // centerTitle: true,

          title: const Text(
            'DASHBOARD',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )),
      body: _pages[_currentIndex],
    );
  }
}

class Bodypart extends StatelessWidget {
  const Bodypart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          height: 180,
                          width: 250,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(15)),
                          // child:
                          //image assets
                          // Image.asset(
                          //   'assets/images/images1.jpg',
                          //   // fit: BoxFit.fill,
                          // ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 180,
                          width: 550,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //image assets
                          // child: Image.asset('assets/images/images1.jpg',
                          //     fit: BoxFit.fill),
                        )
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Images asest
                      // Image.asset(
                      // 'assets/images/images2.jpg',
                      // height: 80,
                      // ),
                      Text('Item $index'),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
