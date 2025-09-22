import 'package:flutter/material.dart';
import 'components/chekbox.dart';

// Constante para o tamanho do container de preview
const Size tamanhoPadraoPreview = Size(300, 250);

// Preview do componente com 'Fácil' selecionado por padrão
@Preview(
  name: 'Caixa de Seleção - Padrão',
  size: tamanhoPadraoPreview,
  brightness: Brightness.light,
)
Widget componenteCaixaSelecaoPadraoPreview() {
  return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ComponenteCaixaSelecao(
          opcoes: const ['Fácil', 'Médio', 'Difícil'],
          opcaoInicial: 'Fácil', // Define a primeira opção como selecionada
          onOpcaoSelecionada: (opcao) {
            // Ação ao selecionar. No preview, pode-se usar um print.
            debugPrint("Opção selecionada: $opcao");
          },
        ),
      ),
    ),
  );
}

// Preview do componente com outra opção selecionada
@Preview(
  name: 'Caixa de Seleção - "Quantidade" ',
  size: tamanhoPadraoPreview,
  brightness: Brightness.light,
)
Widget componenteCaixaSelecaoDificilPreview() {
  return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ComponenteCaixaSelecao(
          opcoes: const ['5', '10', '15'],
          opcaoInicial: '15', // Define 'Difícil' como a seleção inicial
          onOpcaoSelecionada: (opcao) {
            debugPrint("Opção selecionada: $opcao");
          },
        ),
      ),
    ),
  );
}

// Preview com textos customizados
@Preview(
  name: 'Caixa de Seleção - Opções customizadas',
  size: tamanhoPadraoPreview,
  brightness: Brightness.light,
)
Widget componenteCaixaSelecaoCustomizadaPreview() {
  return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ComponenteCaixaSelecao(
          opcoes: const ['Iniciante', 'Intermediário', 'Avançado'],
          opcaoInicial: 'Intermediário',
          onOpcaoSelecionada: (opcao) {
            debugPrint("Opção selecionada: $opcao");
          },
        ),
      ),
    ),
  );
}

// Classe de anotação para o preview (exatamente como no seu exemplo)
class Preview {
  final String name;
  final Size? size;
  final double? textScaleFactor;
  final Brightness? brightness;

  const Preview({
    required this.name,
    this.size,
    this.textScaleFactor,
    this.brightness,
  });
}