import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sofi_interview/app/feature/home/controllers/home_controller.dart';
import 'package:sofi_interview/app/feature/home/views/home.dart';

class MockHomeController extends GetxController
    with Mock
    implements HomeViewController {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockHomeController mockHomeController;

  setUpAll(() {
    mockHomeController = MockHomeController();
    Get.put(mockHomeController as HomeViewController);
  });

  tearDown(() => Get.reset);
  group('HomeView tests:', () {
    testWidgets('HomeView renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: HomeView(),
        ),
      );

      expect(find.byType(HomeView), findsOneWidget);
    });
  });
}
