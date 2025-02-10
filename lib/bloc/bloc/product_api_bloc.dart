import 'package:bloc/bloc.dart';
import 'package:test_task/models/product.dart';
import 'package:test_task/services/api_services.dart';

part 'product_api_event.dart';
part 'product_api_state.dart';

class ProductBloc extends Bloc<ProductEvents, ProductState> {
  final ProductApiService apiServices = ProductApiService();
  ProductBloc(ProductApiService productApiService) : super(ProductInitial()) {
    on<ProductEvents>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await apiServices.fetchProducts();
        print('Fetched Products: $products'); // Log the fetched products
        emit(ProductLoaded(products));
      } catch (e) {
        print('Error fetching products: $e'); // Log the error
        emit(ProductError('Failed to load products: $e'));
      }
    });
    on<FetchProductsByCategoryEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final products =
            await productApiService.fetchProductsByCategory(event.categorySlug);
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
