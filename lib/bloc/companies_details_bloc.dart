import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task3_api_bloc/resources/api_repository.dart';

import '../models/companies_details.dart';

part 'companies_details_event.dart';
part 'companies_details_state.dart';

class CompaniesDetailsBloc
    extends Bloc<CompaniesDetailsEvent, CompaniesDetailsState> {
  CompaniesDetailsBloc() : super(CompaniesDetailsInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetCompaniesData>((event, emit) async {
      try {
        emit(CompaniesDetailsLoading());
        final companiesData = await apiRepository.fetchCompaniesDetails();
        emit(CompaniesDetailsLoaded(companiesData));
        if (companiesData.error != null) {
          emit(CompaniesDetailsError(companiesData.error));
        }
      } on NetworkError {
        emit(const CompaniesDetailsError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}
