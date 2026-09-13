import './hardware.dart';
class Manutencao {
  final List<Hardware> _hardwares = [];

  void enviarParaManutencao(Hardware hardware){
    print("Enviado hardwares para Manutenção: ${hardware.fichaTecnica()} ");
    _hardwares.add(hardware);
  }

  int get getTotalHardware => _hardwares.length;

  void mostrarHardware(){
    for(var hardware in _hardwares){
      print(" - ${hardware.getProcessador()}" );
    }
  }

  List<Hardware> getByStatus(List<status> status){
    return _hardwares.where((hardware) => status.contains(hardware.getStatus)).toList();
  }

  Hardware getByIndex(int index){
    return _hardwares[index];
  }

  double getValorTotal(){
    double valorTotal = 0;
    for (var hardware in _hardwares) {
      valorTotal += hardware.getValorManutencao;
    }

    return valorTotal;
  }
}