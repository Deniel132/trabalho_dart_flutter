import 'dart:math';

import 'package:flutter/material.dart';
import '../models/hardware.dart';
import '../models/Manutencao.dart';
import '../widget/customAppBar.dart';
import '../widget/inputCard.dart';
import '../widget/InputOptions.dart';

class RegisterPage extends StatefulWidget {
  final Manutencao manutencao;
  const RegisterPage({
    super.key,
    required this.manutencao
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final int _currentIndex = 1;
  final Random random = Random();
  final _formKey = GlobalKey<FormState>();

  String _tipoSelecionado = 'Hardware';
  final TextEditingController _cpuController = TextEditingController();
  final TextEditingController _ramController = TextEditingController();
  final TextEditingController _armazenamentoController = TextEditingController();
  final TextEditingController _gpuController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  tipoArmazenamento _tipoArmazenamentoSelecionado = tipoArmazenamento.SSD;
  status _statusSelecionado = status.AGUARDANDO_PECAS;

  @override
  void dispose() {
    _cpuController.dispose();
    _ramController.dispose();
    _armazenamentoController.dispose();
    _gpuController.dispose();
    _valorController.dispose();
    super.dispose();
  }

  void _salvarHardware() {
    if (_formKey.currentState!.validate()) {
      final novoHardware = Hardware(
        processador: _cpuController.text.trim(),
        qtdMemoriaRam: int.tryParse(_ramController.text) ?? 0,
        placaDeVideo: _gpuController.text.trim(),
        armazenamento: _armazenamentoController.text.trim(),
        tipoArmazenamento: _tipoArmazenamentoSelecionado,
        benchmark: 1.0 + random.nextInt(1000),
        status: _statusSelecionado,
        valorManutencao: double.tryParse(_valorController.text.replaceAll(',', '.')) ?? 0.0,
      );

      widget.manutencao.enviarParaManutencao(novoHardware);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Hardware "${novoHardware.getProcessador()}" cadastrado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );

      _cpuController.clear();
      _ramController.clear();
      _armazenamentoController.clear();
      _gpuController.clear();
      _valorController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: const CustomAppBar(titleText: 'Cadastar hardware'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Novo Hardware',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B1325),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Preencha as especificações do equipamento para iniciar a ordem de manutenção na oficina.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B),
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'TIPO DE EQUIPAMENTO',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF64748B),
                            letterSpacing: 0.5,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Obrigatório',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2563EB),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: InputOptions(
                            icon: Icons.desktop_windows_outlined,
                            title: 'Hardware',
                            subtitle: 'Geral',
                            isSelected: _tipoSelecionado == 'Hardware',
                            onTap: () => setState(() => _tipoSelecionado = 'Hardware'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              InputCard(
                label: 'PROCESSADOR (CPU)',
                icon: Icons.memory,
                child: TextFormField(
                  controller: _cpuController,
                  decoration: const InputDecoration(
                    hintText: 'Ex: Intel Core i7 12700K / Ryzen 7 5700X',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe o processador';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              InputCard(
                label: 'MEMÓRIA RAM (GB)',
                icon: Icons.sim_card_outlined,
                child: TextFormField(
                  controller: _ramController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Ex: 16, 32',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe a quantidade de RAM';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Digite um número válido';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              InputCard(
                label: 'ARMAZENAMENTO',
                icon: Icons.sd_storage_outlined,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _armazenamentoController,
                        decoration: const InputDecoration(
                          hintText: 'Ex: 512GB / 1TB',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Informe o espaço de armazenamento';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: DropdownButtonFormField<tipoArmazenamento>(
                        initialValue: _tipoArmazenamentoSelecionado,
                        decoration: const InputDecoration(border: InputBorder.none),
                        items: tipoArmazenamento.values.map((tipo) {
                          return DropdownMenuItem(
                            value: tipo,
                            child: Text(tipo.name),
                          );
                        }).toList(),
                        onChanged: (novoTipo) {
                          if (novoTipo != null) {
                            setState(() => _tipoArmazenamentoSelecionado = novoTipo);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              InputCard(
                label: 'PLACA DE VÍDEO (GPU)',
                icon: Icons.sports_esports_outlined,
                child: TextFormField(
                  controller: _gpuController,
                  decoration: const InputDecoration(
                    hintText: 'Ex: RTX 3060 / Integrada',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe a placa de vídeo';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              InputCard(
                label: 'STATUS DA MANUTENÇÃO',
                icon: Icons.build_outlined,
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
                      setState(() => _statusSelecionado = novoStatus);
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              InputCard(
                label: 'VALOR ESTIMADO DA MANUTENÇÃO (R\$)',
                icon: Icons.attach_money,
                child: TextFormField(
                  controller: _valorController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    hintText: 'Ex: 250.00',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe o valor total estimado';
                    }
                    if (double.tryParse(value.replaceAll(',', '.')) == null) {
                      return 'Digite um valor monetário válido';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _salvarHardware,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Cadastrar Hardware',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pop();
          }
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