
import 'package:salahly_models/models/client.dart';

abstract class Authentication{
  Future<bool> login(String email, String password);
  Future<bool> signup(String email,String password);
}