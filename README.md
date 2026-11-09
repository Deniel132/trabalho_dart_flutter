# Trabalho do 1º Bimestre — Programação para Dispositivos Móveis

# Integrantes
- Daneiel Bocca Seron
- Tiago Toshimitsu




# Tema do projeto

~~~~
    O projeto tem como tema a manutenção de hardware, sendo composto pelas entidades
Hardware, PC e Manutencao, onde PC é uma especialização de Hardware por meio
de herança, enquanto Manutencao agrupa objetos Hardware para representar os
equipamentos que estão em manutenção.
~~~~

---

## Tabela de rastreio

| # | Exercício | Arquivo e linha                                           | O que aparece na tela |
|---|---|-----------------------------------------------------------|---|
| 1 | Entidade principal | `parte1-dart/bin/models/hardware.dart:1`                  | Bloco `[1]` do relatório |
| 2 | Herança | `parte1-dart/bin/models/pc.dart:3`                        | Bloco `[2]` do relatório |
| 3 | Composição | `parte1-dart/bin/models/manutencao.dart:3`                | Bloco `[3]` do relatório |
| 4 | Encapsulamento | `parte1-dart/bin/models/manutencao.dart:4`                | Bloco `[4]` e o total no topo da tela de lista |
| 5 | Estrutura de tela | `parte2-flutter/lib/screens/home_page.dart:99`            | AppBar e corpo da tela inicial |
| 6 | Cartão | `parte2-flutter/lib/screens/widgets/hardwareCard.dart:63` | Cada item da lista |
| 7 | Lista | `parte2-flutter/lib/screens/home_page.dart:277`           | Lista rolável com seis itens |
| 8 | Navegação | `parte2-flutter/lib/screens/hardwareCard.dart:33`         | Toque no item abre o detalhe |
| 9 | Formulário | `parte2-flutter/lib/screens/register_page.dart:139`       | Tela de cadastro |
| 10 | Estado | `parte2-flutter/lib/screens/register_page.dart:102`       | Item novo na lista e total atualizado |

---

## Uso de Composição e não Herança
~~~~
    Emquanto a classe PC utiliza herança por ser um tipo de Hardware, 
    manutencao utiliza composição por possuir e gerenciar uma lista de objetos Hardware.
~~~~

## Tecnologias utilizadas

- Dart
- Flutter

---

# Como executar
- ## Parte 1

~~~

- Entre na pasta do projeto Dart:
    cd parte1-dart
    
- Execute:
    dart run

- Para verificar possíveis problemas:
    dart analyze

~~~
- ## Parte 2
~~~

- Entre na pasta do projeto Flutter:
    cd parte2-flutter

- Execute:
    flutter run

- Para verificar possíveis problemas:
    flutter analyze
~~~