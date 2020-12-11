import 'package:app_luca_cinti/states/stato_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaginaLogin extends StatefulWidget {
  @override
  _PaginaLoginState createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          /*Image.asset(
            'login_background.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft,
          ),*/ //TODO
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
                          icon: Icon(Icons.person),
                          labelText: 'Username'
                      ),
                      validator: (input) {
                        return (input.contains('@') ? null : 'Immetti un indirizzo e-mail');
                      },
                      autovalidateMode: AutovalidateMode.disabled,
                    ),
                    TextFormField(
                      controller: _ctrlPassword,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: 'Password'
                      ),
                      obscureText: true,
                    ),
                    Text(''),
                    Builder(
                      builder: (context) {
                        return ElevatedButton(
                          onPressed: () async {
                            if(Form.of(context).validate()) {
                              context.read<StatoLogin>().login(
                                      _ctrlUsername.value.text,
                                      _ctrlPassword.value.text,
                              );

                              /*final prefs = await SharedPreferences.getInstance();
                              await prefs.setString('myLogin', _ctrlUsername.value.text);

                              final secStorage = FlutterSecureStorage();
                              await secStorage.write(key: 'myPassword', value: _ctrlPassword.value.text);*/
                            }
                          },
                          child: Text('Login'),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  TextEditingController _ctrlUsername, _ctrlPassword;

  @override
  void initState() {
    super.initState();
    _ctrlUsername = TextEditingController();
    _ctrlPassword = TextEditingController();

    //initStateAsync();
  }

  /*Future initStateAsync() async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('myLogin')) {
      _ctrlUsername.text = prefs.getString('myLogin');
    }

    final secStorage = FlutterSecureStorage();
    final prevPassword = await secStorage.read(key: 'myPassword');
    if(prevPassword != null) {
      _ctrlPassword.text = prevPassword;
    }
  }*/

  @override
  void dispose() {
    super.dispose();
    _ctrlUsername.dispose();
    _ctrlPassword.dispose();
  }
}
