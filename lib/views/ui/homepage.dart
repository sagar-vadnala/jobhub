import 'package:flutter/material.dart';
import 'package:jobhub/views/ui/categories/atta/atta.dart';
import 'package:jobhub/views/ui/categories/vegetables/vegetables.dart';
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
    const ProfilePage(),
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
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('6391 Elgin St. Celina, Delaware 10299', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          actions: [
            IconButton(icon: const Icon(Icons.shopping_basket), onPressed: () {}),
          ],
        );
      case 1:
        return AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Favorites', style: TextStyle(fontWeight: FontWeight.bold)),
        );
      case 2:
        return AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        );
      case 3:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green,
          elevation: 0,
          centerTitle: true,
          title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        );
      default:
        return AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
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
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),
        ),
        _buildCategorySection(context),
        _buildBanner(),
        _buildBestDealsSection(),
      ],
    );
  }

  Widget _buildCategorySection(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {"name": "Vegetables\n& Fruits", "icon": Icons.apple, "page": VegetableFruitsPage()},
      {"name": "Dairy &\nBreakfast", "icon": Icons.egg, "page": DairyBreakfastPage()},
      {"name": "Cold Drinks\n& Juices", "icon": Icons.local_drink, "page": ColdDrinksJuicesPage()},
      {"name": "Instant &\nFrozen Food", "icon": Icons.fastfood, "page": InstantFrozenFoodPage()},
      {"name": "Tea &\nCoffee", "icon": Icons.coffee, "page": TeaCoffeePage()},
      {"name": "Atta, Rice\n& Dal", "icon": Icons.grain, "page": AttaRiceDalPage()},
      {"name": "Masala, Oil\n& Dry Fruits", "icon": Icons.spa, "page": MasalaOilDryFruitsPage()},
      {"name": "Chicken,\nMeat & Fish", "icon": Icons.set_meal, "page": ChickenMeatFishPage()},
    ];
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shop By Category', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('See All', style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => categories[index]["page"],
                  ),
                );
              },
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 30, backgroundColor: Colors.grey[200], child: Icon(categories[index]["icon"], size: 30)),
                  const SizedBox(height: 8),
                  Text(
                    categories[index]["name"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
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
                const Text('World Food Festival,', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const Text('Bring the world to your Kitchen!'),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('Shop Now'),
                ),
              ],
            ),
          ),
          Image.asset('assets/images/delivery_guy.png', width: 100, height: 100),
        ],
      ),
    );
  }

  Widget _buildBestDealsSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
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
                margin: const EdgeInsets.symmetric(horizontal: 8),
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
                        child: const Center(child: Icon(Icons.image)),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold)),
                    const Text('\$10 \$12', style: TextStyle(decoration: TextDecoration.lineThrough)),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Add'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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

// class VegetablesFruitsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Vegetables & Fruits'),
//       ),
//       body: Center(
//         child: Text('Vegetables & Fruits Page'),
//       ),
//     );
//   }
// }

class DairyBreakfastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dairy & Breakfast'),
      ),
      body: const Center(
        child: Text('Dairy & Breakfast Page'),
      ),
    );
  }
}

class ColdDrinksJuicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cold Drinks & Juices'),
      ),
      body: const Center(
        child: Text('Cold Drinks & Juices Page'),
      ),
    );
  }
}

class InstantFrozenFoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instant & Frozen Food'),
      ),
      body: const Center(
        child: Text('Instant & Frozen Food Page'),
      ),
    );
  }
}

class TeaCoffeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tea & Coffee'),
      ),
      body: const Center(
        child: Text('Tea & Coffee Page'),
      ),
    );
  }
}

class MasalaOilDryFruitsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masala, Oil & Dry Fruits'),
      ),
      body: const Center(
        child: Text('Masala, Oil & Dry Fruits Page'),
      ),
    );
  }
}

class ChickenMeatFishPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chicken, Meat & Fish'),
      ),
      body: const Center(
        child: Text('Chicken, Meat & Fish Page'),
      ),
    );
  }
}
