class Hardware {
  String _processador;
  int _qtdMemoriaRam;
  String _placaDeVideo;
  String _armazenamento;
  tipoArmazenamento _tipoArmazenamento;
  status _status;
  double _valorManutencao;
  double _benchmark;

  Hardware({
    required String processador,
    required int qtdMemoriaRam,
    required String placaDeVideo,
    required String armazenamento,
    required tipoArmazenamento tipoArmazenamento,
    required double benchmark,
    required status status,
    required double valorManutencao,
  }) : _processador = processador,
       _qtdMemoriaRam = qtdMemoriaRam,
       _placaDeVideo = placaDeVideo,
       _armazenamento = armazenamento,
       _tipoArmazenamento = tipoArmazenamento,
       _benchmark = benchmark,
       _status = status,
       _valorManutencao = valorManutencao;

  String getProcessador() {
    return _processador;
  }

  void setProcessador(String processador) {
    _processador = processador;
  }

  int get getqtdMemoriaRam => _qtdMemoriaRam;

  String get getPlacaDeVideo => _placaDeVideo;

  String get getArmazenamento => _armazenamento;

  tipoArmazenamento get getTipoArmazenamento => _tipoArmazenamento;

  double get getBenchmark => _benchmark;

  status get getStatus => _status;

  double get getValorManutencao => _valorManutencao;

  String fichaTecnica() {
    return "Processador: $_processador | Memoria Ram: ${_qtdMemoriaRam}gb | Placa de Video: $_placaDeVideo | Armazenamento: $_armazenamento | Tipo Armazenamento: ${_tipoArmazenamento.name} | Benchmark: ${_benchmark}";
  }
}

enum tipoArmazenamento { HD, SSD }

enum status { EM_REPARO, AGUARDANDO_PECAS, CONCLUIDO }
