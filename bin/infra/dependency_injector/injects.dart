import '../../apis/login_api.dart';
import '../../apis/noticias_api.dart';
import '../../services/noticias_service.dart';
import '../../services/noticias_service_impl.dart';
import '../security/security_service.dart';
import '../security/security_service_impl.dart';
import 'dependency_injetor.dart';

class Injects {
  static DependencyInjetor initalize() {
    final di = DependencyInjetor();

    di.register<SecurityService>(() => SecurityServiceImpl());

    di.register<LoginApi>(() => LoginApi(di()));

    di.register<NoticiasService>(() => NoticiasServiceImpl());

    di.register<NoticiasApi>(() => NoticiasApi(di()));

    return di;
  }
}
