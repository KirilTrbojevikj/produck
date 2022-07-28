import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:produck/resources/auth_methods.dart';
import 'package:produck/utils/utils.dart';

import '../utils/colors.dart';
import '../widgets/text_field_input.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }
  void selectImage() async{
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }
  void signUpUser() async {
    setState((){
      _isLoading =true;
    });
      String res = await AuthMethods().signUpUser(email: _emailController.text,
          password: _passwordController.text,
          username: _usernameController.text,
          bio: _bioController.text,
          file: _image!
      );
    setState((){
      _isLoading =false;
    });
      if ( res != 'success'){
        showSnackBar(res, context);
      }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              SvgPicture.asset('assets/produck-logo.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                  height: 64
              ),
              Stack(
                children: [
                  _image!=null ? CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image!),
                  )
                  : const CircleAvatar(
                    radius: 64,
                      backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                  ),
                  ),
                ],
              ),
              const SizedBox(
                  height: 64
              ),
              TextFieldInput(hitText: 'Enter your username',
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(hitText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(hitText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(hitText: 'Enter your bio',
                textInputType: TextInputType.text,
                textEditingController: _bioController,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: signUpUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12,),
                  decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)
                    ),
                  ),
                    color: blueColor,
                  ),
                  child: _isLoading ? const Center( child: CircularProgressIndicator(
                    color: primaryColor,
                  ),) : const Text('Sign up'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(flex: 2, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: const Text("Already have an account?"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text("Log in", style: TextStyle(fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
