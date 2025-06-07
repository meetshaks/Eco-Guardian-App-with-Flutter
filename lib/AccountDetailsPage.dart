import 'package:flutter/material.dart';

//acount details page
class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options button press
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/profile_picture.png'),
              ),
              const SizedBox(height: 20),
              Text(
                'Admin',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'admin@gmail.com',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Mobile: 0171-808080',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the EditProfilePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
                child: Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileDetailCard(
                title: 'Name',
                detail: 'Admin',
                onUpdatePressed: (value) {
                  // Handle update name
                  print('Updated Name: $value');
                },
              ),
              const SizedBox(height: 20),
              ProfileDetailCard(
                title: 'Password',
                detail: '********',
                onUpdatePressed: (value) {
                  // Handle update password
                  print('Updated Password: $value');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetailCard extends StatefulWidget {
  final String title;
  final String detail;
  final Function(String)? onUpdatePressed;

  const ProfileDetailCard({
    required this.title,
    required this.detail,
    this.onUpdatePressed,
    Key? key,
  }) : super(key: key);

  @override
  _ProfileDetailCardState createState() => _ProfileDetailCardState();
}

class _ProfileDetailCardState extends State<ProfileDetailCard> {
  late TextEditingController _controller;
  late TextEditingController _confirmController;
  bool _isPassword = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.detail);
    _confirmController = TextEditingController();
    _isPassword = widget.title.toLowerCase() == 'password';
  }

  @override
  void dispose() {
    _controller.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            if (_isPassword)
              Column(
                children: [
                  TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _confirmController,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                    obscureText: true,
                  ),
                ],
              )
            else
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'New ${widget.title}',
                ),
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_isPassword) {
                  if (_controller.text == _confirmController.text) {
                    if (widget.onUpdatePressed != null) {
                      widget.onUpdatePressed!(_controller.text);
                    }
                  } else {
                    // Show error message for password mismatch
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Passwords do not match.'),
                      duration: Duration(seconds: 2),
                    ));
                  }
                } else {
                  if (widget.onUpdatePressed != null) {
                    widget.onUpdatePressed!(_controller.text);
                  }
                }
              },
              child: Text('Update ${widget.title}'),
            ),
          ],
        ),
      ),
    );
  }
}
