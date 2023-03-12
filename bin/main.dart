import 'api/blog_api.dart';
import 'api/login_api.dart';
import 'package:shelf/shelf.dart';

import 'infra/custom_server.dart';
import 'utils/custom_env.dart';

Future<void> main(List<String> arguments) async {
  CustomEnv.fromFile('.env-dev');

  // adicionando varios handers
  var cascadeHandler = Cascade()
    .add(LoginApi().handler)
    .add(BlogApi().handler) 
    .handler;

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  await CustomServer().initialize(
    address: await CustomEnv.get<String>(key: 'server_address'),
    port:  await CustomEnv.get<int>(key: 'server_port'),
    handler: handler,   
 );
}
