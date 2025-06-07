import 'package:eco_guardian/AdminPage.dart';
import 'package:eco_guardian/BinDetailsPage.dart';
import 'package:flutter/material.dart';

//available bins page
class AvailableBinsPage extends StatelessWidget {
  const AvailableBinsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Bins'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminPage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Smart Bin Status',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle bin card tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BinDetailsPage()),
                );
              },
              child: _buildBinStatusCard(
                binName: 'IFMR Bin',
                fillPercentage: 80,
                latitude: 'Lat: 13.5481',
                longitude: 'Long: 80.0002',
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle bin card tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BinDetailsPage()),
                );
              },
              child: _buildBinStatusCard(
                binName: 'CREEKSIDE Bin',
                fillPercentage: 60,
                latitude: 'Lat: 13.5613',
                longitude: 'Long: 80.0217',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBinStatusCard({
    required String binName,
    required double fillPercentage,
    required String latitude,
    required String longitude,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 8,
                      value: fillPercentage / 100,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _getColorForPercentage(fillPercentage),
                      ),
                    ),
                  ),
                  Text(
                    '${fillPercentage.toInt()}%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                binName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    latitude,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    longitude,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
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

  Color _getColorForPercentage(double percentage) {
    if (percentage >= 80) {
      return Colors.red;
    } else if (percentage >= 60) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
}
