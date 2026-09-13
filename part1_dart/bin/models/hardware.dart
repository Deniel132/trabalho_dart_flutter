class Hardware {
  String _processador;
  final int _qtdMemoriaRam;
  final String _placaDeVideo;
  final String _armazenamento;
  final tipoArmazenamento _tipoArmazenamento;

  Hardware({
    required String processador,
    required int qtdMemoriaRam,
    required String placaDeVideo,
    required String armazenamento,
    required tipoArmazenamento,
  }) : _processador = processador,
       _qtdMemoriaRam = qtdMemoriaRam,
       _placaDeVideo = placaDeVideo,
       _armazenamento = armazenamento,
       _tipoArmazenamento = tipoArmazenamento;

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

  String fichaTecnica() {
    return "Processador: $_processador | Memoria Ram: ${_qtdMemoriaRam}gb | Placa de Video: $_placaDeVideo | Armazenamento: $_armazenamento | Tipo Armazenamento: ${_tipoArmazenamento.name}";
  }
}

enum tipoArmazenamento { HD, SSD }
