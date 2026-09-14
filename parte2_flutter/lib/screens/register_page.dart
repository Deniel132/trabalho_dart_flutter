import 'dart:math';

import 'package:flutter/material.dart';

import '../models/hardware.dart';
import '../models/manutencao.dart';
import '../widget/custom_app_bar.dart';
import '../widget/input_card.dart';
import '../widget/input_options.dart';

class RegisterPage extends StatefulWidget {
  final Manutencao manutencao;

  const RegisterPage({super.key, required this.manutencao});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final int _currentIndex = 1;
  final Random random = Random();
  final _formKey = GlobalKey<FormState>();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool _botaoPressionado = false;
  bool _cadastroConcluido = false;

  String _tipoSelecionado = 'Hardware';

  final TextEditingController _cpuController = TextEditingController();
  final TextEditingController _ramController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  String _gpuSelecionada = 'RTX 3060';
  String _armazenamentoSelecionado = '1TB';

  tipoArmazenamento _tipoArmazenamentoSelecionado = tipoArmazenamento.SSD;

  status _statusSelecionado = status.AGUARDANDO_PECAS;

  final List<Hardware> _hardwaresCadastrados = [];

  Hardware? _ultimoHardwareCadastrado;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.12), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _cpuController.dispose();
    _ramController.dispose();
    _valorController.dispose();

    super.dispose();
  }

  void _salvarHardware() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final novoHardware = Hardware(
      processador: _cpuController.text.trim(),
      qtdMemoriaRam: int.tryParse(_ramController.text.trim()) ?? 0,
      placaDeVideo: _gpuSelecionada,
      armazenamento: _armazenamentoSelecionado,
      tipoArmazenamento: _tipoArmazenamentoSelecionado,
      benchmark: 200 + random.nextInt(501).toDouble(),
      status: _statusSelecionado,
      valorManutencao:
          double.tryParse(_valorController.text.replaceAll(',', '.')) ?? 0.0,
    );

    setState(() {
      _ultimoHardwareCadastrado = novoHardware;
      _cadastroConcluido = true;
    });
  }

  void _cadastrarOutro() {
    _cpuController.clear();
    _ramController.clear();
    _valorController.clear();

    setState(() {
      _cadastroConcluido = false;
      _ultimoHardwareCadastrado = null;
      _gpuSelecionada = 'RTX 3060';
      _armazenamentoSelecionado = '1TB';
      _tipoArmazenamentoSelecionado = tipoArmazenamento.SSD;
      _statusSelecionado = status.AGUARDANDO_PECAS;
      _botaoPressionado = false;
    });

    _animationController.reset();
    _animationController.forward();
  }

  void _voltarParaHome() {
    Navigator.of(context).pop(_ultimoHardwareCadastrado);
  }

  void _selecionarMenu(int index) {
    if (index == 0) {
      _voltarParaHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FB),
      appBar: CustomAppBar(
        titleText: _cadastroConcluido
            ? 'Cadastro concluído'
            : 'Cadastrar hardware',
      ),
      body: _cadastroConcluido ? _buildTelaSucesso() : _buildFormulario(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _selecionarMenu,
        selectedItemColor: const Color(0xFF2563EB),
        unselectedItemColor: const Color(0xFF94A3B8),
        backgroundColor: Colors.white,
        elevation: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            label: 'Adicionar',
          ),
        ],
      ),
    );
  }

  Widget _buildFormulario() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SizedBox(
            width: constraints.maxWidth > 1100 ? 1100 : constraints.maxWidth,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBotaoVoltar(),
                        const SizedBox(height: 18),
                        const _Header(),
                        const SizedBox(height: 24),
                        const _SectionTitle(
                          title: 'Tipo de equipamento',
                          subtitle: 'Selecione o tipo de equipamento',
                        ),
                        const SizedBox(height: 12),
                        _EquipmentCard(
                          selected: _tipoSelecionado == 'Hardware',
                          onTap: () {
                            setState(() {
                              _tipoSelecionado = 'Hardware';
                            });
                          },
                        ),
                        const SizedBox(height: 28),
                        const _SectionTitle(
                          title: 'Especificações',
                          subtitle:
                              'Informe os dados técnicos '
                              'do equipamento',
                        ),
                        const SizedBox(height: 12),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final bool wide = constraints.maxWidth >= 750;

                            if (wide) {
                              return Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(child: _CpuField()),
                                      const SizedBox(width: 14),
                                      Expanded(child: _RamField()),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(child: _GpuField()),
                                      const SizedBox(width: 14),
                                      Expanded(child: _StorageField()),
                                    ],
                                  ),
                                ],
                              );
                            }

                            return Column(
                              children: [
                                _CpuField(),
                                const SizedBox(height: 14),
                                _RamField(),
                                const SizedBox(height: 14),
                                _GpuField(),
                                const SizedBox(height: 14),
                                _StorageField(),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 28),
                        const _SectionTitle(
                          title: 'Manutenção',
                          subtitle:
                              'Defina o status e o valor '
                              'estimado do serviço',
                        ),
                        const SizedBox(height: 12),
                        _StatusField(),
                        const SizedBox(height: 14),
                        _ValueField(),
                        const SizedBox(height: 26),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: const Color(0xFFDBEAFE)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2563EB),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.auto_awesome_rounded,
                                  color: Colors.white,
                                  size: 21,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Benchmark automático',
                                      style: TextStyle(
                                        color: Color(0xFF1E3A8A),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'O desempenho será '
                                      'calculado automaticamente '
                                      'ao cadastrar.',
                                      style: TextStyle(
                                        color: Color(0xFF64748B),
                                        fontSize: 11,
                                        height: 1.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildBotaoCadastrar(),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            'Após cadastrar, você poderá '
                            'cadastrar outro hardware ou '
                            'voltar para a Home.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTelaSucesso() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xFF16A34A),
                  size: 58,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Hardware cadastrado!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'O hardware '
                '"${_ultimoHardwareCadastrado?.getProcessador()}" '
                'foi cadastrado com sucesso.',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFF64748B), fontSize: 14),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x12000000),
                      blurRadius: 15,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Resumo do cadastro',
                      style: TextStyle(
                        color: Color(0xFF111827),
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 18),
                    _ResumoItem(
                      icon: Icons.memory_rounded,
                      titulo: 'Processador',
                      valor: _ultimoHardwareCadastrado?.getProcessador() ?? '',
                    ),
                    const SizedBox(height: 12),
                    _ResumoItem(
                      icon: Icons.memory_rounded,
                      titulo: 'Memória RAM',
                      valor:
                          '${_ultimoHardwareCadastrado?.getqtdMemoriaRam ?? 0} GB',
                    ),
                    const SizedBox(height: 12),
                    _ResumoItem(
                      icon: Icons.sports_esports_rounded,
                      titulo: 'Placa de vídeo',
                      valor: _ultimoHardwareCadastrado?.getPlacaDeVideo ?? '',
                    ),
                    const SizedBox(height: 12),
                    _ResumoItem(
                      icon: Icons.attach_money_rounded,
                      titulo: 'Valor da manutenção',
                      valor:
                          'R\$ ${_ultimoHardwareCadastrado?.getValorManutencao.toStringAsFixed(2) ?? '0.00'}',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: _voltarParaHome,
                  icon: const Icon(Icons.home_rounded, color: Colors.white),
                  label: const Text(
                    'Voltar para Home',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton.icon(
                  onPressed: _cadastrarOutro,
                  icon: const Icon(
                    Icons.add_circle_outline_rounded,
                    color: Color(0xFF2563EB),
                  ),
                  label: const Text(
                    'Cadastrar outro hardware',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFF2563EB),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '${_hardwaresCadastrados.length} '
                'hardware(s) aguardando confirmação.',
                style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBotaoVoltar() {
    return GestureDetector(
      onTap: _voltarParaHome,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_back_rounded, color: Color(0xFF2563EB), size: 20),
          SizedBox(width: 7),
          Text(
            'Voltar',
            style: TextStyle(
              color: Color(0xFF2563EB),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBotaoCadastrar() {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _botaoPressionado = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _botaoPressionado = false;
        });

        _salvarHardware();
      },
      onTapCancel: () {
        setState(() {
          _botaoPressionado = false;
        });
      },
      child: AnimatedScale(
        scale: _botaoPressionado ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFF2563EB),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0x402563EB),
                blurRadius: _botaoPressionado ? 4 : 12,
                offset: Offset(0, _botaoPressionado ? 2 : 6),
              ),
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline_rounded,
                size: 21,
                color: Colors.white,
              ),
              SizedBox(width: 9),
              Text(
                'Cadastrar Hardware',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _CpuField() {
    return InputCard(
      label: 'PROCESSADOR (CPU)',
      icon: Icons.memory_rounded,
      child: TextFormField(
        controller: _cpuController,
        decoration: _inputDecoration('Ex: Intel Core i7 12700K'),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Informe o processador';
          }

          return null;
        },
      ),
    );
  }

  Widget _RamField() {
    return InputCard(
      label: 'MEMÓRIA RAM (GB)',
      icon: Icons.memory_rounded,
      child: TextFormField(
        controller: _ramController,
        keyboardType: TextInputType.number,
        decoration: _inputDecoration('Ex: 16'),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Informe a quantidade de RAM';
          }

          final ram = int.tryParse(value.trim());

          if (ram == null) {
            return 'Digite um número válido';
          }

          if (ram <= 0) {
            return 'Digite um valor maior que zero';
          }

          return null;
        },
      ),
    );
  }

  Widget _GpuField() {
    return InputCard(
      label: 'PLACA DE VÍDEO (GPU)',
      icon: Icons.sports_esports_rounded,
      child: DropdownButtonFormField<String>(
        initialValue: _gpuSelecionada,
        decoration: const InputDecoration(border: InputBorder.none),
        items: const [
          DropdownMenuItem(value: 'RTX 3060', child: Text('RTX 3060')),
          DropdownMenuItem(value: 'RTX 4060', child: Text('RTX 4060')),
          DropdownMenuItem(value: 'RTX 4070', child: Text('RTX 4070')),
          DropdownMenuItem(value: 'Integrada', child: Text('Integrada')),
        ],
        onChanged: (novoValor) {
          if (novoValor != null) {
            setState(() {
              _gpuSelecionada = novoValor;
            });
          }
        },
      ),
    );
  }

  Widget _StorageField() {
    return InputCard(
      label: 'ARMAZENAMENTO',
      icon: Icons.storage_rounded,
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              initialValue: _armazenamentoSelecionado,
              decoration: const InputDecoration(border: InputBorder.none),
              items: const [
                DropdownMenuItem(value: '512GB', child: Text('512GB')),
                DropdownMenuItem(value: '1TB', child: Text('1TB')),
                DropdownMenuItem(value: '2TB', child: Text('2TB')),
              ],
              onChanged: (novoValor) {
                if (novoValor != null) {
                  setState(() {
                    _armazenamentoSelecionado = novoValor;
                  });
                }
              },
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 90,
            child: DropdownButtonFormField<tipoArmazenamento>(
              initialValue: _tipoArmazenamentoSelecionado,
              decoration: const InputDecoration(border: InputBorder.none),
              items: tipoArmazenamento.values.map((tipo) {
                return DropdownMenuItem(value: tipo, child: Text(tipo.name));
              }).toList(),
              onChanged: (novoTipo) {
                if (novoTipo != null) {
                  setState(() {
                    _tipoArmazenamentoSelecionado = novoTipo;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _StatusField() {
    return InputCard(
      label: 'STATUS DA MANUTENÇÃO',
      icon: Icons.build_circle_outlined,
      child: DropdownButtonFormField<status>(
        initialValue: _statusSelecionado,
        decoration: const InputDecoration(border: InputBorder.none),
        items: status.values.map((st) {
          return DropdownMenuItem(
            value: st,
            child: Text(st.name.replaceAll('_', ' ')),
          );
        }).toList(),
        onChanged: (novoStatus) {
          if (novoStatus != null) {
            setState(() {
              _statusSelecionado = novoStatus;
            });
          }
        },
      ),
    );
  }

  Widget _ValueField() {
    return InputCard(
      label: 'VALOR ESTIMADO DA MANUTENÇÃO (R\$)',
      icon: Icons.attach_money_rounded,
      child: TextFormField(
        controller: _valorController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: _inputDecoration('Ex: 250.00'),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Informe o valor estimado';
          }

          final valor = double.tryParse(value.replaceAll(',', '.'));

          if (valor == null) {
            return 'Digite um valor válido';
          }

          if (valor <= 0) {
            return 'Digite um valor maior que zero';
          }

          return null;
        },
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      border: InputBorder.none,
      hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0B1325), Color(0xFF172554)],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 16,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.add_to_queue_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NOVO EQUIPAMENTO',
                  style: TextStyle(
                    color: Color(0xFF93C5FD),
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Cadastrar Hardware',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Adicione um equipamento '
                  'à oficina TechFix.',
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF111827),
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          subtitle,
          style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
        ),
      ],
    );
  }
}

class _EquipmentCard extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;

  const _EquipmentCard({required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InputOptions(
      icon: Icons.desktop_windows_rounded,
      title: 'Hardware',
      subtitle: 'Computador desktop',
      isSelected: selected,
      onTap: onTap,
    );
  }
}

class _ResumoItem extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String valor;

  const _ResumoItem({
    required this.icon,
    required this.titulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF2563EB), size: 21),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: const TextStyle(color: Color(0xFF64748B), fontSize: 11),
              ),
              const SizedBox(height: 2),
              Text(
                valor,
                style: const TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
