import 'package:firebase_demo/home.dart';
import 'package:firebase_demo/register.dart';
import 'package:firebase_demo/reset.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading=false;
  bool _isLoadingForgetP=false;
  bool _isLoadingReg=false;
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPass = GlobalKey<FormState>();
  bool _isObsecure = true;
  String admin='vornrathanak7366@gmail.com';
  TextEditingController txtemail=TextEditingController();
  TextEditingController txtpass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
          child: SingleChildScrollView(
            child: Center(
                child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                //Logo
                Icon(Icons.account_balance_outlined,
                    size: 150, color: Colors.blue[600]),
                Divider(
                    height: 20,
                    thickness: 1,
                    indent: 45,
                    endIndent: 45,
                    color: Colors.blue[600]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    children: [
                      Form(
                        key: _formKeyEmail,
                        child: TextFormField(
                          controller: txtemail,
                          //decore form
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            prefixIcon: Icon(Icons.email_outlined,
                                color: Colors.blue[600]),
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
                        key: _formKeyPass,
                        child: TextFormField(
                          controller: txtpass,
                          //decore form
                          obscureText: _isObsecure,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            prefixIcon: Icon(Icons.email_outlined,
                                color: Colors.blue[600]),
                            suffixIcon: IconButton(
                                icon: _isObsecure
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObsecure = !_isObsecure;
                                  });
                                }),
                            hintText: 'Input Password',
                            labelText: 'Security Code',
                            hintStyle: TextStyle(color: Colors.blue[600]),
                          ),
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () async{
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKeyEmail.currentState!.validate() &&
                          _formKeyPass.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                         ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data'),duration:Duration(seconds: 1),),
                        );
                        setState((){
                          _isLoading=true;
                        });
                        await Future.delayed(const Duration(seconds: 2));
                        setState(() {
                          _isLoading=false;
                        });
                        if(txtemail.text==admin&&txtpass.text=='P@ssw0rd'){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Logged In'))
                          );
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Credential Error'))
                          );
                        }
                      }
                    },
                    child: _isLoading?Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(color: Colors.white,),
                        SizedBox(width: 15,),
                        Text('Please wait...')
                      ],
                      )
                    :const Text('SIGN IN'),
                  ),
                ),
                TextButton(
                  onPressed: () async{
                    setState(() {
                      _isLoadingForgetP=true;
                    });
                    await Future.delayed(const Duration(seconds: 1));
                    setState(() {
                      _isLoadingForgetP=false;
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Reset(),));
                  },
                  child: _isLoadingForgetP?CircularProgressIndicator(color: Colors.blue[600],):const Text('FORGOT PASSWORD?'),
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
                const Text('Do not have account?'),
                TextButton(
                  onPressed: () async{
                    setState(() {
                      _isLoadingReg=true;
                    });
                    await Future.delayed(const Duration(seconds: 1));
                    setState(() {
                      _isLoadingReg=false;
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Register(),));
                  },
                  child: _isLoadingReg?CircularProgressIndicator(color: Colors.blue[600],):const Text('REGISTER'),
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
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
