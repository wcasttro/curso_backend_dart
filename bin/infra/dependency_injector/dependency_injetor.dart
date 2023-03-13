typedef T InstanceCreator<T>();

class DependencyInjetor {
  DependencyInjetor._();

  static final _singleton = DependencyInjetor._();
  factory DependencyInjetor() => _singleton;

  final _instanceMap = Map<Type, _InstanceGenerator<Object>>();

  // registrar
  void register<T extends Object>(
    InstanceCreator<T> instance, {
    bool isSingleton = true,
  }) {
    _instanceMap[T] = _InstanceGenerator(instance, isSingleton);
  }

  //get
  T get<T extends Object>() {
    final instance = _instanceMap[T]?.getInstance();

    if (instance != null && instance is T) {
      return instance;
    }
    throw Exception('[Error] -> Instance ${T.toString()} not found');
  }

  call<T extends Object>() => get<T>();
}

class _InstanceGenerator<T> {
  T? _instance;
  bool _isFisrtGet = false;
  final InstanceCreator<T> _instanceCreator;

  _InstanceGenerator(this._instanceCreator, bool isSingleton)
      : _isFisrtGet = isSingleton;

  T? getInstance() {
    if (_isFisrtGet) {
      _instance = _instanceCreator();
      _isFisrtGet = false;
    }

    return _instance ??= _instanceCreator();
  }
}
