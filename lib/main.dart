import 'package:flutter/material.dart';

const String placeName = 'Taj Mahal';
const String placeDescription =
    'The Taj Mahal is an ivory-white marble mausoleum on the south bank of '
    'the Yamuna River in Agra, India. Built by Mughal emperor Shah Jahan in '
    'memory of his wife Mumtaz Mahal, it is a UNESCO World Heritage Site and '
    'one of the New Seven Wonders of the World.';
const double rating = 4.8;
const int starCount = 5;
const String imagePath = 'assets/images/taj_mahal.jpg';

void main() {
  runApp(const HeritagePlaceApp());
}

class HeritagePlaceApp extends StatelessWidget {
  const HeritagePlaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '$placeName Information',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0E7490),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7FAFA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0E7490),
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
        useMaterial3: true,
      ),
      home: const HeritagePlacePage(),
    );
  }
}

class HeritagePlacePage extends StatelessWidget {
  const HeritagePlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text(placeName)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              label: 'Illustration of the Taj Mahal',
              image: true,
              child: Image.asset(
                imagePath,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    placeName,
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF164E63),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    placeDescription,
                    style: textTheme.bodyLarge?.copyWith(
                      height: 1.55,
                      color: const Color(0xFF334155),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Semantics(
                    label: 'Rated $rating out of 5 stars',
                    child: Row(
                      children: [
                        for (int index = 0; index < starCount; index++)
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 24,
                          ),
                        const SizedBox(width: 8),
                        Text(
                          '$rating / 5',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF164E63),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  Text(
                    'Travel with care',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF164E63),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Respect the monument, support local communities, and '
                    'help preserve this shared heritage for future visitors.',
                    style: textTheme.bodyMedium?.copyWith(
                      height: 1.45,
                      color: const Color(0xFF475569),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
