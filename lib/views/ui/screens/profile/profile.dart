import 'package:flutter/material.dart';
import 'package:jobhub/views/ui/screens/profile/edit_profile.dart';
import 'package:jobhub/views/ui/screens/profile/payment_method.dart';
import 'package:jobhub/views/ui/screens/profile/privacy_policy.dart';
import 'package:jobhub/views/ui/screens/profile/terms_condition.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildProfileHeader(),
            _buildProfileOptions(context), // Pass context here
            Spacer(),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage:
                    const AssetImage('assets/images/delivery_guy.png'), // use network.image to fetch user image
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.green, // once appcolors are done will use them...
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Smith Mate',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'smithmate@example.com',
                    style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOptions(BuildContext context) {
    final options = [
      {'icon': Icons.edit, 'title': 'Edit Profile', 'page': EditProfileScreen()},
      {'icon': Icons.lock, 'title': 'Change Password', 'page': ChangePasswordPage()},
      {'icon': Icons.credit_card, 'title': 'Payment Method', 'page': CheckoutScreen()},
      {'icon': Icons.shopping_bag, 'title': 'My Orders', 'page': MyOrdersPage()},
      {'icon': Icons.privacy_tip, 'title': 'Privacy Policy', 'page': PrivacyPolicyScreen()},
      {'icon': Icons.description, 'title': 'Terms & Conditions', 'page': TermsAndConditionsScreen()},
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: options.length,
      separatorBuilder: (context, index) => Divider(height: 6),
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(options[index]['icon'] as IconData, color: Colors.grey),
          title: Text(options[index]['title'] as String),
          trailing: Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => options[index]['page'] as Widget),
            );
          },
        );
      },
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Logout', style: TextStyle(fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 15),
          minimumSize: Size(double.infinity, 50),
        ),
      ),
    );
  }
}

// // Example placeholder pages
// class EditProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Edit Profile')),
//       body: Center(child: Text('Edit Profile Page')),
//     );
//   }
// }

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Password')),
      body: Center(child: Text('Change Password Page')),
    );
  }
}

class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Orders')),
      body: Center(child: Text('My Orders Page')),
    );
  }
}
