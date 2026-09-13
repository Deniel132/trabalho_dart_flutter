import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  final int _currentIndex = 0;
  var totalCalculado = 120;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'logo.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 8),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
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
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 11, 19, 37),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Row(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius: BorderRadius.circular(10),
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
                            'R\$ ${totalCalculado.toStringAsFixed(2).replaceAll('.', ',')}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0B1325),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '2 manutenções ativas',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius: BorderRadius.circular(10),
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
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '2 ',
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
            const SizedBox(height: 30),
            const Text(
              'Hardwares em manutenção',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 16),
                itemCount: 1,
                itemBuilder: (context, index) {
                  final item = "oi";
                  final isPeca = item == 'Aguardando Peça';

                  return null;
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {

        },
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar',
          ),
        ],
      ),
    );
  }
}

