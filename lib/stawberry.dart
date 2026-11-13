import 'package:flutter/material.dart';

class PavlovaCard extends StatelessWidget {
  const PavlovaCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Left Column containing text, ratings, and stats
    final leftColumn = Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Strawberry Pavlova',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            'Pavlova is a meringue-based dessert named after the Russian ballerine Anna Pavlova. '
            'Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontFamily: 'Georgia'),
          ),
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.green[500]),
                  Icon(Icons.star, color: Colors.green[500]),
                  Icon(Icons.star, color: Colors.green[500]),
                  Icon(Icons.star, color: Colors.green[500]),
                  Icon(Icons.star, color: Colors.green[500]),
                ],
              ),
              const Text(
                '170 Reviews',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatColumn(Icons.kitchen, 'PREP:', '25 min'),
              _buildStatColumn(Icons.timer, 'COOK:', '1 hr'),
              _buildStatColumn(Icons.restaurant, 'FEEDS:', '4-6'),
            ],
          ),
        ],
      ),
    );

    return Container(
      margin: const EdgeInsets.all(10),
      height: 400,
      child: Card(
        elevation: 5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: leftColumn),
            Expanded(
              flex: 2,
              child: Image.network(
                'https://picsum.photos/800/600',
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(IconData icon, String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.green[500]),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
