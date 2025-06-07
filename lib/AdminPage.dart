import 'package:eco_guardian/BinDetailsPage.dart';
import 'package:eco_guardian/LoginRegistrationApp.dart';
import 'package:flutter/material.dart';
import 'package:eco_guardian/AccountDetailsPage.dart';
import 'package:eco_guardian/AvailableBinsPage.dart';
import 'package:eco_guardian/DriverDetailsPage.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              'admin@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Handle logout button press
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Admin',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'admin@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'List View',
                  style: TextStyle(
                    fontSize: 16,
                    color: _isGridView ? Colors.grey : Colors.black,
                  ),
                ),
                Switch(
                  value: _isGridView,
                  onChanged: (value) {
                    setState(() {
                      _isGridView = value;
                    });
                  },
                ),
                Text(
                  'Grid View',
                  style: TextStyle(
                    fontSize: 16,
                    color: _isGridView ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _isGridView ? _buildGridView() : _buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildCategoryButton(
          icon: Icons.delete,
          label: 'AVAILABLE BINS',
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AvailableBinsPage()),
            );
          },
        ),
        _buildCategoryButton(
          icon: Icons.person,
          label: 'DRIVER DETAILS',
          color: Colors.orange,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DriverDetailsPage()),
            );
          },
        ),
        _buildCategoryButton(
          icon: Icons.map,
          label: 'BINS LOCATION',
          color: Colors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MapPage()),
            );
          },
        ),
        _buildCategoryButton(
          icon: Icons.account_circle,
          label: 'ACCOUNT DETAILS',
          color: Colors.purple,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountDetailsPage()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildListView() {
    return ListView(
      children: [
        _buildCategoryButton(
          icon: Icons.delete,
          label: 'AVAILABLE BINS',
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AvailableBinsPage()),
            );
          },
        ),
        _buildCategoryButton(
          icon: Icons.person,
          label: 'DRIVER DETAILS',
          color: Colors.orange,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DriverDetailsPage()),
            );
          },
        ),
        _buildCategoryButton(
          icon: Icons.map,
          label: 'BINS LOCATION',
          color: Colors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MapPage()),
            );
          },
        ),
        _buildCategoryButton(
          icon: Icons.account_circle,
          label: 'ACCOUNT DETAILS',
          color: Colors.purple,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountDetailsPage()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCategoryButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      color: color,
    );
  }
}
