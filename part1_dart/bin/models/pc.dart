import './hardware.dart';
import './games.dart';

class Pc extends Hardware {
  final DateTime _dataFabricacao;
  final double _valor;
  final List<Games> _jogosinstalados = [];

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
  }) : _dataFabricacao = dataFabricacao,
       _valor = valor;

  @override
  String fichaTecnica() {
    return "Processador: ${getProcessador()} | Memoria Ram: ${getqtdMemoriaRam}gb | Placa de Video: $getPlacaDeVideo | Armazenamento: $getArmazenamento | Tipo Armazenamento: ${getTipoArmazenamento.name} | Benchmark: ${getBenchmark} | Status: ${getStatus} | Valor da Manutenção: ${getValorManutencao} | Data Fabricacao: $_dataFabricacao | Valor: $_valor";
  }

  int getTotalInstalado() {
    return _jogosinstalados.length;
  }

  double getMediaBenchmarkGames() {
    if (getTotalInstalado() <= 0) {
      return 0;
    }
    double benchmarkTotal = 0;
    _jogosinstalados.forEach((game) => benchmarkTotal += game.getBenchMark());
    return benchmarkTotal / getTotalInstalado();
  }

  void intallGame(Games games) {
    if (games.getBenchMark() > getBenchmark) {
      print(
        "\nRequisitos Minimos nâo atendidos! Possíveis problemas ao executar!\n",
      );
    }
    _jogosinstalados.add(games);
  }

  void showGame() {
    for (var jogo in _jogosinstalados) {
      print(jogo.getNome());
    }
  }
}
