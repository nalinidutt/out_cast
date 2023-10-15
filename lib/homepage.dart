import 'package:cookin/home/sample_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'cart.dart'; // This line imports the Cart class from cart.dart
import 'profile/profile.dart';
void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          const SampleItemListView(), 
          BookPage(),   
          Cart(),
          const Profile(),      // This is the Cart widget you provided earlier
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.green.shade200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 20.0),
          child: GNav(
            backgroundColor: Colors.green.shade200,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.green.shade300,
            gap: 8,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
              _pageController.jumpToPage(index);
            },
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.book,
                text: 'Book',
              ),
              
              GButton(           // Add a GButton for the Cart
                icon: Icons.shopping_cart,
                text: 'Cart',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Screen'));
  }
}

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Book Page'));
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Page'));
  }
}