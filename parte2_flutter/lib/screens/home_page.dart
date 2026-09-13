import 'package:flutter/material.dart';

import '../widget/hardwarecard.dart';
import '../models/hardware.dart';
import '../models/Manutencao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final int _currentIndex = 0;
  Manutencao manutencao = Manutencao();

  @override
  void initState() {
    super.initState();

    Hardware h1 = Hardware(
      processador: 'Intel Core i7',
      qtdMemoriaRam: 32,
      placaDeVideo: 'RTX 3060',
      armazenamento: '1TB',
      tipoArmazenamento: tipoArmazenamento.SSD,
      benchmark: 500,
      status: status.EM_REPARO,
      valorManutencao: 250.0,
    );

    Hardware h2 = Hardware(
      processador: 'Intel Core i5',
      qtdMemoriaRam: 16,
      placaDeVideo: 'GTX 1660',
      armazenamento: '500GB',
      tipoArmazenamento: tipoArmazenamento.SSD,
      benchmark: 350,
      status: status.AGUARDANDO_PECAS,
      valorManutencao: 180.0,
    );

    Hardware h3 = Hardware(
      processador: 'AMD Ryzen 5 5600',
      qtdMemoriaRam: 16,
      placaDeVideo: 'RTX 2060',
      armazenamento: '1TB',
      tipoArmazenamento: tipoArmazenamento.SSD,
      benchmark: 420,
      status: status.CONCLUIDO,
      valorManutencao: 150.0,
    );

    Hardware h4 = Hardware(
      processador: 'Intel Core i3',
      qtdMemoriaRam: 8,
      placaDeVideo: 'GTX 1050',
      armazenamento: '500GB',
      tipoArmazenamento: tipoArmazenamento.HD,
      benchmark: 220,
      status: status.EM_REPARO,
      valorManutencao: 200.0,
    );

    Hardware h5 = Hardware(
      processador: 'AMD Ryzen 7 5800X',
      qtdMemoriaRam: 32,
      placaDeVideo: 'RTX 3070',
      armazenamento: '2TB',
      tipoArmazenamento: tipoArmazenamento.SSD,
      benchmark: 650,
      status: status.AGUARDANDO_PECAS,
      valorManutencao: 300.0,
    );

    Hardware h6 = Hardware(
      processador: 'Intel Core i5',
      qtdMemoriaRam: 8,
      placaDeVideo: 'GTX 1650',
      armazenamento: '1TB',
      tipoArmazenamento: tipoArmazenamento.HD,
      benchmark: 280,
      status: status.CONCLUIDO,
      valorManutencao: 120.0,
    );

    manutencao.enviarParaManutencao(h1);
    manutencao.enviarParaManutencao(h2);
    manutencao.enviarParaManutencao(h3);
    manutencao.enviarParaManutencao(h4);
    manutencao.enviarParaManutencao(h5);
    manutencao.enviarParaManutencao(h6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Image.asset('logo.png', width: 40, height: 40),
            const SizedBox(width: 8),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'Tech',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Fix',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 11, 19, 37),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SizedBox(
              width: constraints.maxWidth > 1200 ? 1200 : constraints.maxWidth,
              height: constraints.maxHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),

                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 2,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Valor Total',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF5A6E85),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF10B981),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.attach_money,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'R\$ ${manutencao.getValorTotal().toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0B1325),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${manutencao.getByStatus([status.AGUARDANDO_PECAS, status.EM_REPARO]).length} manutenções ativas',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF5A6E85),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 8),

                          Expanded(
                            child: Card(
                              elevation: 2,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Em Manutenção',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF5A6E85),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF2563EB),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.desktop_windows_outlined,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                '${manutencao.getTotalHardware} ',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF0B1325),
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'itens',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF5A6E85),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Na oficina hoje',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF2563EB),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      'Hardwares em manutenção',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD1D9E2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 16),
                          itemCount: manutencao.getTotalHardware,
                          itemBuilder: (context, index) {
                            final item = manutencao.getByIndex(index);

                            return HardwareCard(hardware: item);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {},
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adicionar'),
        ],
      ),
    );
  }
}
