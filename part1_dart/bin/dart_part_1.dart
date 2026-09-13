import './models/hardware.dart';
import './models/pc.dart';
import './models/games.dart';
import 'models/Manutencao.dart';

void main() {
  Pc pc2 = Pc(
    processador: 'Intel Core i5',
    qtdMemoriaRam: 16,
    placaDeVideo: 'GTX 1660',
    armazenamento: '500GB',
    tipoArmazenamento: tipoArmazenamento.SSD,
    benchmark: 200,
    status: status.CONCLUIDO,
    valorManutencao: 150.0,
    dataFabricacao: DateTime(2024, 5, 10),
    valor: 3500.0,
  );

  Pc pc3 = Pc(
    processador: 'Ryzen 5 5600',
    qtdMemoriaRam: 16,
    placaDeVideo: 'RTX 3060',
    armazenamento: '1TB',
    tipoArmazenamento: tipoArmazenamento.SSD,
    benchmark: 300,
    status: status.EM_REPARO,
    valorManutencao: 200.0,
    dataFabricacao: DateTime(2023, 8, 20),
    valor: 4500.0,
  );

  Games jogo1 = Games(benchmark_min: 199.00, nome: "Minecraft", preco: 100.10);

  Games jogo2 = Games(benchmark_min: 300.00, nome: "Fornai", preco: 100.10);

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
    placaDeVideo: 'GTX 1660',
    armazenamento: '500GB',
    tipoArmazenamento: tipoArmazenamento.SSD,
    benchmark: 500,
    status: status.CONCLUIDO,
    valorManutencao: 150.0,
    dataFabricacao: DateTime(2025, 6, 15),
    valor: 4500.0,
  );
  pc1.intallGame(jogo2);
  pc1.intallGame(jogo1);
  double var1 = pc1.getMediaBenchmarkGames();
  print(var1);
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
  print("Jogos Instalados: ${pc1.getTotalInstalado()}");
  pc1.showGame();

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

  print("Média antes de baixar o jogo: ${pc1.getMediaBenchmarkGames()}");
  Games jogo3 = Games(benchmark_min: 55.00, nome: "Roblox", preco: 0.00);
  pc1.intallGame(jogo3);
  print("Média depois de baixar o jogo: ${pc1.getMediaBenchmarkGames()}");
}
