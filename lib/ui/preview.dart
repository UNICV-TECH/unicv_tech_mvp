import 'package:flutter/material.dart';
import 'components/ComponenteBotao.dart';

// Constante para tamanho padrão dos previews
const Size tamanhoPadraoPreview = Size(353, 100);

// Preview do botão primário - apenas texto
@Preview(
  name: 'Botão Primário (Texto)',
  size: tamanhoPadraoPreview,
  textScaleFactor: 1.2,
  brightness: Brightness.light,
)
Widget componenteBotaoPrimarioPreview() {
  return Container(
    child: Center(
      child: Componentebotao(
        texto: "Primário",
        onPressed: () {},
        tipo: BotaoTipo.primario,
      ),
    ),
  );
}

// Preview do botão primário - apenas ícone
@Preview(
  name: 'Botão Primário (Ícone)',
  size: tamanhoPadraoPreview,
  textScaleFactor: 1.2,
  brightness: Brightness.light,
)
Widget componenteBotaoPrimarioIconePreview() {
  return Container(
    child: Center(
      child: Componentebotao(
        texto: "",
        icone: Icons.add,
        onPressed: () {},
        tipo: BotaoTipo.primario,
      ),
    ),
  );
}

// Preview do botão primário - texto + ícone
@Preview(
  name: 'Botão Primário (Texto + Ícone)',
  size: tamanhoPadraoPreview,
  textScaleFactor: 1.2,
  brightness: Brightness.light,
)
Widget componenteBotaoPrimarioTextoIconePreview() {
  // ignore: avoid_unnecessary_containers
  return Container(
    child: Center(
      child: Componentebotao(
        texto: "Primário",
        icone: Icons.add,
        onPressed: () {},
        tipo: BotaoTipo.primario,
      ),
    ),
  );
}

// Preview do botão secundário - texto
@Preview(
  name: 'Botão Secundário (Texto)',
  size: tamanhoPadraoPreview,
  textScaleFactor: 1.2,
  brightness: Brightness.light,
)
Widget componenteBotaoSecundarioPreview() {
  return Container(
    child: Center(
      child: Componentebotao(
        texto: "Secundário",
        onPressed: () {},
        tipo: BotaoTipo.secundario,
      ),
    ),
  );
}

// Preview do botão desabilitado - texto
@Preview(
  name: 'Botão Desabilitado (Texto)',
  size: tamanhoPadraoPreview,
  textScaleFactor: 1.2,
  brightness: Brightness.light,
)
Widget componenteBotaoDesabilitadoPreview() {
  return Container(
    child: Center(
      child: Componentebotao(
        texto: "Desabilitado",
        onPressed: () {},
        tipo: BotaoTipo.desabilitado,
      ),
    ),
  );
}

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
