import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validation/utils/testing.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  var name = '';
  var phone = '';
  var email = '';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            color: Colors.transparent,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: height * 0.04),
                  const Text(
                    "Here to Get",
                    style: TextStyle(fontSize: 30),
                  ),
                  const Text(
                    "Wellcome!",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: height * 0.05),
                  TextFormField(
                    controller: _textEditingController,
                    // initialValue: "My name",
                    decoration: InputDecoration(
                      labelText: "Enter your name",
                      suffixIcon: IconButton(
                          onPressed: _textEditingController.clear,
                          icon: const Icon(Icons.clear)),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textCapitalization: TextCapitalization.characters,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                      FilteringTextInputFormatter.deny(RegExp('[abFeG]')),
                    ],
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return "Enter correct name";
                      }

                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        name = value!;
                      });
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Your phone",
                      // hintText: "Enter your phone",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    // obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[+]*[(]{0,1}[0,9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                              .hasMatch(value)) {
                        return "Enter correct phone number";
                      }

                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        phone = value!;
                      });
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Enter your email:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(width: 0.5, style: BorderStyle.solid),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    key: TestingKey.loginEmail,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                              .hasMatch(value)) {
                        return "Enter correct email";
                      }

                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        email = value!;
                      });
                    },
                  ),
                  SizedBox(height: height * 0.05),
                  ElevatedButton(
                    child: const Text("Login"),
                    style: const ButtonStyle(),
                    onPressed: () {
                      formKey.currentState!.save();
                      print("Result: name=$name phone=$phone email=$email");

                      // FocusScope.of(context).unfocus();
                      // if (formKey.currentState!.validate()) {
                      //   //
                      // }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
