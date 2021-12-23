import 'package:cpf_validator/home/model/validate_cpf.dart';

class ValidatorController {
  final ValidateCPF _validateCPFUsecase;

  ValidatorController(this._validateCPFUsecase);

  String cpf = '';
  bool changedCPF = false;

  setCPF(String value) {
    cpf = value;
  }

  String validateMessage = '';
  setMessage(value) {
    validateMessage = value;
  }

  bool get buttonEnable => cpf.length == 11;

  validate(String cpf) {
    bool isValid = _validateCPFUsecase.validate(cpf);
    if (isValid) {
      setMessage("CPF validated! 🎉🎉");
      setCPF("");
    } else {
      setMessage("CPF is invalid! 😨😱😭");
      setCPF("");
    }
  }
}
