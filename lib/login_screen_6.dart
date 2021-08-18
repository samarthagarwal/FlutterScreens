import "package:flutter/material.dart";

class LoginScreen6 extends StatefulWidget {
  final void Function() onLoginClick;
  final void Function() navigatePage;
  LoginScreen6({
    required this.onLoginClick,
    required this.navigatePage,
  });
  @override
  _LoginScreen6State createState() => _LoginScreen6State();
}

class _LoginScreen6State extends State<LoginScreen6> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background_image_one_signin.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40, right: 8, top: 155),
                  child: Text(
                    "Welcome\nBack",
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: MediaQuery.of(context).size.height * 0.24),
                    width: double.infinity,
                    child: TextField(
                      controller: emailController,
                      style: TextStyle(color: Color.fromRGBO(41, 41, 41, 1)),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Color.fromRGBO(121, 121, 121, 1)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    width: double.infinity,
                    child: TextField(
                      controller: passwordController,
                      style: TextStyle(color: Color.fromRGBO(41, 41, 41, 1)),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Color.fromRGBO(121, 121, 121, 1)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 120),
                        child: ClipOval(
                          child: Material(
                            color: Color.fromRGBO(78, 82, 91, 1),
                            child: InkWell(
                              child: SizedBox(
                                width: 56,
                                height: 56,
                                child: Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: widget.onLoginClick,
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.014),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: TextButton(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: widget.navigatePage,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
