import 'package:desafio_tokenlab/presentation/views/tela_inicial.dart';
import 'package:desafio_tokenlab/models/post_model_comics.dart';
import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromRGBO(40, 50, 40, 1),
      padding: EdgeInsets.only(top: 60, left: 40, right: 40),
      child: ListView(
        children: [
          SizedBox(
            child: Image.asset("assets/images/marvel_logo.png"),
            height: 80,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            style: TextStyle(color: Colors.red),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                labelText: "E-mail",
                labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.w400, fontSize: 20)),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            autofocus: true,
            style: TextStyle(color: Colors.red),
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusColor: Colors.red,
                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.w400, fontSize: 20)),
          ),
          Container(
            height: 30,
            alignment: Alignment.centerRight,
            child: FlatButton(
              child: Text(
                "Recuperar senha",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.red),
              ),
              onPressed: null,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          BotaoLogin(
              textoDeLogin: "Entrar",
              cor: Colors.red,
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaInicial()),
                    )
                  }),
          SizedBox(
            height: 20,
          ),
          BotaoLogin(textoDeLogin: "Login com Facebook", cor: Colors.blue, onPressed: () => {getMoviesList()}),
          SizedBox(
            height: 20,
          ),
          BotaoLogin(
              textoDeLogin: "Google",
              cor: Colors.white,
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaInicial()),
                    )
                  })
        ],
      ),
    ));
  }
}

class BotaoLogin extends StatelessWidget {
  String textoDeLogin = "";
  Color cor = Colors.white;
  final Function() onPressed;

  BotaoLogin({Key? key, required this.textoDeLogin, this.cor = Colors.white, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: SizedBox.expand(
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("$textoDeLogin", style: TextStyle(fontWeight: FontWeight.bold))],
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
