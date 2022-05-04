import 'package:e_comerce_app/presentation/BloCs/auth_bloc/auth_bloc.dart';

import 'package:e_comerce_app/presentation/screens/widgets/menu/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            onPressend: () => _logOut(context),
            text: "Log Out",
          ),
        ),
        body: Container(
          color: Colors.grey,
          child: const Center(
            child: Text("GirdViewWithItems"),
          ),
        ),
      ),
    );
  }

  void _logOut(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
  }
}
