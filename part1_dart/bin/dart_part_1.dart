import './models/hardware.dart';
import './models/pc.dart';
import 'models/Manutencao.dart';

void main() {
  print("===== [1] ENTIDADE PRINCIPAL =====\n");
  Hardware h1 = Hardware(
    processador: 'Intel Core i7',
    qtdMemoriaRam: 32,
    placaDeVideo: 'RTX 3060',
    armazenamento: '1TB',
    tipoArmazenamento: tipoArmazenamento.SSD,
    benchmark: 300,
    status: status.CONCLUIDO,
    valorManutencao: 250.0,
  );

  String infoh1 = h1.fichaTecnica();
  print("$infoh1\n");

  print("\n===== [2] HERANÇA =====\n");

  Pc pc1 = Pc(
    processador: 'Intel Core i7',
    qtdMemoriaRam: 16,
    placaDeVideo: 'RTX 3060',
    armazenamento: '1TB',
    tipoArmazenamento: tipoArmazenamento.SSD,
    benchmark: 450,
    status: status.EM_REPARO,
    valorManutencao: 250.0,
    dataFabricacao: DateTime(2023, 5, 10),
    valor: 4500.0,
    sistemaOperacional: 'Windows 11 pro',
    tipoDeUso: tipoDeUso.GAMER,
  );
  print(infoh1);
  print(pc1.fichaTecnica());

  print("\n===== [3] COMPOSIÇÃO =====\n");
  Manutencao manutencao = Manutencao();
  manutencao.enviarParaManutencao(h1);
  print("Total de Hardware no estoque: ${manutencao.getTotalHardware}");
  Hardware h2 = Hardware(
    processador: "i5-10400f",
    qtdMemoriaRam: 16,
    placaDeVideo: "RTX 5070Ti",
    armazenamento: "2tb",
    tipoArmazenamento: tipoArmazenamento.SSD,
    benchmark: 200.50,
    status: status.AGUARDANDO_PECAS,
    valorManutencao: 500.00,
  );
  manutencao.enviarParaManutencao(h2);

  print("\n===== [4] ENCAPSULAMENTO =====");

  print("Total antes: ${manutencao.getTotalHardware}");

  Hardware h3 = Hardware(
    processador: 'Intel Core i5',
    qtdMemoriaRam: 16,
    placaDeVideo: 'GTX 1660',
    armazenamento: '500GB',
    tipoArmazenamento: tipoArmazenamento.SSD,
    benchmark: 200,
    status: status.EM_REPARO,
    valorManutencao: 650.0,
  );

  manutencao.enviarParaManutencao(h3);

  print("Total depois: ${manutencao.getTotalHardware}");
}
