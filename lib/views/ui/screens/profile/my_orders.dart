import 'package:flutter/material.dart';
import 'package:jobhub/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class MyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.cartItems.length,
                itemBuilder: (context, index) {
                  final product = cart.cartItems[index];
                  return ListTile(
                    leading: Icon(Icons.image, size: 40, color: Colors.grey[200]),
                    title: Text(product.name),
                    subtitle: Text('${product.price}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            cart.removeItem(product);
                          },
                        ),
                        Text('1'), // Quantity can be managed here
                        IconButton(
                          icon: const Icon(Icons.add_circle),
                          onPressed: () {
                            cart.addItem(product);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text('Before you Checkout', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            // Add similar products or recommendations here
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // Handle apply coupon action
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('APPLY COUPON', style: TextStyle(color: Colors.green, fontSize: 16)),
                  Icon(Icons.arrow_forward, color: Colors.green),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildPriceDetail('Item Total', cart.totalPrice),
            _buildPriceDetail('Discount', -cart.discount),
            _buildPriceDetail('Delivery', 0.0),
            const Divider(),
            _buildPriceDetail('Grand Total', cart.totalPrice - cart.discount, isBold: true, fontSize: 22),
            const SizedBox(height: 16),
            _buildAddressSection(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle the place order action
              },
              child: const Text('Place Order', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDetail(String title, double amount, {bool isBold = false, double fontSize = 18}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text('\$$amount',
              style: TextStyle(fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.home, color: Colors.green),
            const SizedBox(width: 8),
            Text('Delivering to Home', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                // Handle change address action
              },
              child: Text('Change', style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text('6391 Elgin St. Celina, Delaware 10299', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 16),
        Text('Pay Using', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.credit_card, color: Colors.green),
            const SizedBox(width: 8),
            Text('Visa 6589', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
