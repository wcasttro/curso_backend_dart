import 'package:shelf/shelf.dart';

class MiddlewareInterception{
  Middleware get meddleware{
    return createMiddleware(
      responseHandler: (Response rest){
        return rest.change(
          headers: {'content-type': 'application/json'}
        );
      }
    );
  }
}