import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final itemHeight = mq.height * 0.08; // Adjust this factor as needed

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Checkout', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Saved Cards', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 16),
            _buildSavedCard(context, 'assets/images/delivery_guy.png', '6895 7852 5898 4200', itemHeight),
            SizedBox(height: 8),
            _buildSavedCard(context, 'assets/images/delivery_guy.png', '7892 5487 8600 3525', itemHeight),
            SizedBox(height: 8),
            _buildNewCardSection(context, itemHeight),
            SizedBox(height: 8),
            _buildPaymentMethod(context, 'assets/images/delivery_guy.png', 'Paypal', itemHeight),
            Spacer(),
            ElevatedButton(
              child: Text('Next'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedCard(BuildContext context, String logoAsset, String cardNumber, double height) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(logoAsset, width: 40),
          SizedBox(width: 16),
          Text(cardNumber),
          Spacer(),
          Radio(value: false, groupValue: true, onChanged: (value) {}),
        ],
      ),
    );
  }

  Widget _buildNewCardSection(BuildContext context, double height) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        title: Text('Credit/Debit Card'),
        leading: Image.asset('assets/images/delivery_guy.png', width: 40),
        children: [
          _buildTextField('Card Number', '2358 6589 8748 3598'),
          _buildTextField('Card Holder Name', 'Smith Watson'),
          Row(
            children: [
              Expanded(child: _buildTextField('Expiry Date', '09/22')),
              SizedBox(width: 8),
              Expanded(child: _buildTextField('CVV', '149')),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        controller: TextEditingController(text: initialValue),
      ),
    );
  }

  Widget _buildPaymentMethod(BuildContext context, String logoAsset, String methodName, double height) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(logoAsset, width: 40),
          SizedBox(width: 16),
          Text(methodName),
          Spacer(),
          Radio(value: false, groupValue: true, onChanged: (value) {}),
        ],
      ),
    );
  }
}
