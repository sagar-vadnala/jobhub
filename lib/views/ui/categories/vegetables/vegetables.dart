import 'package:flutter/material.dart';

class VegetablesFruitsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        "name": "Hybrid Tomato\n(Tamatar)",
        "weight": "500 g",
        "price": 8,
        "oldPrice": 10,
        "icon": Icons.local_pizza,
      },
      {
        "name": "Lady Finger\n(Bhindi)",
        "weight": "250 g",
        "price": 7,
        "oldPrice": 9,
        "icon": Icons.fiber_manual_record,
      },
      {
        "name": "Green Chilli\n(Hari Mirch)",
        "weight": "500 g",
        "price": 5,
        "oldPrice": 8,
        "icon": Icons.whatshot,
      },
      {
        "name": "Cluster Beans\n(Gawar Phali)",
        "weight": "250 g",
        "price": 12,
        "oldPrice": 14,
        "icon": Icons.grass,
      },
      {
        "name": "Cabbage\n(Patta Gobhi)",
        "weight": "500 g",
        "price": 8,
        "oldPrice": 10,
        "icon": Icons.nature,
      },
      {
        "name": "Capsicum\n(Shimla Mirch)",
        "weight": "250 g",
        "price": 7,
        "oldPrice": 10,
        "icon": Icons.spa,
      },
      {
        "name": "Baby Potato\n(Chota Aloo)",
        "weight": "500 g",
        "price": 10,
        "oldPrice": 14,
        "icon": Icons.sports_basketball,
      },
      {
        "name": "Green Peas\n(Matar)",
        "weight": "250 g",
        "price": 5,
        "oldPrice": 8,
        "icon": Icons.grain,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Vegetables & Fruits'),
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: 0,
            onDestinationSelected: (int index) {},
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.eco),
                label: Text('Fresh Vegetables'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.local_pizza),
                label: Text('Fresh Fruits'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.calendar_view_day),
                label: Text('Seasonal'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.spa),
                label: Text('Exotics'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.eco),
                label: Text('Sprouts'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.eco),
                label: Text('Leafies & Herbs'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.eco),
                label: Text('Flowers & Leaves'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            flex: 3,
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {},
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                products[index]['icon'],
                                size: 50,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          products[index]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(products[index]['weight']),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$${products[index]['price']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  '\$${products[index]['oldPrice']}',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Add'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VegetablesFruitsPage(),
  ));
}
