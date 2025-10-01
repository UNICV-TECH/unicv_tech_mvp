import 'package:flutter/material.dart';
import 'components/ComponenteBotao.dart';
import 'components/ComponenteNavbar.dart';
import 'components/exam_history_accordion.dart';
import 'package:unicv_tech_mvp/services/exam_history_service.dart';
import 'package:unicv_tech_mvp/services/repositories/mock_exam_history_repository.dart';

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

@Preview(
  name: 'Histórico de Provas',
  size: Size(360, 560),
  textScaleFactor: 1.0,
  brightness: Brightness.light,
)
Widget examHistoryAccordionPreview() {
  final service = ExamHistoryService(
    repository: MockExamHistoryRepository(),
  );

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          ExamHistoryAccordion(
            service: service,
            iconByKey: const {
              'psychology': Icons.psychology_alt_outlined,
              'social_sciences': Icons.groups_2_outlined,
              'financial': Icons.request_quote_outlined,
              'administration': Icons.settings_suggest_outlined,
              'pedagogy': Icons.school_outlined,
              'design': Icons.design_services_outlined,
              'law': Icons.balance_outlined,
            },
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: CustomNavBar(),
            ),
          ),
        ],
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

@Preview(
  name: 'Navbar',
  size: tamanhoPadraoPreview,
  textScaleFactor: 1.0,
  brightness: Brightness.light,
)
Widget customNavBarPreview() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Stack(
        children: [
          Center(child: Text('Conteúdo de teste')),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomNavBar(),
          ),
        ],
      ),
    ),
  );
}
