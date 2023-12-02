import 'package:flutter/material.dart';
import 'package:spirit_life/screens/home.dart';
import 'package:spirit_life/screens/navigation.dart';
import 'package:cool_alert/cool_alert.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  NavBar navbar = new NavBar();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController specialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.yellow, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: _page(),
        ),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(38),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 90,
            ),
            _icon(),
            const SizedBox(
              height: 30,
            ),
            _warning(),
            const SizedBox(
              height: 20,
            ),
            _inputField("User Name", usernameController),
            const SizedBox(
              height: 20,
            ),
            _inputField("Password", passwordController, isPassword: true),
            const SizedBox(
              height: 20,
            ),
            _inputField("Access Code", specialController),
            const SizedBox(
              height: 30,
            ),
            _loginBtn(),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle),
      child: const Icon(
        Icons.person,
        color: Colors.white,
        size: 80,
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Colors.white));
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
        isDense: true,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        String name = usernameController.text;
        String password = passwordController.text;
        String code = specialController.text;
        if (name == '' || password == '' || code == '') {
          CoolAlert.show(
              context: context,
              type: CoolAlertType.warning,
              text: "Inputs Canot Be Empty",
              confirmBtnColor: const Color.fromARGB(224, 247, 181, 0),
              backgroundColor: Color.fromARGB(224, 247, 181, 0));
          clear(usernameController, passwordController, specialController);
        } else if (name == 'spirit' &&
            password == "Life" &&
            code == "Spirit_life_app") {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => const Home(),
          ));
        } else {
          CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              text: "Incorrect input",
              confirmBtnColor: const Color.fromARGB(224, 247, 181, 0),
              backgroundColor: Color.fromARGB(224, 247, 181, 0));
          clear(usernameController, passwordController, specialController);
        }
      },
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.white,
          foregroundColor: Colors.orange,
          padding: const EdgeInsets.symmetric(vertical: 16)),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Sign In",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _warning() {
    return const Center(
      child: Text(
        "Apperoved Users Only",
        style: TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }
}

// validation(String name, String password, String code) {

// }

clear(name, password, code) {
  return (name.text = "", password.text = "", code.text = "");
}

//Todo => Page rout to registering page 
// todo => validation function