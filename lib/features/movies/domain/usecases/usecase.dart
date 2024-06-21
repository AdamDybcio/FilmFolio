abstract class Usecase<T, Params> {
  Future<T> call(Params params);
}
