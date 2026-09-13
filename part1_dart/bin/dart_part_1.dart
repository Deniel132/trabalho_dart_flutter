import './models/hardware.dart';
import './models/pc.dart';
import './models/games.dart';
import './models/estoque.dart';

void main() {
  Hardware h1 = Hardware(
    processador: "Ryzen2",
    qtdMemoriaRam: 16,
    placaDeVideo: "RTX 509090",
    armazenamento: "1tb",
    tipoArmazenamento: tipoArmazenamento.SSD,
  );

  String infoh1 = h1.fichaTecnica();

  Pc pc1 = Pc(
    processador: "Ryzen3",
    qtdMemoriaRam: 4,
    placaDeVideo: "GTX 1080ti",
    armazenamento: "500gb",
    tipoArmazenamento: tipoArmazenamento.HD,
    dataFabricacao: DateTime.now(),
    valor: 500.00,
    benchmark: 200.00,
  );
  Pc pc2 = Pc(
    processador: h1.getProcessador(),
    qtdMemoriaRam: h1.getqtdMemoriaRam,
    placaDeVideo: h1.getPlacaDeVideo,
    armazenamento: h1.getArmazenamento,
    tipoArmazenamento: h1.getTipoArmazenamento,
    dataFabricacao: DateTime.now(),
    valor: 2000.50,
    benchmark: 300.25,
  );

  Games jogo1 = Games(benchmark_min: 199.00, nome: "Minecraft", preco: 100.10);

  Games jogo2 = Games(benchmark_min: 300.00, nome: "Fornai", preco: 100.10);
  pc1.intallGame(jogo2);
  pc1.intallGame(jogo1);
  double var1 = pc1.getMediaBenchmarkGames();
  print(var1);

  String infopc1 = pc1.fichaTecnica();

  print("===== [1] ENTIDADE PRINCIPAL =====\n");
  print("$infoh1\n");

  print("\n===== [2] HERANÇA =====\n");
  print(infoh1);
  print(infopc1);
  print(pc2);

  print("\n===== [3] COMPOSIÇÃO =====\n");
  Estoque estoque = Estoque();
  estoque.adicionarEstoque(h1);

  print("Total de Hardware no estoque: ${estoque.getTotalHardware}");

  Hardware h2 = Hardware(
    processador: "i5-10400f",
    qtdMemoriaRam: 16,
    placaDeVideo: "RTX 5070Ti",
    armazenamento: "2tb",
    tipoArmazenamento: tipoArmazenamento.SSD,
  );

  estoque.adicionarEstoque(h2);
  print("Jogos Instalados: ${pc1.getTotalInstalado()}");
  pc1.showGame();

  print("\n===== [4] ENCAPSULAMENTO =====");

  print("Total antes: ${estoque.getTotalHardware}");

  Hardware h3 = Hardware(
    processador: "Intel i5",
    qtdMemoriaRam: 8,
    placaDeVideo: "GTX 1660",
    armazenamento: "500gb",
    tipoArmazenamento: tipoArmazenamento.SSD,
  );

  estoque.adicionarEstoque(h3);

  print("Total depois: ${estoque.getTotalHardware}");

  print("Média antes de baixar o jogo: ${pc1.getMediaBenchmarkGames()}");
  Games jogo3 = Games(benchmark_min: 55.00, nome: "Roblox", preco: 0.00);
  pc1.intallGame(jogo3);
  print("Média depois de baixar o jogo: ${pc1.getMediaBenchmarkGames()}");
}
