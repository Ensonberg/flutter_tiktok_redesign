import 'package:get/get.dart';

class AuthController extends GetxController {
  bool _isEmailOtp = false;
  bool _isPhoneOtp = false;

  String _email = "";
  String _phoneNumber = "";

  bool get isEmailOtp => _isEmailOtp;

  bool get isPhoneOtp => _isPhoneOtp;

  String get email => _email;

  String get phoneNumber => _phoneNumber;

  void addEmail(String email) {
    _email = email;
    update();
  }

  void addPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    update();
  }

  void changeEmailOtp(bool isEmailOtp) {
    _isEmailOtp = isEmailOtp;
    update();
  }

  void changePhoneOtp(bool isPasswordOtp) {
    _isPhoneOtp = isPasswordOtp;
    update();
  }
}
