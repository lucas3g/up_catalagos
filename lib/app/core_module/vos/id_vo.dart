import 'package:result_dart/result_dart.dart';
import 'package:up_catalagos/app/core_module/vos/value_object.dart';

class IdVO extends ValueObject<int> {
  const IdVO(super.value);

  @override
  Result<IdVO, String> validate([Object? object]) {
    if (value <= 0) {
      return '$runtimeType não pode ser menor que zero'.toFailure();
    }
    return Success(this);
  }
}
