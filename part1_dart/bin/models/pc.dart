import './hardware.dart';

class Pc extends Hardware {
  final String _sistemaOperacional;
  final tipoDeUso _tipoDeUso;

  Pc({
    required super.processador,
    required super.qtdMemoriaRam,
    required super.placaDeVideo,
    required super.armazenamento,
    required super.tipoArmazenamento,
    required super.benchmark,
    required super.status,
    required super.valorManutencao,
    required DateTime dataFabricacao,
    required double valor,
    required String sistemaOperacional,
    required tipoDeUso tipoDeUso,
  }) : _sistemaOperacional = sistemaOperacional,
       _tipoDeUso = tipoDeUso;

  @override
  String fichaTecnica() {
    return "Processador: ${getProcessador()} | Memoria Ram: ${getqtdMemoriaRam}gb | Placa de Video: $getPlacaDeVideo | Armazenamento: $getArmazenamento | Tipo Armazenamento: ${getTipoArmazenamento.name} | Benchmark: ${getBenchmark} | Status: ${getStatus} | Valor da Manutenção: ${getValorManutencao} | Sistema Operacional: $_sistemaOperacional | Tipo de Uso: $_tipoDeUso.name";
  }
}

enum tipoDeUso { GAMER, ESCRITORIO, SERVIDOR, DOMICILIAR }