
import 'package:provider_clean_architecture/domain/usecases/fetch_test_data_usecase.dart';
import 'package:provider_clean_architecture/structure/base/base_notifier.dart';

class HomeNotifier extends BaseNotifier {

  final FetchTestDataUseCase fetchTestDataUseCase;

  HomeNotifier({required this.fetchTestDataUseCase});

  String testMsg = '';

  @override
  void onInit() {
    testMsg = 'notifier onInit() called...';
    fetchTestData();
    super.onInit();
  }

  Future<void> fetchTestData() async {
    await callDataService(
        futureProvider: () => fetchTestDataUseCase(FetchTestDataUseCaseParam()),
        onSuccess: (failOrSuccess) {
          failOrSuccess.fold(
                  (fail) => null,
                  (success) {
                    testMsg = success.testMessage;
                    notifyListeners();
                  }
          );
        }

    );
  }

  @override
  void dispose() {
    super.dispose();
  }

}