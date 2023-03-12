import 'api/blog_api.dart';
import 'api/login_api.dart';
import 'package:shelf/shelf.dart';

import 'infra/custom_server.dart';

Future<void> main(List<String> arguments) async {

  // adicionando varios handers
  var cascadeHandler = Cascade()
    .add(LoginApi().handler)
    .add(BlogApi().handler) 
    .handler;

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  await CustomServer().initialize(handler);
}
