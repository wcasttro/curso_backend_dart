import 'apis/noticias_api.dart';
import 'apis/login_api.dart';
import 'package:shelf/shelf.dart';

import 'infra/custom_server.dart';
import 'infra/dependency_injector/dependency_injetor.dart';
import 'infra/middleware_interception.dart';
import 'infra/security/security_service.dart';
import 'infra/security/security_service_impl.dart';
import 'models/noticia_model.dart';
import 'services/noticias_service.dart';
import 'services/noticias_service_impl.dart';
import 'utils/custom_env.dart';

Future<void> main(List<String> arguments) async {
  CustomEnv.fromFile('.env-dev');

  final _di = DependencyInjetor();

  _di.register<SecurityService>(() => SecurityServiceImpl(), isSingleton: true);

  SecurityService _securityService = _di.get<SecurityService>();

  // adicionando varios handers
  var cascadeHandler = Cascade()
      .add(LoginApi(_securityService).getHandler())
      .add(NoticiasApi(NoticiasServiceImpl()).getHandler(
        isSecurity: true,
      ))
      .handler;

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().meddleware)
      .addHandler(cascadeHandler);

  await CustomServer().initialize(
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
    handler: handler,
  );
}
