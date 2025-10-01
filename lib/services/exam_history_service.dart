import 'package:unicv_tech_mvp/models/exam_history.dart';
import 'package:unicv_tech_mvp/services/repositories/exam_history_repository.dart';

/// Coordinates exam history retrieval and applies lightweight domain rules.
class ExamHistoryService {
  final ExamHistoryRepository repository;

  ExamHistoryService({required this.repository});

  Future<List<SubjectExamHistory>> loadExamHistory() {
    return repository.fetchSubjectExamHistories();
  }
}
