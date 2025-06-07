import 'package:flutter/material.dart';

//driver detailspage

class DriverDetailsPage extends StatefulWidget {
  const DriverDetailsPage({Key? key}) : super(key: key);

  @override
  _DriverDetailsPageState createState() => _DriverDetailsPageState();
}

class _DriverDetailsPageState extends State<DriverDetailsPage> {
  String _selectedDriverStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available drivers'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // Centering the cards
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDriverCard(
                driverName: 'Rahim',
                driverNumber: '9865473952',
                driverStatus: 'Allotted',
              ),
              const SizedBox(height: 20),
              _buildDriverCard(
                driverName: 'David',
                driverNumber: '8642359712',
                driverStatus: 'Vacant',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDriverCard({
    required String driverName,
    required String driverNumber,
    required String driverStatus,
  }) {
    return Card(
      elevation: 4,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 48,
                color: Colors.blue,
              ),
              const SizedBox(height: 10),
              Text(
                'Driver: $driverName',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Driver number: $driverNumber',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Driver status: ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    driverStatus,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: driverStatus == 'Allotted'
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10), // Adjust the height here
              ElevatedButton(
                onPressed: () {
                  _showDriverStatusOptions(driverStatus);
                },
                child: const Text('Update Driver Status'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDriverStatusOptions(String currentStatus) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: Text('Allotted'),
                    value: 'Allotted',
                    groupValue: _selectedDriverStatus,
                    onChanged: (value) {
                      setState(() {
                        _selectedDriverStatus = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Vacant'),
                    value: 'Vacant',
                    groupValue: _selectedDriverStatus,
                    onChanged: (value) {
                      setState(() {
                        _selectedDriverStatus = value!;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle updating driver status here
                      Navigator.pop(context);
                    },
                    child: Text('Update'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
