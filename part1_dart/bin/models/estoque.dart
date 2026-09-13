import './hardware.dart';
class Estoque {
  final List<Hardware> _hardwares = [];

  void adicionarEstoque(Hardware hardware){
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