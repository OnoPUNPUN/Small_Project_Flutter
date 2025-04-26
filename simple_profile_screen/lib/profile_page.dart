import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: Colors.black, width: 2.0)),
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('image/images.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'WASIMUL BARI TONMOY',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Passionate developer exploring Flutter and building cool apps.',
              style: GoogleFonts.roboto(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.code),
                  color: Colors.black,
                ),
                IconButton(
                  icon: Icon(Icons.facebook, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.purple),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.link, color: Colors.blueGrey),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
