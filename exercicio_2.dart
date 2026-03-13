import 'dart:io';

void main() {
  List<int> numeros = [];
  Map<int, int> contagem = {};

  for (int i = 0; i < 10; i++) {
    int n = int.parse(stdin.readLineSync()!);
    numeros.add(n);
    contagem[n] = (contagem[n] ?? 0) + 1;
  }

  contagem.forEach((valor, qtd) {
    print("O valor $valor repete $qtd vez(es)");
  });
}