import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(height: 3, width: 20, color: Color(0xFF2B6562)), // Top line
                      SizedBox(width: 2),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          color: Color(0xFF2B6562),
                          shape: BoxShape.circle,
                        ), // Dot
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Container(height: 3, width: 18, color: Color(0xFF2B6562)), // Middle line
                  SizedBox(height: 4),
                  Container(height: 3, width: 16, color: Color(0xFF2B6562)), // Bottom line
                ],
              ),
            ],
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        centerTitle: true, // Center the title
        title: Text(
          "Dashboard",
          style: TextStyle(
            color: Color(0xFF2B6562), // Custom color
            fontWeight: FontWeight.bold, // Bold text
            fontSize: 22, // Font size
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your image path
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Drawer Header"),
            ),
            ListTile(title: Text("Item 1"), onTap: () {}),
            ListTile(title: Text("Item 2"), onTap: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "Hello, Abdul Moiz",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              "Good Morning!",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Container(
              height: 120,
               padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF80C4E9), // Sky blue background
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Align(
                      alignment: Alignment.centerLeft, // Align image to the left
                      child: Image.asset(
                        'assets/yoga1.png', // Replace with your image path
                        width: 165,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Explore The Codex Shop",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2B6562), // Green text
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Find your essential and mindfulness tools curated to evaluate your practice. Discover harmony.",
                          style: TextStyle(
                            fontSize: 8,
                            color: Color(0xFF2B6562),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildSection("Categories", [
              _buildCard("Yoga Beginners", 'assets/yoga2.png', Color(0xFFFFabbb)), // Pink
              _buildCard("Meditation Mindfulness", 'assets/yoga3.png', Color(0xFFadefaa)), // Green
              _buildCard("Relax\nMusic", 'assets/yoga4.png', Color(0xFFe2bcfb)),
            ]),
            SizedBox(height: 20),
            _buildTrainerSection(), // Replace Trainers section

             SizedBox(height: 20),
            _buildEventsSection(), // Replace Trainers section






          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF2B6562), // Background color
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book, color: Colors.white),
              label: 'Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task, color: Colors.white),
              label: 'Daily Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop, color: Colors.white),
              label: 'Shops',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildCard(String title, String imagePath, Color bgColor) {
    return Expanded(
      child: Card(
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: 150, // Fixed height for the card
          width: 120, // Fixed width for the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  title,
                  style: TextStyle(

                    fontSize: 10,
                    fontWeight: FontWeight.bold, // Optional: Bold text
                    color: Color(0xFF3D3D3D),   // Text color set to #3D3D3D
                    fontFamily: 'Poppins',
                    // fontWeight: FontWeight.bold,
                  ),

                  textAlign: TextAlign.center,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  height: 100,
                  width: 80, // Fixed size for images
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: cards,
        ),
      ],
    );
  }
  Widget _buildTrainerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Trainers",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the "View All" page for events
              },
              child: Text(
                "View All",
                style: TextStyle(
                  color: Color(0xFF2B6562), // Custom color for the button
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTrainerCard("Hannah Jarkey", 'assets/trainer1.png'),
            _buildTrainerCard("Nick Fuery", 'assets/trainer1.png'),
            _buildTrainerCard("Maria Steyn", 'assets/trainer1.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildTrainerCard(String title, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4, // Add shadow to the card
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 120, // Card height
              width: 100, // Card width
              fit: BoxFit.cover, // Fill the card with the image
            ),
          ),
        ),
        SizedBox(height: 8), // Spacing between card and text
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEventsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Events",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the "View All" page for events
              },
              child: Text(
                "View All",
                style: TextStyle(
                  color: Color(0xFF2B6562), // Custom color for the button
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildEventCard(
              "Dec 12, 2023",
              'assets/yoga1.png',
              Color(0xFFffd700),
              "Yoga Class 1", // Event title
// Gold color
            ),
            _buildEventCard(
              "Dec 12, 2023",
              'assets/yoga2.png',
              Color(0xFF80C4E9),
              "Yoga Class 1", // Event title
// Sky blue color
            ),
            _buildEventCard(
              "Dec 12, 2023",
              'assets/yoga3.png',
              Color(0xFFe2bcfb),
              "Yoga Class 1", // Event title
// Purple color
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEventCard(String time, String imagePath, Color backgroundColor, String title) {
    return Column(
      children: [
        // Event card with image
        Container(
          width: 100, // Adjust the width as needed
          height: 150, // Adjust the height as needed
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              // Background image filling the card
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover, // Fill the entire container with the image
                ),
              ),
              // Overlay text (time) on the image
              Positioned(
                bottom: 10, // Position the text near the bottom of the card
                left: 0,
                right: 0,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      time,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        backgroundColor: Colors.black.withOpacity(0.5), // Background for text
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8), // Space between image and title
        // Event title (below the card)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8), // Padding around the title
          child: Text(
            title, // Event title
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              overflow: TextOverflow.ellipsis, // To handle long titles
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }






  Widget _buildSectionHeader(String title, String buttonText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
