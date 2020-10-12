import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_kotha/Bloc/authbloc.dart';
import 'package:mero_kotha/widgets/customAppbar.dart';
import 'package:mero_kotha/widgets/customDrawer.dart';

import '../conf.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
      ),
      child: Scaffold(
        drawer: CustomDrawer(),
        key: _key,
        appBar: MyAppbar(
          preferredSize: Size.fromHeight(60.0),
          scaffoldKey: _key,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              color: baseColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 300.0,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      controller: _nameController,
                      validator: (name) {
                        return name.length == 0 ? "Name is required" : null;
                      },
                      decoration: new InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Name"),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 300.0,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      controller: _emailController,
                      validator: (email) =>
                          email.length == 0 ? "Email is required" : null,
                      keyboardType: TextInputType.emailAddress,
                      decoration: new InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Enter your Email"),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 300.0,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      controller: _passwordController,
                      validator: (password) {
                        if (password.length > 5) {
                          return null;
                        }
                        return "Passord must be atleast 6 characters long";
                      },
                      obscureText: true,
                      decoration: new InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Password"),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 300.0,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      controller: _phoneController,
                      obscureText: true,
                      decoration: new InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Phone Number"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<AuthBloc, AuthStates>(
                      listener: (context, state) {
                    Scaffold.of(context).hideCurrentSnackBar();
                    if (state is AuthTryingState) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Trying.."),
                      ));
                    } else if (state is AuthRegisterSucessState) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Register complete"),
                        backgroundColor: Colors.green,
                      ));
                    } else if (state is AuthFailedState) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(state.errorMessage),
                        backgroundColor: Colors.redAccent,
                      ));
                    }
                  }, builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                              AuthRegisterEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  name: _nameController.text));
                        }
                      },
                      child: ClayContainer(
                        height: 50,
                        width: 300,
                        curveType: CurveType.none,
                        color: baseColor,
                        child: Center(
                          child: Text("Create",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                        ),
                        borderRadius: 10.0,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
