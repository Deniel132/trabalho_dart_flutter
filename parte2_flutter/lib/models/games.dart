import './hardware.dart';

class Games{
  final double _benchmark_min;
  final String _nome;
  final double _preco;
  final List<Hardware> nRequisitosMinimos = [];

  Games({
    required double benchmark_min,
    required String nome,
    required double preco
  }): _benchmark_min = benchmark_min, _nome = nome, _preco = preco;

  double getBenchMark(){
    return _benchmark_min;
  }

  String getNome(){
    return _nome;
  }
  double getPreco(){
    return _preco;
  }



}