// import 'package:flutter/material.dart';

// class Product {
//   final String name;
//   final String localName;
//   final String weight;
//   final int price;
//   final int originalPrice;
//   final double rating;
//   final int reviewCount;

//   Product(this.name, this.localName, this.weight, this.price, this.originalPrice, this.rating, this.reviewCount);
// }

// class AttaRiceDalPage extends StatefulWidget {
//   const AttaRiceDalPage({super.key});

//   @override
//   _AttaRiceDalPageState createState() => _AttaRiceDalPageState();
// }

// class _AttaRiceDalPageState extends State<AttaRiceDalPage> {
//   final List<Product> products = [
//     Product('Aashirvaad Shudh Atta', '', '10 kg', 12, 14, 4.0, 146),
//     Product('Fresh Ultimate Atta', '', '5 kg', 7, 10, 4.5, 100),
//     Product('Fortune Fresh Atta', '', '5 kg', 5, 8, 4.2, 120),
//     Product('Aashirwad Select Atta', '', '10 kg', 12, 14, 4.0, 146),
//     Product('Mother Chakki Atta', '', '10 kg', 8, 10, 4.3, 110),
//     Product('Dhruvam Wheat Atta', '', '5 kg', 7, 10, 4.1, 130),
//   ];

//   int selectedIndex = 0;

//   final List<Map<String, dynamic>> categories = [
//     {'icon': Icons.eco, 'label': 'Atta', 'title': 'Atta'},
//     {'icon': Icons.apple, 'label': 'Besan &\nMaida', 'title': 'Besan & Maida'},
//     {'icon': Icons.grain, 'label': 'Sooji', 'title': 'Sooji'},
//     {'icon': Icons.rice_bowl, 'label': 'Rice', 'title': 'Rice'},
//     {'icon': Icons.local_dining, 'label': 'Poha &\nDaliya', 'title': 'Poha & Daliya'},
//     {'icon': Icons.grass, 'label': 'Toor, Urad\n& Chana', 'title': 'Toor, Urad & Chana'},
//   ];

//   void _onCategoryTap(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   String _getAppBarTitle() {
//     return categories[selectedIndex]['title'];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(_getAppBarTitle(), style: const TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Row(
//         children: [
//           // Left sidebar
//           Container(
//             width: 100,
//             color: Colors.white,
//             child: ListView.builder(
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () => _onCategoryTap(index),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: selectedIndex == index ? Colors.green[100] : Colors.transparent,
//                       border: Border(
//                         left: BorderSide(
//                           color: selectedIndex == index ? Colors.green : Colors.transparent,
//                           width: 5,
//                         ),
//                       ),
//                     ),
//                     child: _buildCategoryItem(categories[index]['icon'], categories[index]['label']),
//                   ),
//                 );
//               },
//             ),
//           ),
//           // Vertical divider
//           VerticalDivider(width: 1, color: Colors.grey[300]),
//           // Main content
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 200,
//                 childAspectRatio: 0.6,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//               ),
//               padding: const EdgeInsets.all(10),
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ItemDetailsPage(product: products[index]),
//                     ),
//                   ),
//                   child: _buildProductCard(products[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCategoryItem(IconData icon, String label) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       child: Column(
//         children: [
//           Icon(icon, size: 24, color: Colors.grey[600]),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProductCard(Product product) {
//     return Card(
//       elevation: 1,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.grey[200],
//                 ),
//                 child: const Center(
//                   child: Icon(Icons.image, size: 60, color: Colors.grey),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(product.name,
//                 style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
//             const SizedBox(height: 4),
//             Text(product.weight, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('\$${product.price}', style: const TextStyle(fontWeight: FontWeight.bold)),
//                     Text('\$${product.originalPrice}',
//                         style: const TextStyle(
//                           decoration: TextDecoration.lineThrough,
//                           color: Colors.grey,
//                           fontSize: 12,
//                         )),
//                   ],
//                 ),
//                 ElevatedButton(
//                   child: const Text('Add'),
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ItemDetailsPage extends StatelessWidget {
//   final Product product;

//   const ItemDetailsPage({Key? key, required this.product}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Item Details'),
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Image.asset(
//                   'assets/images/${product.name.replaceAll(' ', '_').toLowerCase()}.jpg',
//                   height: 200,
//                   width: 200,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 product.name,
//                 style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   Icon(Icons.star, color: Colors.yellow[700]),
//                   const SizedBox(width: 4),
//                   Text('${product.rating} (${product.reviewCount} Reviews)'),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Text(
//                     '\$${product.price}',
//                     style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     '\$${product.originalPrice}',
//                     style: const TextStyle(fontSize: 16, color: Colors.grey, decoration: TextDecoration.lineThrough),
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     '10% OFF',
//                     style: const TextStyle(fontSize: 16, color: Colors.green),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci, sem feugiat ut nullam nisl orci, volutpat, felis. Nunc elit, et mattis commodo condimentum tellus et. '
//                 'Read More',
//                 style: TextStyle(color: Colors.grey[600]),
//               ),
//               const SizedBox(height: 16),
//               const Divider(),
//               const SizedBox(height: 16),
//               const Text('Reviews & Ratings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   Icon(Icons.star, color: Colors.yellow[700]),
//                   const SizedBox(width: 4),
//                   const Text('4.2', style: TextStyle(fontSize: 18)),
//                   const SizedBox(width: 4),
//                   const Text('(120 Reviews)', style: TextStyle(color: Colors.grey)),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               _buildReviewItem(),
//               const SizedBox(height: 16),
//               const Text('Similar Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   _buildSimilarProductCard('Fortune Soyabean Refined Oil', 10, 12),
//                   const SizedBox(width: 16),
//                   _buildSimilarProductCard('Fortune Rice Bran Refined Oil', 15, 18),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildReviewItem() {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CircleAvatar(
//           backgroundImage: AssetImage('assets/images/user.jpg'),
//           radius: 20,
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Johnson Smith', style: TextStyle(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 4),
//               const Text('April 10, 2023', style: TextStyle(color: Colors.grey, fontSize: 12)),
//               const SizedBox(height: 4),
//               const Text(
//                 'Recently I have purchased this perfume and it’s fragrance is very nice, I loved it.',
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   Image.asset('assets/images/product1.jpg', height: 40, width: 40),
//                   const SizedBox(width: 4),
//                   Image.asset('assets/images/product2.jpg', height: 40, width: 40),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSimilarProductCard(String name, int price, int originalPrice) {
//     return Expanded(
//       child: Card(
//         elevation: 1,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.grey[200],
//                   ),
//                   child: const Center(
//                     child: Icon(Icons.image, size: 60, color: Colors.grey),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(name,
//                   style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
//               const SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('\$$price', style: const TextStyle(fontWeight: FontWeight.bold)),
//                       Text('\$$originalPrice',
//                           style: const TextStyle(
//                             decoration: TextDecoration.lineThrough,
//                             color: Colors.grey,
//                             fontSize: 12,
//                           )),
//                     ],
//                   ),
//                   ElevatedButton(
//                     child: const Text('Add'),
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:jobhub/views/ui/details/details.dart';

class Product {
  final String name;
  final String localName;
  final String weight;
  final int price;
  final int originalPrice;
  final double rating;
  final int reviewCount;

  Product(this.name, this.localName, this.weight, this.price, this.originalPrice, this.rating, this.reviewCount);
}

class AttaRiceDalPage extends StatefulWidget {
  const AttaRiceDalPage({super.key});

  @override
  _AttaRiceDalPageState createState() => _AttaRiceDalPageState();
}

class _AttaRiceDalPageState extends State<AttaRiceDalPage> {
  final List<Product> products = [
    Product('Aashirvaad Shudh Atta', '', '10 kg', 12, 14, 4.0, 146),
    Product('Fresh Ultimate Atta', '', '5 kg', 7, 10, 4.5, 100),
    Product('Fortune Fresh Atta', '', '5 kg', 5, 8, 4.2, 120),
    Product('Aashirwad Select Atta', '', '10 kg', 12, 14, 4.0, 146),
    Product('Mother Chakki Atta', '', '10 kg', 8, 10, 4.3, 110),
    Product('Dhruvam Wheat Atta', '', '5 kg', 7, 10, 4.1, 130),
  ];

  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.eco, 'label': 'Atta', 'title': 'Atta'},
    {'icon': Icons.apple, 'label': 'Besan &\nMaida', 'title': 'Besan & Maida'},
    {'icon': Icons.grain, 'label': 'Sooji', 'title': 'Sooji'},
    {'icon': Icons.rice_bowl, 'label': 'Rice', 'title': 'Rice'},
    {'icon': Icons.local_dining, 'label': 'Poha &\nDaliya', 'title': 'Poha & Daliya'},
    {'icon': Icons.grass, 'label': 'Toor, Urad\n& Chana', 'title': 'Toor, Urad & Chana'},
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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetailsPage(product: products[index]),
                    ),
                  ),
                  child: _buildProductCard(products[index]),
                );
              },
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
                style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
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
