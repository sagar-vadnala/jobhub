import 'package:flutter/material.dart';
import 'package:jobhub/views/ui/screens/cart.dart';
import 'package:jobhub/views/ui/screens/favorite_screen.dart';
import 'package:jobhub/views/ui/screens/profile/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    FavoritesScreen(),
    CartScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  AppBar _getAppBar() {
    switch (_selectedIndex) {
      case 0:
        return AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('6391 Elgin St. Celina, Delaware 10299',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          actions: [
            IconButton(icon: Icon(Icons.shopping_basket), onPressed: () {}),
          ],
        );
      case 1:
        return AppBar(
          automaticallyImplyLeading: false,
          title:
              Text('Favorites', style: TextStyle(fontWeight: FontWeight.bold)),
        );
      case 2:
        return AppBar(
          automaticallyImplyLeading: false,
          title: Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        );
      case 3:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green,
          elevation: 0,
          centerTitle: true,
          title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        );
      default:
        return AppBar(
          automaticallyImplyLeading: false,
          title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: _getAppBar(),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),
        ),
        _buildCategorySection(),
        _buildBanner(),
        _buildBestDealsSection(),
      ],
    );
  }

  Widget _buildCategorySection() {
    final List<Map<String, dynamic>> categories = [
      {"name": "Vegetables\n& Fruits", "icon": Icons.apple},
      {"name": "Dairy &\nBreakfast", "icon": Icons.egg},
      {"name": "Cold Drinks\n& Juices", "icon": Icons.local_drink},
      {"name": "Instant &\nFrozen Food", "icon": Icons.fastfood},
      {"name": "Tea &\nCoffee", "icon": Icons.coffee},
      {"name": "Atta, Rice\n& Dal", "icon": Icons.grain},
      {"name": "Masala, Oil\n& Dry Fruits", "icon": Icons.spa},
      {"name": "Chicken,\nMeat & Fish", "icon": Icons.set_meal},
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shop By Category',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('See All', style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[200],
                    // You would replace this with actual category images
                    child: Image.asset("assets/images/delivery_guy.png")),
                SizedBox(height: 8),
                Text(
                  categories[index]["name"],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('World Food Festival,',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text('Bring the world to your Kitchen!'),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Shop Now'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ),
          Image.asset('assets/images/delivery_guy.png',
              width: 100, height: 100),
        ],
      ),
    );
  }

  Widget _buildBestDealsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Best Deal', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('See All', style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // You would replace this with actual product images
                        child: Center(child: Icon(Icons.image)),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Product Name',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('\$10 \$12',
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough)),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Add'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
