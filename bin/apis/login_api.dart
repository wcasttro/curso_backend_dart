import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../infra/security/security_service.dart';
class LoginApi{

  final  SecurityService _securityService;

  LoginApi(this._securityService);


  Handler get handler{
    Router router = Router();

    router.post('/login', (Request request) async {
      final token = await _securityService.generateJWT('007');
      final result = _securityService.validateJWT(token);
      return Response.ok(token);
    });

    return router;
  }

}