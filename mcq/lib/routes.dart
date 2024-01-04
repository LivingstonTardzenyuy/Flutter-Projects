import 'about/about.dart';
import 'login/login.dart';
import 'profile/profile.dart';
import 'quiz/quiz.dart';
import 'home/home.dart';


var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
}