import 'package:flutter/material.dart';

class Reset extends StatefulWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoadingReq = false;
  bool _isLoadingBack = false;
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
                Text('REQUEST CHANGE PASSWORD',
                    style: TextStyle(color: Colors.blue[600])),
                const SizedBox(
                  height: 16,
                ),
                Form(
                  key: _formKey,
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')));
                        setState(() {
                          _isLoadingReq = true;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        setState(() {
                          _isLoadingReq = false;
                        });
                      }
                    },
                    child: _isLoadingReq
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
                        : const Text('REQUEST CHANGE'),
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
                      _isLoadingBack = true;
                    });
                    await Future.delayed(const Duration(seconds: 1));
                    setState(() {
                      _isLoadingBack = false;
                    });
                    Navigator.pop(context);
                  },
                  child: _isLoadingBack
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
