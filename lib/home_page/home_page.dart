import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3_api_bloc/bloc/companies_details_bloc.dart';

import 'components/bottom_nav_bar.dart';
import 'components/details_listview_widget.dart';
import 'components/topbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CompaniesDetailsBloc companiesInfoBloc = CompaniesDetailsBloc();

  @override
  void initState() {
    companiesInfoBloc.add(GetCompaniesData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => companiesInfoBloc,
          child: Column(
            children: const [
              TopbarWidget(), //appbar section
              DetailsListviewWidget(), //main listivew builder section
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBar(), //bottom nav bar
      ),
    );
  }
}
