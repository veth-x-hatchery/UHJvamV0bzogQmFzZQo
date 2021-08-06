import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vethx_login/ui/widgets/login/form_sign_in.widget.dart';
import 'package:vethx_login/ui/widgets/login/form_email.widget.dart';
import 'package:vethx_login/ui/widgets/login/form_password.widget.dart';
import 'package:vethx_login/ui/widgets/shared/appbar.widget.dart';

enum EmailLoginPageIndex { email, password, signIn }

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({Key? key}) : super(key: key);

  @override
  _EmailLoginPageState createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: EmailLoginPageIndex.values.length,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scaffoldKey.currentState?.dispose();
    super.dispose();
  }

  void _goToTheNextPage(EmailLoginPageIndex delta) {
    _tabController.animateTo(
      delta.index,
      // curve: Curves.easeInOutQuad,
      // duration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: vethxAppBar(context),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          FormEmail(nextForm: (page) => _goToTheNextPage(page)),
          FormPassword(nextForm: (page) => _goToTheNextPage(page)),
          FormRegisterEmailSignIn(nextForm: (page) => _goToTheNextPage(page)),
        ],
      ),
    );
  }
}
