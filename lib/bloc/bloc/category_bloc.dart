import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/bloc/bloc/category_state.dart';
import 'package:test_task/services/api_services.dart';

part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ProductApiService productApiService;

  CategoryBloc(
    this.productApiService,
  ) : super(CategoryInitial()) {
    // Register the event handler for FetchCategory
    on<FetchCategoryEvent>(_onFetchCategory);
  }

  Future<void> _onFetchCategory(
      FetchCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final categories = await productApiService.fetchCategories();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
