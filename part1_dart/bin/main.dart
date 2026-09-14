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

  Hardware h2 = Hardware(
    processador: "Intel i5",
    qtdMemoriaRam: 16,
    placaDeVideo: "RTX 3060",
    armazenamento: "1TB",
    tipoArmazenamento: tipoArmazenamento.SSD,
    benchmark: 8500,
    status: status.AGUARDANDO_PECAS,
    valorManutencao: 300,
  );

  manutencao.adicionarManutencao(h1);
  manutencao.adicionarManutencao(h2);

  print("Quantidade de hardwares: ${manutencao.getTotalHardware}");
  print("Hardwares dentro da manutenção:");
  manutencao.mostrarHardware();

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

  manutencao.adicionarManutencao(h3);

  print("Total depois: ${manutencao.getTotalHardware}");
}
