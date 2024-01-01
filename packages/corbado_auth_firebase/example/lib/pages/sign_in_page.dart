import 'package:corbado_auth_firebase/corbado_auth_firebase.dart';
import 'package:example/auth_provider.dart';
import 'package:example/auth_service.dart';
import 'package:example/pages/base_page.dart';
import 'package:example/router.dart';
import 'package:example/widgets/filled_text_button.dart';
import 'package:example/widgets/outlined_text_button.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookConsumerWidget {
  SignInPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = useState<String?>(null);
    final loading = useState<bool>(false);
    final usePasskeys = useState<bool>(true);
    final authService = ref.watch(authServiceProvider);

    return BasePage(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              'Tired of passwords?',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Sign in using your biometrics like fingerprint or face.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: TextField(
              autofillHints: [_getAutofillHint()],
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'email address',
              ),
            ),
          ),
          usePasskeys.value
              ? Container()
              : Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'password',
              ),
            ),
          ),
          error.value != null
              ? Text(
                  error.value!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                )
              : Container(),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledTextButton(
              onTap: () async {
                if (usePasskeys.value) {
                  try {
                    loading.value = true;
                    final email = _emailController.value.text;
                    await authService.signIn(email: email);
                  } on UnknownUserException {
                    loading.value = false;
                    usePasskeys.value = false;
                  } catch (error) {
                    loading.value = false;
                    debugPrint('error: $error');
                  }
                } else {
                  try {
                    loading.value = true;
                    final email = _emailController.value.text;
                    final password = _passwordController.value.text;
                    await authService.signInWithEmailAndPassword(email, password);
                  } catch (error) {
                    loading.value = false;
                    debugPrint('error: $error');
                  }
                }
              },
              isLoading: loading.value,
              content: 'sign in',
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedTextButton(
              onTap: () => context.go(Routes.signUp),
              content: 'I want to create a new account',
            ),
          ),
        ],
      ),
    ));
  }

  String _getAutofillHint() {
    if (kIsWeb) {
      return 'webauthn';
    } else {
      return AutofillHints.username;
    }
  }
}
