import 'package:assignment/home.dart';
import 'package:assignment/main.dart';
import 'package:assignment/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // This widget is the root of your application.

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Add more email validation logic if required
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  // Add more password validation logic if required
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  'Forgot password ',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ]),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Perform sign-in logic here
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    print('Email: $email');
                    print('Password: $password');

                    //if successfully login
                    var sharepref = await SharedPreferences.getInstance();
                    sharepref.setBool(SplashScreenState.KEYLOGIN, true);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePageWidget()));
                  }
                },
                child: Text('Sign In'),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not Register ! Sign Up here.',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:assignment/databasehelper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:assignment/database_helper.dart';

// class SignInFormBloc extends FormBloc<String, String> {
//   final email = TextFieldBloc(
//     validators: [FieldBlocValidators.email],
//   );

//   final password = TextFieldBloc(
//     validators: [FieldBlocValidators.required],
//   );

//   @override
//   List<FieldBloc> get fieldBlocs => [email, password];

//   @override
//   Stream<FormBlocState<String, String>> onSubmitting() async* {
//     final emailValue = email.value;
//     final passwordValue = password.value;

//     // Get user data from local database
//     final db = DatabaseHelper();
//     final userData = await db.getUserByEmail(emailValue);

//     if (userData == null || userData['password'] != passwordValue) {
//       // yield currentState.toFailure('Invalid email or password');
//     } else {
//       // yield currentState.toSuccess('Logged in successfully');
//     }
//   }
// }

// class SignInPage extends StatefulWidget {
//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In'),
//       ),
//       body: BlocProvider(
//         create: (context) => SignInFormBloc(),
//         child: Builder(
//           builder: (context) {
//             return FormBlocListener<SignInFormBloc, String, String>(
//               onSuccess: (context, state) {
//                 // Navigate to the dashboard after successful sign-in
//                 Navigator.pushReplacementNamed(context, '/dashboard');
//               },
//               onFailure: (context, state) {
//                 // Show an error message
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text(state.failureResponse!)),
//                 );
//               },
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextFieldBlocBuilder(
//                       textFieldBloc: SignInFormBloc().email,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         prefixIcon: Icon(Icons.email),
//                       ),
//                     ),
//                     SizedBox(height: 16.0),
//                     TextFieldBlocBuilder(
//                       textFieldBloc: SignInFormBloc().password,
//                       suffixButton: SuffixButton.obscureText,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         prefixIcon: Icon(Icons.lock),
//                       ),
//                     ),
//                     SizedBox(height: 24.0),
//                     ElevatedButton(
//                       onPressed: SignInFormBloc().submit,
//                       child: Text('Sign In'),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
