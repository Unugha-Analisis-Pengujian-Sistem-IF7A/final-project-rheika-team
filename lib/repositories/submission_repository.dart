import '../models/submission.dart';

class SubmissionRepository {
  SubmissionRepository._private();
  static final SubmissionRepository instance = SubmissionRepository._private();

  final List<Submission> _items = [];

  List<Submission> getAll() => List.unmodifiable(_items);

  void add(Submission s) {
    _items.insert(0, s);
  }

  void clearAll() {
    _items.clear();
  }
}
