import 'dart:io';

List<int> preencherLista() {
  List<int> lista = [];
  while (true) {
    int valor = int.parse(stdin.readLineSync()!);
    if (valor == 0) break;
    lista.add(valor);
  }
  return lista;
}

void main() {
  List<int> lista1 = preencherLista();
  List<int> lista2 = preencherLista();

  if (lista1.length > lista2.length) {
    print("A primeira lista é maior que a segunda");
  } else if (lista1.length < lista2.length) {
    print("A primeira lista é menor que a segunda");
  } else {
    lista1.sort();
    lista2.sort();
    
    bool identicas = true;
    for (int i = 0; i < lista1.length; i++) {
      if (lista1[i] != lista2[i]) {
        identicas = false;
        break;
      }
    }

    if (identicas) {
      print("As listas são idênticas");
    } else {
      print("As listas têm o mesmo tamanho, mas não são idênticas");
    }
  }
}