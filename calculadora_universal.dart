import 'dart:math';

void main() {
  final Map<String, double Function(List<double>)> calculadoraUniversal = {
    'soma': (p) => p.reduce((a, b) => a + b),
    'subtracao': (p) => p.reduce((a, b) => a - b),
    'multiplicacao': (p) => p.reduce((a, b) => a * b),
    'divisao': (p) => p.reduce((a, b) => a / b),
    'potencia': (p) => pow(p[0], p[1]).toDouble(),
  };

  print('--- TESTE 1: CALCULADORA UNIVERSAL ---');
  print('Soma (10, 20, 30): ${calculadoraUniversal['soma']!([10, 20, 30])}');
  print('Potência (2, 3): ${calculadoraUniversal['potencia']!([2, 3])}');

  print('\n--- TESTE 2: RAÍZES (1º GRAU - 2 parâmetros) ---');
  calcularRaizes(2, 10); 

  print('\n--- TESTE 3: RAÍZES (2º GRAU - 3 parâmetros) ---');
  calcularRaizes(1, -5, 6); 
  
  print('\n--- TESTE 4: RAÍZES (Delta Negativo) ---');
  calcularRaizes(1, 0, 16);
}

void calcularRaizes(double a, double b, [double? c]) {
  if (c == null) {
    print('[Identificado: 1º Grau (ax + b = 0)]');
    if (a == 0) {
      print('Erro: "a" não pode ser zero.');
    } else {
      double x = -b / a;
      print('Equação: ${a}x + ($b) = 0 | Raiz x = $x');
    }
  } else {
    print('[Identificado: 2º Grau (ax² + bx + c = 0)]');
    if (a == 0) {
      calcularRaizes(b, c);
      return;
    }

    double delta = (b * b) - (4 * a * c);
    print('Equação: ${a}x² + (${b})x + ($c) = 0 | Delta: $delta');

    if (delta < 0) {
      print('Resultado: Não existem raízes reais.');
    } else {
      double x1 = (-b + sqrt(delta)) / (2 * a);
      double x2 = (-b - sqrt(delta)) / (2 * a);
      print('Raiz x1: $x1 | Raiz x2: $x2');
    }
  }
}
