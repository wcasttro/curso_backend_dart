import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../infra/security/security_service.dart';
import 'api.dart';
class LoginApi extends Api{

  final  SecurityService _securityService;

  LoginApi(this._securityService);
  
  @override
  Handler getHandler({ List<Middleware> middlewares = const []}) {
    Router router = Router();

    router.post('/login', (Request request) async {
      final token = await _securityService.generateJWT('007');
      final result = _securityService.validateJWT(token);
      return Response.ok(token);
    });

    return createHandler(router: router, middlewares: middlewares);   
  }

}