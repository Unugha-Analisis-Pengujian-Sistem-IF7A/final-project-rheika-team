// lib/models/submission.dart
class Submission {
  final String id;
  final String jenis;
  final String nik;
  final String nama;
  final String alamat;
  String status; // Menunggu / Diproses / Selesai / Ditolak
  final DateTime createdAt;

  Submission({
    required this.id,
    required this.jenis,
    required this.nik,
    required this.nama,
    required this.alamat,
    required this.status,
    required this.createdAt,
  });
}

class SubmissionRepository {
  SubmissionRepository._private();
  static final SubmissionRepository instance = SubmissionRepository._private();

  // in-memory list
  final List<Submission> _items = [];

  List<Submission> getAll() => List.unmodifiable(_items);

  void add(Submission s) {
    _items.insert(0, s); // terbaru di depan
  }

  // optional: update status by id
  void updateStatus(String id, String newStatus) {
    final i = _items.indexWhere((e) => e.id == id);
    if (i >= 0) _items[i].status = newStatus;
  }

  void clearAll() => _items.clear();
}
