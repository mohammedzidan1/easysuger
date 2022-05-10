import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  static bool get isLogin => auth.currentUser != null;

  static FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> register(String? email, String? password) async {
    try {
      print('register email$email');
      print('register password$password');

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      User? user = userCredential.user;
      // await user?.sendEmailVerification();
      print('user $user');
      // if (user != null) {
      //   this._userService.createUser(user);
      // }
      return user!;
    } on FirebaseAuthException catch (e) {
      print('register error ${e.toString()}');
      if (e.code == 'weak-password') {
        // Notifications.error(e.message);
      } else if (e.code == 'email-already-in-use') {
        // Notifications.error(e.message);
      }
    } catch (e) {
      print('register error ${e.toString()}');

      // Notifications.error(e.message);
    }
    return null!;
  }

  Future<User> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: "$email", password: password);
      User? user = userCredential.user;

      return user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        // Notifications.error('هذا البريد الالكتروني غير موجود');
      } else if (e.code == 'user-not-found') {
        // Notifications.error('هذا المستخدم غير موجود');
      } else if (e.code == 'wrong-password') {
        // Notifications.error('كلمة المرور غير صحيحة');
      } else if (e.code == 'user-disabled') {
        // Notifications.error(e.message);
      }
    } catch (e) {
      // Notifications.error(e.message);
    }
    return null!;
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  Future<User> loginOrCreateAccount(bool newAccount, String email,
      String password, BuildContext context) async {
    return newAccount ? signIn(email, password) : register(email, password);
  }

  /*void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;
      if (deepLink != null) {
        handleDynamicLink(deepLink);
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      handleDynamicLink(deepLink);
    }
  }

  handleDynamicLink(Uri deepLink) async {
    List<String> linkList = deepLink.toString().split('/');
    String id = linkList.last;

    Product product = await FirestoreModel.use<Product>().find(id);
    Modular.to.pushNamed(AppRoutes.product, arguments: product);
  }

  Future<String> createDynamicLink({
    String description,
    String imageUrl,
    String id,
  }) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://abosalla.page.link',
      link: Uri.parse('https://salla.com/$id'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.salla_app',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: 'Salla',
        description: description,
        imageUrl: imageUrl != null ? Uri.parse(imageUrl) : null,
      ),
    );

    final ShortDynamicLink dynamicUrl = await parameters.buildShortLink();
    return dynamicUrl.shortUrl.toString();
  }*/
}
