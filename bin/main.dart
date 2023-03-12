import 'apis/noticias_api.dart';
import 'apis/login_api.dart';
import 'package:shelf/shelf.dart';

import 'infra/custom_server.dart';
import 'infra/middleware_interception.dart';
import 'infra/security/security_service_impl.dart';
import 'models/noticia_model.dart';
import 'services/noticias_service.dart';
import 'services/noticias_service_impl.dart';
import 'utils/custom_env.dart';

Future<void> main(List<String> arguments) async {
  CustomEnv.fromFile('.env-dev');

  // adicionando varios handers
  var cascadeHandler = Cascade()
    .add(LoginApi(SecurityServiceImpl()).handler)
    .add(NoticiasApi(NoticiasServiceImpl()).handler) 
    .handler;

  final handler = Pipeline()
    .addMiddleware(MiddlewareInterception().meddleware)
    .addMiddleware(logRequests())
    .addHandler(cascadeHandler);

  await CustomServer().initialize(
    address: await CustomEnv.get<String>(key: 'server_address'),
    port:  await CustomEnv.get<int>(key: 'server_port'),
    handler: handler,   
 );
}
