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
  JWT? validateJWT(String token) {
    // TODO: implement validateJWT
    throw UnimplementedError();
  }

}