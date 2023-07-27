import 'package:brasil_fields/brasil_fields.dart';
import 'package:result_dart/result_dart.dart';
import 'package:up_catalagos/app/core_module/vos/value_object.dart';

class CPFVO extends ValueObject<String> {
  const CPFVO(super.value);

  @override
  Result<CPFVO, String> validate([Object? object]) {
    if (value.isEmpty) {
      return '$object não pode ser vazio'.toFailure();
    }

    if (!UtilBrasilFields.isCPFValido(value)) {
      return '$object inválido'.toFailure();
    }

    return Success(this);
  }
}
