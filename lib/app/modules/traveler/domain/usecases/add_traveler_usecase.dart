import '../entities/traveler_entity.dart';
import '../repositories/traveler_repository_interface.dart';

abstract class IAddTravelerUseCase {
  Future<void> call(TravelerEntity traveler);
}

class AddTravelerUseCase implements IAddTravelerUseCase {
  final ITravelerRepository _repository;
  AddTravelerUseCase(this._repository);

  @override
  Future<void> call(TravelerEntity traveler) async {
    return await _repository.addTraveler(traveler);
  }
}
