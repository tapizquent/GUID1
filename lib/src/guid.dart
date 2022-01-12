import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

/// Globally unique identifier
class GUID extends Equatable {
  final String _value;

  /// Generates a new GUID
  GUID() : _value = Uuid().v4();

  /// Used to generate a GUID object from a String representation of it
  ///
  /// Throws `AssertionError` if `value` is of invalid format and cannot be parsed
  GUID.fromValue(String value) : this._value = value {
    assert(_checkValidGUIDValue(value),
        'value is of invalid format and cannot be parsed in GUID');
  }

  const GUID.forceValue(String value) : this._value = value;

  static const empty = GUID.forceValue(Uuid.NAMESPACE_NIL);

  @override
  String toString() => _value;

  @override
  List<Object> get props => [_value];

  bool _checkValidGUIDValue(String value) {
    final RegExp _guidRegExp = RegExp(
        r'^(\{){0,1}[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}(\}){0,1}$');
    return _guidRegExp.hasMatch(value);
  }
}
