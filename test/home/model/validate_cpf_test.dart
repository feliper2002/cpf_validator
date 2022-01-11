import 'package:cpf_validator/home/controller/validator_controller.dart';
import 'package:cpf_validator/home/model/validate_cpf.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final usecase = ValidateCPFImpl();
  final controller = ValidatorController(usecase);

  test('Should return TRUE if CPF is valid', () {
    controller.setCPF("75258092674");
    expect(controller.isValid, true);
  });

  test('Should return FALSE if CPF is invalid', () {
    controller.setCPF("75257092675");
    expect(controller.isValid, false);

    controller.setCPF("82257092685");
    expect(controller.isValid, false);

    controller.setCPF("82257092685487324");
    expect(controller.isValid, false);

    controller.setCPF("8824");
    expect(controller.isValid, false);
  });
}
