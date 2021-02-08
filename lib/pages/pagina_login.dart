import 'package:app_luca_cinti/states/stato_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class PaginaLogin extends StatefulWidget {
  @override
  _PaginaLoginState createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait)
          return Scaffold(
            appBar: AppBar(
              title: Text('Login'),
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/sfondoLogin.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
                Center(
                  child: Form(
                    child: Container(
                      color: Colors.white,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: _ctrlUsername,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person), labelText: 'Username'),
                            validator: (input) {
                              return (input.isNotEmpty
                                  ? null
                                  : 'Inserire lo username');
                            },
                            autovalidateMode: AutovalidateMode.disabled,
                          ),
                          TextFormField(
                            controller: _ctrlPassword,
                            decoration: InputDecoration(
                                icon: Icon(Icons.lock), labelText: 'Password'),
                            validator: (input) {
                              return (input.isNotEmpty
                                  ? null
                                  : 'Inserire la password');
                            },
                            obscureText: true,
                          ),
                          Text(''),
                          Builder(
                            builder: (context) {
                              return Consumer<StatoLogin>(
                                  builder: (context, value, child) {
                                    if (value.errore) {
                                      SchedulerBinding.instance.addPostFrameCallback((_) {
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Username o Password errate!'),
                                          ),
                                        );
                                      });
                                    }
                                    return ElevatedButton(
                                      onPressed: () async {
                                        if (Form.of(context).validate()) {
                                          context.read<StatoLogin>().login(
                                            _ctrlUsername.value.text,
                                            _ctrlPassword.value.text,
                                          );
                                        }
                                      },
                                      child: Text('Login'),
                                    );
                                  });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        else
         return Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/sfondoLogin.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
                Center(
                  child: Form(
                    child: Container(
                      color: Colors.white,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _ctrlUsername,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person), labelText: 'Username'),
                              validator: (input) {
                                return (input.isNotEmpty
                                    ? null
                                    : 'Inserire lo username');
                              },
                              autovalidateMode: AutovalidateMode.disabled,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _ctrlPassword,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.lock), labelText: 'Password'),
                              validator: (input) {
                                return (input.isNotEmpty
                                    ? null
                                    : 'Inserire la password');
                              },
                              obscureText: true,
                            ),
                          ),
                          Text(''),
                          Builder(
                            builder: (context) {
                              return Consumer<StatoLogin>(
                                  builder: (context, value, child) {
                                    if (value.errore) {
                                      SchedulerBinding.instance.addPostFrameCallback((_) {
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Username o Password errate!'),
                                          ),
                                        );
                                      });
                                    }
                                    return ElevatedButton(
                                      onPressed: () async {
                                        if (Form.of(context).validate()) {
                                          context.read<StatoLogin>().login(
                                            _ctrlUsername.value.text,
                                            _ctrlPassword.value.text,
                                          );
                                        }
                                      },
                                      child: Text('Login'),
                                    );
                                  });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
      }
    );
  }

  TextEditingController _ctrlUsername, _ctrlPassword;

  @override
  void initState() {
    super.initState();
    _ctrlUsername = TextEditingController();
    _ctrlPassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _ctrlUsername.dispose();
    _ctrlPassword.dispose();
  }
}
