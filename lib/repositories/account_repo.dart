// lib/repositories/account_repo.dart
import '../models/user_account.dart';

class AccountRepository {
  // Singleton instance
  static final AccountRepository instance = AccountRepository._internal();
  AccountRepository._internal();

  // Daftar akun yang terdaftar di sistem (sementara pakai data dummy)
  final List<UserAccount> _accounts = [
    UserAccount(
      id: '1',
      nama: 'Bebe',
      nik: '1234567890',
      email: 'bebe@email.com',
      status: 'Pending',
    ),
    UserAccount(
      id: '2',
      nama: 'Aditya',
      nik: '0987654321',
      email: 'aditya@email.com',
      status: 'Pending',
    ),
    UserAccount(
      id: '3',
      nama: 'Joko',
      nik: '1122334455',
      email: 'joko@email.com',
      status: 'Pending',
    ),
  ];

  // Getter semua akun
  List<UserAccount> get all => _accounts;

  // Getter akun pending
  List<UserAccount> get pending =>
      _accounts
          .where((a) => a.status == 'Pending' || a.status == 'Menunggu')
          .toList();

  // Ubah status jadi "Disetujui"
  void verify(String id) {
    final index = _accounts.indexWhere((a) => a.id == id);
    if (index != -1) _accounts[index].status = 'Disetujui';
  }

  // Ubah status jadi "Ditolak"
  void reject(String id) {
    final index = _accounts.indexWhere((a) => a.id == id);
    if (index != -1) _accounts[index].status = 'Ditolak';
  }
}
