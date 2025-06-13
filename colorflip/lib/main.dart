import 'package:flutter/material.dart';

void main() {
  runApp(const ColorFlipApp());
}

// PUBLIC_INTERFACE
class ColorFlipApp extends StatelessWidget {
  /// Root widget for the ColorFlip application.
  const ColorFlipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ColorFlip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: Color(0xFF4CAF50),
          secondary: Color(0xFFFFC107),
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        useMaterial3: true,
      ),
      home: const ColorFlipHomePage(),
    );
  }
}

// PUBLIC_INTERFACE
class ColorFlipHomePage extends StatefulWidget {
  /// The main page with a button to flip background and color display area.
  const ColorFlipHomePage({super.key});

  @override
  State<ColorFlipHomePage> createState() => _ColorFlipHomePageState();
}

class _ColorFlipHomePageState extends State<ColorFlipHomePage> {
  // The color palette, in the flipping order.
  static const List<_ColorFlip> _colorFlips = [
    _ColorFlip(color: Color(0xFF4CAF50), name: 'Primary', code: '#4CAF50'),
    _ColorFlip(color: Color(0xFFFFC107), name: 'Secondary', code: '#FFC107'),
    _ColorFlip(color: Color(0xFF2196F3), name: 'Accent', code: '#2196F3'),
  ];
  int _colorIndex = 0;

  // PUBLIC_INTERFACE
  void _flipColor() {
    /// Flips the background color to the next color in the list.
    setState(() {
      _colorIndex = (_colorIndex + 1) % _colorFlips.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _ColorFlip current = _colorFlips[_colorIndex];

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        color: current.color,
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Flip Button
                  ElevatedButton(
                    onPressed: _flipColor,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: current.color,
                      shadowColor: current.color.withOpacity(0.08),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 18,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    child: const Text("Flip Color"),
                  ),
                  const SizedBox(height: 36),
                  // Color Display Area
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.93),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.05),
                          blurRadius: 16,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          current.name,
                          style: TextStyle(
                            color: current.color,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          current.code,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Internal class for color, name, and code grouping
class _ColorFlip {
  final Color color;
  final String name;
  final String code;
  const _ColorFlip({
    required this.color,
    required this.name,
    required this.code,
  });
}
