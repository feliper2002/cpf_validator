abstract class ValidateCPF {
  bool validate(String cpf);
}

class ValidateCPFImpl implements ValidateCPF {
  bool _resto(int digito, List<int> cpf) {
    /// Aplies formula that [validate] parsed cpf
    ///
    /// - [digito]: numeric [index] at CPF string
    ///
    /// - [cpf]: List<int> containing all CPF digit by digit parsed
    int soma = 0;
    for (var k = 0; k <= (digito - 2);) {
      for (var i = digito; i >= 2; i--) {
        soma += (cpf[k] * i);
        k++;
      }
    }

    int resto = ((soma * 10) % 11);

    if (resto == 10) resto = 0;

    return (resto == cpf[digito - 1]);
  }

  @override
  bool validate(String cpf) {
    Map<String, dynamic> errors = {};

    if (cpf.isEmpty) {
      errors.putIfAbsent('EmptyCPFInputError', () => null);
    }

    if (cpf.length != 11) {
      errors.putIfAbsent('CPFLenghError', () => null);
    }

    if (errors.isNotEmpty) return false;

    final cpfList = <int>[];

    for (var i = 0; i < cpf.length; i++) {
      /// Parse all CPF string unique char at an [int] by [String extension]
      ///
      /// Add respective CPF char as int at [cpfList]
      cpfList.add(int.parse(cpf[i]));
    }

    bool decimo = _resto(10, cpfList);
    bool decimoPrimeiro = _resto(11, cpfList);

    return (decimo && decimoPrimeiro);
  }
}
