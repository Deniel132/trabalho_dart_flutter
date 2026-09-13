import 'package:flutter/material.dart';

import '../models/hardware.dart';
import '../screens/detail_page.dart';

class HardwareCard extends StatefulWidget {
  final Hardware hardware;

  const HardwareCard({super.key, required this.hardware});

  @override
  State<HardwareCard> createState() => _HardwareCardState();
}

class _HardwareCardState extends State<HardwareCard> {
  bool _isHovered = false;
  bool _isPressed = false;
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 80), () {
      if (mounted) {
        setState(() {
          _visible = true;
        });
      }
    });
  }

  void _abrirDetalhes() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 450),
        reverseTransitionDuration: const Duration(milliseconds: 350),
        pageBuilder: (context, animation, secondaryAnimation) {
          return DetailPage(hardware: widget.hardware);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final slide =
              Tween<Offset>(
                begin: const Offset(0.08, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              );

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(position: slide, child: child),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hardware = widget.hardware;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _isPressed = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            _isPressed = false;
          });
        },
        onTapCancel: () {
          setState(() {
            _isPressed = false;
          });
        },
        onTap: _abrirDetalhes,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          opacity: _visible ? 1 : 0,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
            offset: _visible ? Offset.zero : const Offset(0, 0.08),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOutCubic,
              scale: _isPressed
                  ? 0.97
                  : _isHovered
                  ? 1.015
                  : 1.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutCubic,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(_isHovered ? 20 : 18),
                  border: Border.all(
                    color: _isHovered
                        ? const Color(0xFF93C5FD)
                        : const Color(0xFFE2E8F0),
                    width: _isHovered ? 1.4 : 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _isHovered
                          ? const Color(0x302563EB)
                          : const Color(0x16000000),
                      blurRadius: _isHovered ? 25 : 12,
                      spreadRadius: _isHovered ? 1 : 0,
                      offset: Offset(0, _isHovered ? 10 : 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOutCubic,
                          width: _isHovered ? 52 : 48,
                          height: _isHovered ? 52 : 48,
                          decoration: BoxDecoration(
                            color: _isHovered
                                ? const Color(0xFFDBEAFE)
                                : const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(
                              _isHovered ? 16 : 14,
                            ),
                          ),
                          child: AnimatedRotation(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOutBack,
                            turns: _isHovered ? 0.015 : 0,
                            child: Icon(
                              Icons.computer_rounded,
                              color: _isHovered
                                  ? const Color(0xFF1D4ED8)
                                  : const Color(0xFF2563EB),
                              size: _isHovered ? 29 : 27,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'COMPUTADOR',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF64748B),
                                  letterSpacing: 0.8,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                hardware.getProcessador(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF0F172A),
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOutCubic,
                          width: _isHovered ? 40 : 36,
                          height: _isHovered ? 40 : 36,
                          decoration: BoxDecoration(
                            color: _isHovered
                                ? const Color(0xFFEFF6FF)
                                : const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: _isHovered
                                  ? const Color(0xFFBFDBFE)
                                  : const Color(0xFFE2E8F0),
                            ),
                          ),
                          child: AnimatedSlide(
                            duration: const Duration(milliseconds: 220),
                            curve: Curves.easeOutCubic,
                            offset: _isHovered
                                ? const Offset(0.12, 0)
                                : Offset.zero,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                              color: _isHovered
                                  ? const Color(0xFF2563EB)
                                  : const Color(0xFF64748B),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: _InfoItem(
                            icon: Icons.memory_rounded,
                            title: 'Memória RAM',
                            value: '${hardware.getqtdMemoriaRam} GB',
                            highlighted: _isHovered,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _InfoItem(
                            icon: Icons.videogame_asset_rounded,
                            title: 'Placa de vídeo',
                            value: hardware.getPlacaDeVideo,
                            highlighted: _isHovered,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                width: _isHovered ? 38 : 34,
                                height: _isHovered ? 38 : 34,
                                decoration: BoxDecoration(
                                  color: _isHovered
                                      ? const Color(0xFFDCFCE7)
                                      : const Color(0xFFF0FDF4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.build_rounded,
                                  size: 18,
                                  color: _isHovered
                                      ? const Color(0xFF15803D)
                                      : const Color(0xFF16A34A),
                                ),
                              ),
                              const SizedBox(width: 9),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'MANUTENÇÃO',
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF94A3B8),
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'R\$ ${hardware.getValorManutencao.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF334155),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOutCubic,
                          padding: EdgeInsets.symmetric(
                            horizontal: _isHovered ? 15 : 13,
                            vertical: _isHovered ? 9 : 8,
                          ),
                          decoration: BoxDecoration(
                            color: _getStatusColor(hardware.getStatus),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: _isHovered
                                ? [
                                    BoxShadow(
                                      color: _getStatusColor(hardware.getStatus)
                                          .withValues(alpha: 0.25),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                width: _isHovered ? 8 : 7,
                                height: _isHovered ? 8 : 7,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 7),
                              Text(
                                _getStatusText(hardware.getStatus),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(status valorStatus) {
    if (valorStatus == status.EM_REPARO) {
      return const Color(0xFFF59E0B);
    }

    if (valorStatus == status.AGUARDANDO_PECAS) {
      return const Color(0xFF3B82F6);
    }

    return const Color(0xFF22C55E);
  }

  String _getStatusText(status valorStatus) {
    if (valorStatus == status.EM_REPARO) {
      return 'Em reparo';
    }

    if (valorStatus == status.AGUARDANDO_PECAS) {
      return 'Aguardando peças';
    }

    return 'Concluído';
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool highlighted;

  const _InfoItem({
    required this.icon,
    required this.title,
    required this.value,
    required this.highlighted,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: highlighted ? const Color(0xFFF1F7FF) : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: highlighted
              ? const Color(0xFFD7E9FF)
              : const Color(0xFFE2E8F0),
        ),
      ),
      child: Row(
        children: [
          AnimatedScale(
            duration: const Duration(milliseconds: 220),
            scale: highlighted ? 1.08 : 1.0,
            child: Icon(
              icon,
              size: 19,
              color: highlighted
                  ? const Color(0xFF2563EB)
                  : const Color(0xFF475569),
            ),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF94A3B8),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF334155),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
