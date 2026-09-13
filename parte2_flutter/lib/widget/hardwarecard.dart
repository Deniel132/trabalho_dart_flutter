import 'package:flutter/material.dart';
import '../models/hardware.dart';
import '../screens/detail_page.dart';

class HardwareCard extends StatelessWidget {
  final Hardware hardware;

  const HardwareCard({
    super.key,
    required this.hardware,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              hardware: hardware,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hardware.getProcessador(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              'Memória RAM: ${hardware.getqtdMemoriaRam} GB',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            Text(
              'Placa de vídeo: ${hardware.getPlacaDeVideo}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}