import 'package:flutter/material.dart';
import 'package:rentacar/drawer.dart';

enum Select { signIn, register }
enum RegisterDetail { personal, company }
Color personalColor = Colors.orange;
Color companyColor = Colors.grey;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Select selected = Select.signIn;
  bool? checkBoxSelected = false;
  bool register = false;
  RegisterDetail? _register = RegisterDetail.personal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F8),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Rent A Car',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          chooseRegisterSignIn(),
          if (!register)
            loginField()
          else
            registerField()
        ],
      ),
      drawer: buildDrawer(context),
    );
  }

  Container loginField() {
    return Container(
      width: 350,
      height: 360,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE3E2E2),
          strokeAlign: BorderSide.strokeAlignInside,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right:20, top: 30),
        child: Column(
          children: [
            usernameField(),
            const SizedBox(height:10),
            passwordField(),
            rememberMe(),
            const SizedBox(height: 10),
            SizedBox(
              width: 320,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container registerField() {
    return Container(
      width: 350,
      height: 500,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFFE3E2E2),
            strokeAlign: BorderSide.strokeAlignInside,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right:20, top: 30),
        child: Column(
          children: [
            personalCompany(),
            SizedBox(height: 20),
            SizedBox(
              width: 320,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row personalCompany() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                activeColor: Colors.orange,
                value: RegisterDetail.personal,
                groupValue: _register,
                onChanged: (value) {
                  setState(() {
                    _register = value;
                    _registerDetailColor();
                  });
                },
              ),
              Text(
                'Personal',
                style: TextStyle(
                  fontSize: 18,
                  color: personalColor,
                ),
              ),
              Radio(
                activeColor: Colors.orange,
                value: RegisterDetail.company,
                groupValue: _register,
                onChanged: (value) {
                  setState(() {
                    _register = value;
                    _registerDetailColor();
                  });
                },
              ),
              Text(
                'Company',
                style: TextStyle(
                  fontSize: 18,
                  color: companyColor,
                ),
              ),
            ],
          );
  }

  TextFormField passwordField() {
    return TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              label: Text('Password'),
            ),
          );
  }

  TextFormField usernameField() {
    return TextFormField(
            decoration: const InputDecoration(
              label: Text('Username'),
            ),
          );
  }

  Padding rememberMe() {
    return Padding(
            padding: const EdgeInsets.only(right: 105),
            child: CheckboxListTile(
              activeColor: Colors.orange,
              title: const Text('Remember me?'),
              value: checkBoxSelected,
              onChanged: (bool? newValue){
                setState(() {
                  checkBoxSelected = newValue;
                });
              }
            ),
          );
  }

  Row chooseRegisterSignIn() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 50,
              child: SegmentedButton(
                style: ButtonStyle(
                  textStyle: const MaterialStatePropertyAll<TextStyle>(
                    TextStyle(
                      fontSize: 18,
                    )
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.red)
                    ),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states){
                    return states.contains(MaterialState.selected)
                        ? Colors.orange
                        : Colors.white;
                  },
                  ),
                ),
                showSelectedIcon: false,
                segments: const [
                  ButtonSegment(
                    value: Select.signIn,
                    label: Text('Sign In'),
                  ),
                  ButtonSegment(
                    value: Select.register,
                    label: Text('Register'),
                  ),
                ],
                selected: <Select>{selected},
                onSelectionChanged: (Set<Select> newSelection) {
                  setState(() {
                    selected = newSelection.first;
                    register = !register;
                  });
                },
              ),
            ),
          ],
        );
  }

  void _registerDetailColor() {
    if(_register == RegisterDetail.personal){
      personalColor = Colors.orange;
      companyColor = Colors.grey;
    }
    else {
      personalColor = Colors.grey;
      companyColor = Colors.orange;
    }
  }
}
