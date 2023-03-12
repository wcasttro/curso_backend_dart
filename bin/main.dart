import 'apis/noticias_api.dart';
import 'apis/login_api.dart';
import 'package:shelf/shelf.dart';

import 'infra/custom_server.dart';
import 'services/noticias_service.dart';
import 'services/noticias_service_impl.dart';
import 'utils/custom_env.dart';

Future<void> main(List<String> arguments) async {
  CustomEnv.fromFile('.env-dev');

  // adicionando varios handers
  var cascadeHandler = Cascade()
    .add(LoginApi().handler)
    .add(NoticiasApi(NoticiasServiceImpl()).handler) 
    .handler;

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  await CustomServer().initialize(
    address: await CustomEnv.get<String>(key: 'server_address'),
    port:  await CustomEnv.get<int>(key: 'server_port'),
    handler: handler,   
 );
}
