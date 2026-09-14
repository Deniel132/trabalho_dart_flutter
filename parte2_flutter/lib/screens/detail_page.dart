import 'package:flutter/material.dart';

import '../models/hardware.dart';

class DetailPage extends StatelessWidget {
  final Hardware hardware;

  const DetailPage({super.key, required this.hardware});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1325),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Detalhes do Hardware',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SizedBox(
              width: constraints.maxWidth > 1150 ? 1150 : constraints.maxWidth,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeaderCard(hardware: hardware),

                    const SizedBox(height: 28),

                    const Text(
                      'Especificações',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF111827),
                      ),
                    ),

                    const SizedBox(height: 14),

                    LayoutBuilder(
                      builder: (context, constraints) {
                        final bool wide = constraints.maxWidth >= 700;

                        if (wide) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: _SpecificationCard(
                                      icon: Icons.memory_rounded,
                                      title: 'Memória RAM',
                                      value: '${hardware.getqtdMemoriaRam} GB',
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: _SpecificationCard(
                                      icon: Icons.videogame_asset_rounded,
                                      title: 'Placa de vídeo',
                                      value: hardware.getPlacaDeVideo,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              Row(
                                children: [
                                  Expanded(
                                    child: _SpecificationCard(
                                      icon: Icons.storage_rounded,
                                      title: 'Armazenamento',
                                      value: hardware.getArmazenamento,
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: _SpecificationCard(
                                      icon: Icons.sd_storage_rounded,
                                      title: 'Tipo de armazenamento',
                                      value: hardware.getTipoArmazenamento.name,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }

                        return Column(
                          children: [
                            _SpecificationCard(
                              icon: Icons.memory_rounded,
                              title: 'Memória RAM',
                              value: '${hardware.getqtdMemoriaRam} GB',
                            ),
                            const SizedBox(height: 12),
                            _SpecificationCard(
                              icon: Icons.videogame_asset_rounded,
                              title: 'Placa de vídeo',
                              value: hardware.getPlacaDeVideo,
                            ),
                            const SizedBox(height: 12),
                            _SpecificationCard(
                              icon: Icons.storage_rounded,
                              title: 'Armazenamento',
                              value: hardware.getArmazenamento,
                            ),
                            const SizedBox(height: 12),
                            _SpecificationCard(
                              icon: Icons.sd_storage_rounded,
                              title: 'Tipo de armazenamento',
                              value: hardware.getTipoArmazenamento.name,
                            ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 14),

                    _BenchmarkCard(benchmark: hardware.getBenchmark),

                    const SizedBox(height: 28),

                    const Text(
                      'Informações da manutenção',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF111827),
                      ),
                    ),

                    const SizedBox(height: 14),

                    _MaintenanceCard(hardware: hardware),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final Hardware hardware;

  const _HeaderCard({required this.hardware});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0B1325), Color(0xFF172554)],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool compact = constraints.maxWidth < 550;

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ComputerIcon(),
                const SizedBox(height: 18),
                _HeaderInformation(hardware: hardware),
              ],
            );
          }

          return Row(
            children: [
              _ComputerIcon(),
              const SizedBox(width: 18),
              Expanded(child: _HeaderInformation(hardware: hardware)),
              const SizedBox(width: 20),
              _StatusBadge(statusValue: hardware.getStatus),
            ],
          );
        },
      ),
    );
  }
}

class _ComputerIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: const Color(0xFF2563EB),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x402563EB),
            blurRadius: 18,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: const Icon(Icons.computer_rounded, color: Colors.white, size: 38),
    );
  }
}

class _HeaderInformation extends StatelessWidget {
  final Hardware hardware;

  const _HeaderInformation({required this.hardware});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'COMPUTADOR',
          style: TextStyle(
            color: Color(0xFF93C5FD),
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          hardware.getProcessador(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Equipamento em atendimento',
          style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
        ),
      ],
    );
  }
}

class _SpecificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _SpecificationCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(icon, color: const Color(0xFF2563EB), size: 20),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF111827),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _BenchmarkCard extends StatelessWidget {
  final double benchmark;

  const _BenchmarkCard({required this.benchmark});

  @override
  Widget build(BuildContext context) {
    final double progress = (benchmark / 700).clamp(0.0, 1.0);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.speed_rounded,
                  color: Color(0xFF2563EB),
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Benchmark de desempenho',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                benchmark.toStringAsFixed(0),
                style: const TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 9,
              backgroundColor: const Color(0xFFE5E7EB),
              valueColor: const AlwaysStoppedAnimation(Color(0xFF2563EB)),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Índice de desempenho do hardware',
            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class _MaintenanceCard extends StatelessWidget {
  final Hardware hardware;

  const _MaintenanceCard({required this.hardware});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.build_rounded,
                  color: Color(0xFF16A34A),
                  size: 24,
                ),
              ),
              const SizedBox(width: 13),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valor da manutenção',
                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Serviço técnico',
                      style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
                    ),
                  ],
                ),
              ),
              Text(
                'R\$ ${hardware.getValorManutencao.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Color(0xFF16A34A),
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Divider(height: 1, color: Color(0xFFE5E7EB)),
          ),
          Row(
            children: [
              const Icon(
                Icons.info_outline_rounded,
                color: Color(0xFF64748B),
                size: 21,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Status atual',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _StatusBadge(statusValue: hardware.getStatus),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final status statusValue;

  const _StatusBadge({required this.statusValue});

  @override
  Widget build(BuildContext context) {
    Color background;
    String text;

    if (statusValue == status.EM_REPARO) {
      background = const Color(0xFFF59E0B);
      text = 'Em reparo';
    } else if (statusValue == status.AGUARDANDO_PECAS) {
      background = const Color(0xFF3B82F6);
      text = 'Aguardando peças';
    } else {
      background = const Color(0xFF22C55E);
      text = 'Concluído';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 7),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
