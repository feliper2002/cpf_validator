import 'package:cpf_validator/home/model/validate_cpf.dart';

class ValidatorController {
  final ValidateCPF _validateCPFUsecase;

  ValidatorController(this._validateCPFUsecase);

  String cpf = '';
  bool changedCPF = false;

  setCPF(String value) {
    cpf = value;
  }

  bool validate(String cpf) => _validateCPFUsecase.validate(cpf);
}
