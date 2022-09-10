import '../../../core_module/ui/colors.dart';
import '../../../core_module/ui/scale.dart';
import '../../data/gateways/movie_gateway.dart';
import '../widgets/app_text_field.dart';
import '../widgets/login_button.dart';
import 'home_view.dart';
import "package:flutter/material.dart";

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    CoreGateway.connectionState();
  }

  @override
  Widget build(BuildContext context) {
    Scale.init(context);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"), fit: BoxFit.cover, alignment: Alignment.center)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(gradient: AppGradients.backgroundGradientOpacity),
          padding: EdgeInsets.only(top: Scale.width(10), left: Scale.width(4), right: Scale.width(4)),
          child: SafeArea(
            child: Column(
              children: [
                Text(
                  "MOVIES",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.goldenYellow, fontSize: AppFontSize.loginPageTitle, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Scale.width(10),
                ),
                const AppTextField(
                  text: "E-mail",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: Scale.width(7),
                ),
                const AppTextField(
                  text: "Password",
                  obscureText: true,
                ),
                SizedBox(
                  height: Scale.width(10),
                ),
                LoginButton(
                  text: "Login",
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeView()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
