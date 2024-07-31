import 'package:flutter/material.dart';
import 'package:jobhub/views/ui/categories/exortic/exortic.dart';
import 'package:jobhub/views/ui/categories/flowers/flowers.dart';
import 'package:jobhub/views/ui/categories/fresh_fruits/fresh_froits.dart';
// import 'package:jobhub/views/ui/categories/fresh_fruits/fresh_fruits.dart';
import 'package:jobhub/views/ui/categories/herbal/herbal.dart';
import 'package:jobhub/views/ui/categories/seasonal/seasonal.dart';
import 'package:jobhub/views/ui/categories/sprouts/sprouts.dart';

class Product {
  final String name;
  final String localName;
  final String weight;
  final int price;
  final int originalPrice;

  Product(this.name, this.localName, this.weight, this.price, this.originalPrice);
}

class VegetableFruitsPage extends StatefulWidget {
  const VegetableFruitsPage({Key? key}) : super(key: key);

  @override
  _VegetableFruitsPageState createState() => _VegetableFruitsPageState();
}

class _VegetableFruitsPageState extends State<VegetableFruitsPage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {
      'icon': Icons.eco,
      'label': 'Fresh\nVegetables',
      'title': 'Fresh Vegetables',
      'page': VegetableFruitsPageContent()
    },
    {'icon': Icons.apple, 'label': 'Fresh\nFruits', 'title': 'Fresh Fruits', 'page': FreshFruitsPage()},
    {'icon': Icons.grass, 'label': 'Seasonal', 'title': 'Seasonal', 'page': SeasonalPage()},
    {'icon': Icons.public, 'label': 'Exotics', 'title': 'Exotics', 'page': ExoticsPage()},
    {'icon': Icons.spa, 'label': 'Sprouts', 'title': 'Sprouts', 'page': SproutsPage()},
    {'icon': Icons.local_florist, 'label': 'Leafies\n& Herbs', 'title': 'Leafies & Herbs', 'page': HerbalPage()},
    {'icon': Icons.local_florist, 'label': 'Flowers\n& Leaves', 'title': 'Flowers & Leaves', 'page': FlowersPage()},
  ];

  void _onCategoryTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  String _getAppBarTitle() {
    return categories[selectedIndex]['title'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(_getAppBarTitle(), style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(
        children: [
          // Left sidebar
          Container(
            width: 100,
            color: Colors.white,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onCategoryTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedIndex == index ? Colors.green[100] : Colors.transparent,
                      border: Border(
                        left: BorderSide(
                          color: selectedIndex == index ? Colors.green : Colors.transparent,
                          width: 5,
                        ),
                      ),
                    ),
                    child: _buildCategoryItem(categories[index]['icon'], categories[index]['label']),
                  ),
                );
              },
            ),
          ),
          // Vertical divider
          VerticalDivider(width: 1, color: Colors.grey[300]),
          // Main content
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: categories.map<Widget>((category) => category['page'] as Widget).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Icon(icon, size: 24, color: Colors.grey[600]),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

class VegetableFruitsPageContent extends StatelessWidget {
  const VegetableFruitsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product('Hybrid Tomato', 'Tamatar', '500 g', 8, 10),
      Product('Lady Finger', 'Bhindi', '250 g', 7, 10),
      Product('Green Chilli', 'Hari Mirch', '500 g', 5, 8),
      Product('Cluster Beans', 'Gawar Phali', '250 g', 12, 14),
      Product('Cabbage', 'Patta Gobhi', '500 g', 8, 10),
      Product('Capsicum', 'Shimla Mirch', '250 g', 7, 10),
      Product('Baby Potato', 'Chota Aloo', '500 g', 10, 14),
      Product('Green Peas', 'Matar', '250 g', 5, 7),
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(products[index]);
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 60, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(product.name,
                style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Text(product.weight, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$${product.price}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('\$${product.originalPrice}',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12,
                        )),
                  ],
                ),
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
