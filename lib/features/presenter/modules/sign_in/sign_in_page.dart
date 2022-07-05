import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ong_animals/features/presenter/modules/sign_in/controller/sign_in_controller.dart';
import 'package:ong_animals/features/presenter/modules/sign_in/widgets/action_button_verify_email_widget.dart';

import 'widgets/alert_dialog_widget.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        width: maxWidth.w,
        height: maxHeight.h,
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 70,
                    left: 24.0,
                    right: 24.0,
                    bottom: 8.0,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 180.w,
                    height: 180.h,
                  ),
                ),
                Text(
                  'ONG Animal',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 56.0),
                TextFormField(
                  controller: controller.emailController,
                  validator: (email) => controller.emailValidator(email),
                  decoration: InputDecoration(
                    icon: const Icon(Icons.mail),
                    hintText: 'Type your E-mail',
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                const ActionButtonVerifyEmailWidget(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () => _showDialog(context),
                    child: const Text('Valid e-mail list'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialogWidget();
      },
    );
  }
}
