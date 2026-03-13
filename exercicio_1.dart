import 'dart:io';

void main() {
  String? entrada = stdin.readLineSync();
  if (entrada != null && entrada.contains('/')) {
    List<String> partes = entrada.split('/');
    List<String> meses = [
      "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
      "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
    ];

    int dia = int.parse(partes[0]);
    int mes = int.parse(partes[1]);
    int ano = int.parse(partes[2]);

    print("$dia de ${meses[mes - 1]} de $ano");
  }
}