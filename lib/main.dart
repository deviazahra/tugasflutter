import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aplikasi_pertamaku/manga_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.pink.shade400,
            centerTitle: true,
            title: const Text(
              'Portfolio',
              style: TextStyle(color: Colors.white),
            ),
          ),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text(
                    'Devi Triani Nur Azahra',
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: const Text('deviazahratriani@gmail.com',
                      style: TextStyle(color: Colors.black)),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        fit: BoxFit.cover,
                        'assets/foto1.jpg',
                        width: 90,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.cyan,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://4kwallpapers.com/images/wallpapers/vibrant-landscape-5120x2880-17436.jpg'))),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.music_note),
                  title: const Text('Music List'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MangaScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.whatsapp),
                  title: const Text('WhatsApp'),
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://wa.me/6285394190244?text=Hello');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.instagram),
                  title: const Text('Instagram'),
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://wa.me/6285394190244?text=Hello');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: const Text('Logout'),
                          content:
                              const Text('Apakah anda yakin ingin keluar?'),
                          actions: [
                            TextButton(
                                child: const Text('Batal'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            TextButton(
                                child: const Text(
                                  'Keluar',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  SystemNavigator.pop();
                                }),
                          ]),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const AnimatedLogo(), 
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Devi Triani Nur Azahra',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Informatics engineering student',
                  style: TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                "Hello There!\nI'm Devi Triani Nur azahra, i am an informatics engineering student at ITB Stikom Ambon. I am a 5th semester student.",
                                speed: const Duration(milliseconds: 60),
                                textStyle: TextStyle(fontSize: 17, color: Colors.black),
                                textAlign: TextAlign.center,
                              )
                            ],
                             totalRepeatCount: 1,
                             displayFullTextOnTap: true,
                          ),
                        
              SizedBox(height: 20),
              // Skills and Expertise
              Text(
                'Skills & Expertise',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 10,
                children: [
                  _buildSkillChip('HTML'),
                  _buildSkillChip('CSS'),
                  _buildSkillChip('PHP'),
                  _buildSkillChip('PYTHON'),
                  _buildSkillChip('UI/UX'),
                ],
              ),
                        ],
                      ),
                      
                    )
                  ],
                ),
              ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});
  
  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();

}
class _AnimatedLogoState extends State<AnimatedLogo>{
  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
     duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: isZoomed ? 50.0 : 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isZoomed = !isZoomed;
          });
        },
        child: AnimatedScale(
          scale: isZoomed ? 1.3 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              // Menambahkan border tipis agar terlihat lebih bagus
              border: Border.all(
                color: Color.fromARGB(255, 26, 151, 240),
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              child: Image.asset(
                fit: BoxFit.cover,
                'assets/foto1.jpg',
                width: 150,
                height: 150, // Menambahkan height agar gambar tetap persegi
              ),
            ),
          ),
        ),
      ),
    );
  }
}
  // Widget for Info Cards
  Widget _buildInfoCard(String title, String value) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Skill Chips
  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.purple[100],
    );
  }

