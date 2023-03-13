import '../../utils/custom_env.dart';
import 'security_service.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class SecurityServiceImpl implements SecurityService{
  @override
  Future<String> generateJWT(String userID) async {
    final jwt = JWT({
      'iat': DateTime.now().microsecondsSinceEpoch,
      'userID': userID,
      'roles': ['admin', 'user'],
    });

    final key = await CustomEnv.get(key: 'jwt_key');
    final token = jwt.sign(SecretKey(key));
    return token;    
  }

  @override
  Future<JWT?> validateJWT(String token) async {
    String key = await CustomEnv.get(key: 'jwt_key');
    try{
      return JWT.verify(token, SecretKey(key));    
    } on JWTInvalidError{
      return null;
    } on JWTNotActiveError{
      return null;
    } on JWTExpiredError{
      return null;
    } on JWTUndefinedError{
      return null;
    } catch (e){
      return null;
    }
  }

}