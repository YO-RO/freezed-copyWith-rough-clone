void main() {
  var state = const User(name: 'YO-RO', age: 19);
  print(state);
  state = state.copyWith(age: null);
  print(state);
}

const freezed = Freezed();

class Freezed {
  const Freezed();
}

class User {
  const User({required this.name, required this.age});

  final String name;
  final int? age;

  @override
  String toString() {
    return 'User(name: $name, age: $age)';
  }

  UserCopyWith get copyWith => UserCopyWithImpl(this);
}

abstract class UserCopyWith {
  factory UserCopyWith(User value) = UserCopyWithImpl;

  User call({String name, int? age});
}

class UserCopyWithImpl implements UserCopyWith {
  UserCopyWithImpl(this._value);

  final User _value;

  @override
  User call({
    Object? name = freezed,
    Object? age = freezed,
  }) {
    return User(
      name: name == freezed ? _value.name : name as String,
      age: age == freezed ? _value.age : age as int?,
    );
  }
}
