abstract class AuthRepo {
  Future<bool> login({
    required String phoneNumber,
    required String password,
  });

  // TODO signup abstract method yozinglar

  // TODO keyin shu funksiyani usecase yaratib ishlatinglar
}
