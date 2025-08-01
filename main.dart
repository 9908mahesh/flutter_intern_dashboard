import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intern Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.teal,
      ),
      home: LoginScreen(),
    );
  }
}

// LOGIN PAGE
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.rocket_launch_rounded, size: 80, color: Colors.teal),
              SizedBox(height: 20),
              Text('Welcome back', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextField(decoration: InputDecoration(labelText: 'Email')),
              TextField(decoration: InputDecoration(labelText: 'Password'), obscureText: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                ),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// BOTTOM NAV & PAGES
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final screens = [
    DashboardPage(),
    LeaderboardPage(),
    AnnouncementsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.announcement), label: 'Announcements'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// DASHBOARD
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome, Mahesh!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Referral Code: mahesh2025'),
            SizedBox(height: 10),
            Card(
              color: Colors.teal.shade100,
              child: ListTile(
                title: Text('Total Donations Raised'),
                subtitle: Text('₹5,000'),
              ),
            ),
            SizedBox(height: 10),
            Text('Rewards & Unlockables', style: TextStyle(fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.card_giftcard, size: 40),
                Icon(Icons.stars, size: 40),
                Icon(Icons.emoji_events, size: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// LEADERBOARD
class LeaderboardPage extends StatelessWidget {
  final mockLeaders = [
    {'name': 'Ananya', 'amount': '₹7,500'},
    {'name': 'Sravya', 'amount': '₹6,200'},
    {'name': 'Mahesh', 'amount': '₹5,000'},
    {'name': 'Sejal', 'amount': '₹3,800'},
    {'name': 'Purus', 'amount': '₹2,100'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboard')),
      body: ListView.builder(
        itemCount: mockLeaders.length,
        itemBuilder: (context, index) {
          final leader = mockLeaders[index];
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(leader['name']!),
            trailing: Text(leader['amount']!),
          );
        },
      ),
    );
  }
}

// ANNOUNCEMENTS
class AnnouncementsPage extends StatelessWidget {
  final announcements = [
    '🎉 New reward tier unlocked at ₹10,000!',
    '📢 Team meeting this Friday at 5 PM.',
    '✅ Don’t forget to share your referral link!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Announcements')),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.all(12),
          child: ListTile(
            leading: Icon(Icons.announcement),
            title: Text(announcements[index]),
          ),
        ),
      ),
    );
  }
}

// PROFILE PAGE
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(radius: 40, backgroundColor: Colors.teal, child: Text('M', style: TextStyle(fontSize: 30, color: Colors.white))),
            SizedBox(height: 20),
            Text('Mahesh Vasimalla', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('maheshvasimalla333@gmail.com'),
            Text('Role: Fundraising Intern'),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Edit Profile')),
            ElevatedButton(onPressed: () {}, child: Text('Settings')),
            SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade300),
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
