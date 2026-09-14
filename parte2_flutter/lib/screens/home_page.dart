import 'package:flutter/material.dart';

import '../widget/hardwarecard.dart';
import '../models/hardware.dart';
import '../models/manutencao.dart';
import '../screens/register_page.dart';
import '../widget/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int currentIndex = 0;
  final Manutencao manutencao = Manutencao();

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

    manutencao.adicionarManutencao(h1);
    manutencao.adicionarManutencao(h2);
    manutencao.adicionarManutencao(h3);
    manutencao.adicionarManutencao(h4);
    manutencao.adicionarManutencao(h5);
    manutencao.adicionarManutencao(h6);
  }

  // ============================================================
  // EXERCÍCIO 10
  // ============================================================

  Future<void> _abrirCadastro() async {
    final Hardware? novoHardware = await Navigator.of(context).push<Hardware>(
      MaterialPageRoute(
        builder: (context) {
          return RegisterPage(manutencao: manutencao);
        },
      ),
    );

    if (!mounted) return;

    if (novoHardware != null) {
      setState(() {
        manutencao.adicionarManutencao(novoHardware);
        currentIndex = 0;
      });
    } else {
      setState(() {
        currentIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Home'),

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
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0B1325),
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      '${manutencao.getByStatus([status.AGUARDANDO_PECAS, status.EM_REPARO]).length} manutenções ativas',
                                      style: const TextStyle(
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
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF0B1325),
                                            ),
                                          ),
                                          const TextSpan(
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
                            final Hardware item = manutencao.getByIndex(index);

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
        currentIndex: currentIndex,
        onTap: (index) async {
          if (index == 0) {
            setState(() {
              currentIndex = 0;
            });
          } else if (index == 1) {
            setState(() {
              currentIndex = 1;
            });

            await _abrirCadastro();
          }
        },
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
