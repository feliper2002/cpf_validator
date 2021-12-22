import 'package:cpf_validator/home/controller/validator_controller.dart';
import 'package:cpf_validator/home/model/validate_cpf.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final usecase = ValidateCPFImpl();
  final controller = ValidatorController(usecase);

  test('Should return TRUE if CPF is valid', () {
    expect(controller.validate('53833980745'), true);
  });

  test('Should return FALSE if CPF is invalid', () {
    expect(controller.validate(''), false);
    expect(controller.validate('04233533529'), false);
  });
}
