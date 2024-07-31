// import 'package:flutter/material.dart';

// import '../categories/atta/atta.dart';

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
//                 child: Icon(
//                   Icons.image,
//                   size: 200,
//                   color: Colors.grey[200],
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
//           child: Icon(Icons.person),
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
//                   Icon(Icons.image, size: 40, color: Colors.grey[200]),
//                   const SizedBox(width: 4),
//                   Icon(Icons.image, size: 40, color: Colors.grey[200]),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSimilarProductCard(String name, int price, int originalPrice) {
//     return Flexible(
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
//               Container(
//                 height: 100, // Provide a fixed height for the container
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.grey[200],
//                 ),
//                 child: const Center(
//                   child: Icon(Icons.image, size: 60, color: Colors.grey),
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
import 'package:jobhub/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../categories/atta/atta.dart';

class ItemDetailsPage extends StatelessWidget {
  final Product product;

  const ItemDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Icon(
                  Icons.image,
                  size: 200,
                  color: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                product.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow[700]),
                  const SizedBox(width: 4),
                  Text('${product.rating} (${product.reviewCount} Reviews)'),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '\$${product.originalPrice}',
                    style: const TextStyle(fontSize: 16, color: Colors.grey, decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '10% OFF',
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci, sem feugiat ut nullam nisl orci, volutpat, felis. Nunc elit, et mattis commodo condimentum tellus et. '
                'Read More',
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              const Text('Reviews & Ratings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow[700]),
                  const SizedBox(width: 4),
                  const Text('4.2', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 4),
                  const Text('(120 Reviews)', style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 16),
              _buildReviewItem(),
              const SizedBox(height: 16),
              const Text('Similar Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildSimilarProductCard('Fortune Soyabean Refined Oil', 10, 12),
                  const SizedBox(width: 16),
                  _buildSimilarProductCard('Fortune Rice Bran Refined Oil', 15, 18),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            context.read<CartProvider>().addItem(product);
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.green,
          ),
          child: const Text('Add to Cart', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }

  Widget _buildReviewItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          child: Icon(Icons.person),
          radius: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Johnson Smith', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('April 10, 2023', style: TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 4),
              const Text(
                'Recently I have purchased this perfume and it’s fragrance is very nice, I loved it.',
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.image, size: 40, color: Colors.grey[200]),
                  const SizedBox(width: 4),
                  Icon(Icons.image, size: 40, color: Colors.grey[200]),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSimilarProductCard(String name, int price, int originalPrice) {
    return Flexible(
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100, // Provide a fixed height for the container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 60, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 8),
              Text(name,
                  style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$$price', style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('\$$originalPrice',
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
      ),
    );
  }
}
