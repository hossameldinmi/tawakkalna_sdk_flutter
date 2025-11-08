import 'package:equatable/equatable.dart';

abstract class BaseEnum<V, E extends BaseEnum<V, E>> extends Equatable {
  final V value;
  const BaseEnum(this.value);

  bool matchAny(List<E> list) => list.contains(this);

  @override
  List<Object?> get props => [value];
}
