import 'package:flutter/material.dart';

//Preview

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

















// Enum para definir o tipo de item, embora neste caso seja mais sobre estado (selecionado/não selecionado)

enum OpcaoSelecaoStatus { selecionado, naoSelecionado }

class ComponenteCaixaSelecao extends StatefulWidget {
  // Lista de textos para cada opção da caixa de seleção.
  final List<String> opcoes;
  // Callback que é chamado quando uma nova opção é selecionada. Retorna o texto da opção.
  final ValueChanged<String> onOpcaoSelecionada;
  // A opção que deve vir pré-selecionada.
  final String? opcaoInicial;

  const ComponenteCaixaSelecao({
    super.key,
    required this.opcoes,
    required this.onOpcaoSelecionada,
    this.opcaoInicial,
  });

  @override
  State<ComponenteCaixaSelecao> createState() => _ComponenteCaixaSelecaoState();
}

class _ComponenteCaixaSelecaoState extends State<ComponenteCaixaSelecao> {
  // Variável para armazenar a opção atualmente selecionada.
  String? _opcaoSelecionada;

  @override
  void initState() {
    super.initState();
    // Define a opção inicial quando o widget é construído.
    _opcaoSelecionada = widget.opcaoInicial;
  }

  // Função para construir um único item da lista (Fácil, Médio, Difícil).
  Widget _buildOpcaoItem(String textoOpcao) {
    final bool estaSelecionado = _opcaoSelecionada == textoOpcao;

    // Define a aparência com base no estado de seleção.
    final Color corIcone = estaSelecionado ? Colors.white : Colors.transparent;
    final Color corFundoIcone =
        estaSelecionado ? const Color.fromARGB(255, 83, 177, 117) : Colors.transparent;
    final Color corBorda =
        estaSelecionado ? const Color.fromARGB(255, 83, 177, 117) : Colors.grey.shade400;
    final Color corTexto =
        estaSelecionado ? const Color.fromARGB(255, 83, 177, 117) : Colors.grey.shade700;
    final FontWeight pesoFonte =
        estaSelecionado ? FontWeight.bold : FontWeight.normal;

    return GestureDetector(
      onTap: () {
        // Atualiza o estado para refletir a nova seleção.
        setState(() {
          _opcaoSelecionada = textoOpcao;
        });
        // Notifica o widget pai sobre a mudança.
        widget.onOpcaoSelecionada(textoOpcao);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            // Container do ícone (o quadrado de seleção)
            Container(
              width: 24.07,
              height: 24.07,
              decoration: BoxDecoration(
                color: corFundoIcone,
                border: Border.all(color: corBorda, width: 1.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Icon(
                  Icons.check_rounded,
                  color: corIcone,
                  size: 20.0,
                ),
              ),
            ),
            const SizedBox(width: 12.0), // Espaçamento
            // Texto da opção
            Text(
              textoOpcao,
              style: TextStyle(
                fontSize: 16,
                color: corTexto,
                fontWeight: pesoFonte,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Usa um Column para listar as opções verticalmente.
    return Column(
      mainAxisSize: MainAxisSize.min, // Para ocupar apenas o espaço necessário
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.opcoes
          .map((opcao) => _buildOpcaoItem(opcao))
          .toList(), // Mapeia a lista de strings para uma lista de widgets
    );
  }
}