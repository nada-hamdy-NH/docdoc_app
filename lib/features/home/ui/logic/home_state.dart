import 'package:docdoc/features/home/data/spesialization_response_model.dart';

enum LoadStatus { initial, loading, success, error }

class HomeState {
  final LoadStatus specStatus;
  final List<SpecializationData?>? specializations;

  final LoadStatus docsStatus;
  final List<Doctors?>? doctors;
  final int? selectedSpecId;

  const HomeState({
    this.specStatus = LoadStatus.initial,
    this.specializations,
    this.docsStatus = LoadStatus.initial,
    this.doctors,
    this.selectedSpecId,
  });

  HomeState copyWith({
    LoadStatus? specStatus,
    List<SpecializationData?>? specializations,
    LoadStatus? docsStatus,
    List<Doctors?>? doctors,
    int? selectedSpecId,
  }) =>
      HomeState(
        specStatus: specStatus ?? this.specStatus,
        specializations: specializations ?? this.specializations,
        docsStatus: docsStatus ?? this.docsStatus,
        doctors: doctors ?? this.doctors,
        selectedSpecId: selectedSpecId ?? this.selectedSpecId,
      );
}
