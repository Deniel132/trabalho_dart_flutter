import './hardware.dart';
class Manutencao {
  final List<Hardware> _hardwares = [];

  void enviarParaManutencao(Hardware hardware){
    print("Enviado hardwares para Estoque: ${hardware.fichaTecnica()} ");
    _hardwares.add(hardware);
  }

  int get getTotalHardware => _hardwares.length;

  void mostrarHardware(){
    for(var hardware in _hardwares){
      print(" - ${hardware.getProcessador()}" );
    }
  }


}