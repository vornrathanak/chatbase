import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKePass = GlobalKey<FormState>();
  bool _isLoadReg = false;
  bool _isLoadBack = false;
  bool _isObsecure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Logo
                Icon(Icons.account_balance_outlined,
                    size: 150, color: Colors.blue[600]),
                Divider(
                    height: 20,
                    thickness: 1,
                    indent: 45,
                    endIndent: 45,
                    color: Colors.blue[600]),
                Text('REGISTER WITH EMAIL ADDRESS',
                    style: TextStyle(color: Colors.blue[600])),
                const SizedBox(
                  height: 16,
                ),
                Form(
                  key: _formKeyEmail,
                  child: TextFormField(
                    //decore form
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      prefixIcon:
                          Icon(Icons.email_outlined, color: Colors.blue[600]),
                      hintText: 'Input Email Address',
                      labelText: 'Email',
                      hintStyle: TextStyle(color: Colors.blue[600]),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email address';
                      } else if (!value.contains('@gmail.com')) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Form(
                  key: _formKePass,
                  child: TextFormField(
                    obscureText: _isObsecure,
                    //decore form
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        prefixIcon: Icon(Icons.security_outlined,
                            color: Colors.blue[600]),
                        hintText: 'Enter passsword',
                        labelText: 'Security Code',
                        hintStyle: TextStyle(color: Colors.blue[600]),
                        suffixIcon: _isObsecure
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                  _isObsecure=!_isObsecure;
                                  });
                                },
                                icon: const Icon(Icons.visibility_off_outlined))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                  _isObsecure=!_isObsecure;
                                  });
                                },
                                icon:
                                    const Icon(Icons.visibility_outlined))),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      } else if (value.length < 6) {
                        return 'password too weak';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKeyEmail.currentState!.validate() &&
                          _formKePass.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')));
                        setState(() {
                          _isLoadReg = true;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        setState(() {
                          _isLoadReg = false;
                        });
                      }
                    },
                    child: _isLoadReg
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Please wait...")
                            ],
                          )
                        : const Text('REGISTER'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Divider(
                          height: 20,
                          thickness: 1,
                          indent: 40,
                          endIndent: 40,
                          color: Colors.blue[600]),
                    ),
                    const Text('OR'),
                    Expanded(
                      child: Divider(
                          height: 20,
                          thickness: 1,
                          indent: 40,
                          endIndent: 40,
                          color: Colors.blue[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text('Already have account?'),
                TextButton(
                  onPressed: () async {
                    setState(() {
                      _isLoadBack = true;
                    });
                    await Future.delayed(const Duration(seconds: 1));
                    setState(() {
                      _isLoadBack = false;
                    });
                    Navigator.pop(context);
                  },
                  child: _isLoadBack
                      ? CircularProgressIndicator(
                          color: Colors.blue[600],
                        )
                      : const Text('BACK TO LOGIN'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.facebook_outlined,
                      color: Colors.blue[600],
                    ),
                    Icon(
                      Icons.telegram_outlined,
                      color: Colors.blue[600],
                    ),
                    Icon(
                      Icons.tiktok_outlined,
                      color: Colors.blue[600],
                    ),
                    Icon(
                      Icons.email_outlined,
                      color: Colors.blue[600],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
