import 'package:flutter/material.dart'; // Import the Flutter material design package.

void main() {
  runApp(const MyApp()); // Run the MyApp widget as the root of the application.
}

// Stateless widget representing the root of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // The build method defines the app's UI structure.
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner.
      title: "My First App", // Title of the app, shown in the app switcher.
      home: const HomePage(), // Set HomePage as the default screen of the app.
      theme: ThemeData(
        brightness: Brightness.light, // Light theme for the app.
        primarySwatch: Colors.blue, // Primary color for the app.
      ),
    );
  }
}

// Stateful widget for the home page, where dynamic content changes.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// State class to manage dynamic content on the HomePage.
class _HomePageState extends State<HomePage> {
  // Private variable to manage the displayed text.
  String _myText = "Hello World!";

  // Method to toggle the displayed text.
  void _changeText() {
    setState(() {
      // Toggle between two messages based on the current state.
      _myText = _myText.startsWith("H")
          ? "Welcome to My First App" // Display this text if it starts with 'H'.
          : "Hello World!"; // Revert back to the original text.
    });
  }

  // Method to build the body content with the dynamic text and button.
  Widget _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.all(20.0), // Add padding around the body content.
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically.
          crossAxisAlignment: CrossAxisAlignment.center, // Center the column horizontally.
          children: <Widget>[
            Text(
              _myText,
              style: const TextStyle(
                fontSize: 24.0, // Increase font size for better readability.
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2, // Add letter spacing for better text aesthetics.
                color: Colors.black, // Set text color for visual appeal.
              ),
            ),
            const SizedBox(height: 20.0), // Increase space between text and elevated button.
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Button background color.
                foregroundColor: Colors.white, // Button text color.
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Larger padding for a better touch area.
                elevation: 6.0, // Adding a shadow effect.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0), // Rounded button corners.
                ),
              ),
              onPressed: _changeText, // Call _changeText on button press.
              child: const Text(
                "Change Text", // Button label text.
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500, // Make button text slightly bolder.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build the main UI structure with AppBar, body, and floating action button.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"), // AppBar title.
        backgroundColor: Colors.indigoAccent[100], // AppBar background color.
        elevation: 5.0, // Slight elevation to make AppBar stand out.
      ),
      body: _bodyWidget(), // Call the method to build the body of the page.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent, // FAB background color.
        foregroundColor: Colors.white, // FAB icon color.
        onPressed: _changeText, // Change text when FAB is pressed.
        child: const Icon(
          Icons.refresh, // Refresh icon.
          size: 30.0, // Slightly larger icon.
        ),
      ),
    );
  }
}
