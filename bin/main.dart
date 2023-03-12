import 'package:curso_backend_dart/curso_backend_dart.dart' as curso_backend_dart;
import 'package:shelf/shelf.dart';

import 'api/blog_api.dart';
import 'api/login_api.dart';
import 'infra/custom_server.dart';

Future<void> main(List<String> arguments) async {

  // adicionando varios handers
  var cascadeHandler = Cascade()
    .add(LoginApi().handler)
    .add(BlogApi().handler) 
    .handler;

  await CustomServer().initialize(cascadeHandler);
}
