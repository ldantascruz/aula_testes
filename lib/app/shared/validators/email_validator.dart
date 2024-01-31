class EmailValidator {
  String? validate({String? email}) {
    if (email == null || email.isEmpty) {
      return 'O e-mail é obrigatório';
    }

    final regex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regex.hasMatch(email)) {
      return 'O e-mail é inválido';
    }

    return null;
  }
}
