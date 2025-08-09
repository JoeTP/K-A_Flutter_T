
abstract class UseCase<Params, Type> {
  Future<Type> call(Params params);
}
