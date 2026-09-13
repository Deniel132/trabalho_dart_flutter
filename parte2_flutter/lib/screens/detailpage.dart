import 'package:flutter/material.dart';

import '../models/hardware.dart';

class DetailPage extends StatelessWidget {
  final Hardware hardware;

  const DetailPage({super.key, required this.hardware});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Hardware')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Processador: ${hardware.getProcessador()}'),
            Text('RAM: ${hardware.getqtdMemoriaRam} GB'),
            Text('Placa de vídeo: ${hardware.getPlacaDeVideo}'),
            Text('Armazenamento: ${hardware.getArmazenamento}'),
            Text('Tipo: ${hardware.getTipoArmazenamento.name}'),
          ],
        ),
      ),
    );
  }
}
