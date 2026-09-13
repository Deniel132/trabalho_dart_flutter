import './hardware.dart';
import './games.dart';

class Pc extends Hardware {
  final DateTime _dataFabricacao;
  final double _valor;
  final double _benchmark;
  final List<Games> _jogosinstalados = [];
  
  Pc({
    required super.processador,
    required super.qtdMemoriaRam,
    required super.placaDeVideo,
    required super.armazenamento,
    required super.tipoArmazenamento,
    required DateTime dataFabricacao,
    required double valor,
    required double benchmark,
  }) : _dataFabricacao = dataFabricacao,
       _valor = valor,
       _benchmark = benchmark;

  @override
  String fichaTecnica() {
    return "Processador: ${getProcessador()} | Memoria Ram: ${getqtdMemoriaRam}gb | Placa de Video: $getPlacaDeVideo | Armazenamento: $getArmazenamento | Tipo Armazenamento: ${getTipoArmazenamento.name}| BenchMark: $_benchmark | Data Fabricacao: $_dataFabricacao | Valor: $_valor";
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
    if (games.getBenchMark() > _benchmark) {
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
