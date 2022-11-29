import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_four/screens/accout_information_screen.dart';
import 'package:task_four/screens/empty_screen.dart';
import 'package:task_four/services/web_services.dart';
import 'package:task_four/utils/colors.dart';
import 'package:task_four/utils/data.dart';
import 'package:task_four/utils/text_style.dart';

import '../widget/common_appbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    Future.microtask(() async => await _initAsync());
    super.initState();
  }

  var response;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: CommonAppBar(),
        ),
        body: ListDetails());
  }

  _initAsync() async {
    response = await WebAPIService().getToken();

    log(response.data['result']['user_verified'].toString());
  }
}

class ListDetails extends StatelessWidget {
  const ListDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dummydata.isEmpty
        ? EmptyScreen()
        : ListView.separated(
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountScreen()),
                    )),
                child: OneTile(
                  data: Dummydata[index],
                ),
              );
            }),
            separatorBuilder: ((context, index) {
              return const Divider(
                height: 5,
                color: colorFFBABABA,
              );
            }),
            itemCount: Dummydata.length);
  }
}

class OneTile extends StatelessWidget {
  final Map data;
  const OneTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Text(
          data['head'],
          style: tsS14C0xW700,
        ),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Text(
          data['sub'],
          style: tsS12C0xW400,
        ),
      ),
    );
  }
}
