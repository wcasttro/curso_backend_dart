import 'package:shelf/shelf.dart';

import '../infra/dependency_injector/dependency_injetor.dart';
import '../infra/security/security_service.dart';
import '../infra/security/security_service_impl.dart';

abstract class Api {
  Handler getHandler({
    bool isSecurity = false,
  });
  Handler createHandler({
    required Handler router,
    bool isSecurity = false,
  }) {
    List<Middleware> middlewares = [];

    final _securityService = DependencyInjetor().get<SecurityService>();

    if (isSecurity) {
      middlewares.addAll([
        _securityService.authorization,
        _securityService.verifyJwt,
      ]);
    }

    var pipeline = Pipeline();

    for (var element in middlewares) {
      pipeline = pipeline.addMiddleware(element);
    }

    return pipeline.addHandler(router);
  }
}
