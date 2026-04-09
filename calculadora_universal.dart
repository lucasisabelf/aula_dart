import 'dart:io';
import 'dart:math';

void main() {
  final Map<String, double Function(List<double>)> calculadoraUniversal = {
    'soma': (p) => p.reduce((a, b) => a + b),
    'subtracao': (p) => p.reduce((a, b) => a - b),
    'multiplicacao': (p) => p.reduce((a, b) => a * b),
    'divisao': (p) => p.reduce((a, b) => a / b),
    'potencia': (p) => pow(p[0], p[1]).toDouble(),
  };

  while (true) {
    print('\n=======================================');
    print('          SISTEMA MATEMÁTICO           ');
    print('=======================================');
    print('1 - Calculadora Universal (Dicionário)');
    print('2 - Calculadora de Raízes (Opcionais)');
    print('0 - Sair');
    stdout.write('Escolha: ');
    String? opcao = stdin.readLineSync();

    if (opcao == '0') break;

    if (opcao == '1') {
      executarUniversal(calculadoraUniversal);
    } else if (opcao == '2') {
      executarRaizes();
    }
  }
}

void calcularRaizes(double a, double b, [double? c]) {
  if (c == null) {
    print('\n[Identificado: 1º Grau (ax + b = 0)]');
    if (a == 0) {
      print('Erro: "a" não pode ser zero em equação de 1º grau.');
    } else {
      double x = -b / a;
      print('Equação: ${a}x + ($b) = 0');
      print('Raiz única x = $x');
    }
  } else {
    print('\n[Identificado: 2º Grau (ax² + bx + c = 0)]');
    if (a == 0) {
      print('A=0. Redirecionando para 1º grau (bx + c = 0)...');
      calcularRaizes(b, c);
      return;
    }

    double delta = (b * b) - (4 * a * c);
    print('Equação: ${a}x² + (${b})x + ($c) = 0');
    print('Delta: $delta');

    if (delta < 0) {
      print('Raízes: Não existem raízes reais (Delta negativo).');
    } else {
      double x1 = (-b + sqrt(delta)) / (2 * a);
      double x2 = (-b - sqrt(delta)) / (2 * a);
      print('Raiz x1: $x1');
      print('Raiz x2: $x2');
    }
  }
}

void executarUniversal(Map<String, double Function(List<double>)> calc) {
  stdout.write('Operação (${calc.keys.join(', ')}): ');
  String func = stdin.readLineSync()!.toLowerCase();

  if (!calc.containsKey(func)) {
    print('Função inválida.');
    return;
  }

  stdout.write('Digite os números (espaçados): ');
  String? entrada = stdin.readLineSync();
  try {
    List<double> numeros = entrada!.split(' ').map(double.parse).toList();
    print('Resultado: ${calc[func]!(numeros)}');
  } catch (e) {
    print('Erro nos dados.');
  }
}

void executarRaizes() {
  print('\nDigite 2 valores para 1º grau ou 3 valores para 2º grau:');
  stdout.write('Valores (espaçados): ');
  String? entrada = stdin.readLineSync();

  try {
    List<double> n = entrada!.split(' ').where((x) => x.isNotEmpty).map(double.parse).toList();

    if (n.length == 2) {
      calcularRaizes(n[0], n[1]);
    } else if (n.length >= 3) {
      calcularRaizes(n[0], n[1], n[2]);
    } else {
      print('Erro: São necessários ao menos 2 coeficientes.');
    }
  } catch (e) {
    print('Erro: Digite apenas números.');
  }
}
