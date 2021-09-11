import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAF0F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, spreadRadius: 0.5, blurRadius: 1.0)
                ]),
            child: Center(
              child: Image.asset(
                'assets/menu.png',
                height: 25.0,
                width: 25.0,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.network(
                        'https://images.unsplash.com/photo-1585675100414-add2e465a136?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80',
                      ).image,
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(13.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 0.5, blurRadius: 1.0)
                  ]),
            ),
          ),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff85AFEE),
                          blurRadius: 2.0,
                          offset: Offset(0.0, 2.0))
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff9FC5FC),
                          Color(0xff85AFEE),
                        ])),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Manage your\ntime well',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Image.asset(
                        'assets/Vector 2.png',
                        width: 100.0,
                        height: 80.0,
                      ),
                      Image.asset('assets/File.png'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Categories',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Row(
                children: [
                  Expanded(
                      child: TaskCard(
                    label: 'Work',
                  )),
                  Expanded(
                      child: TaskCard(
                    imageUrl: 'assets/Group 25.png',
                    label: 'Personal',
                  )),
                  Expanded(
                      child: TaskCard(
                    imageUrl: 'assets/Group 26.png',
                    label: 'Shopping',
                  )),
                  Expanded(
                      child: TaskCard(
                    imageUrl: 'assets/Group 33.png',
                    label: 'Health',
                  )),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'You have 10 tasks for today',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10.0,
              ),
              TaskContainer(),
              TaskContainer(),
              TaskContainer(),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheetCard(),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String? imageUrl;
  final String? label;
  const TaskCard({Key? key, this.imageUrl, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 2.0, spreadRadius: 0.5)
                ]),
            child: Center(
              child: Image.asset(
                imageUrl ?? 'assets/Group 32.png',
                height: 50.0,
                width: 50.0,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            label ?? '',
            style: TextStyle(fontSize: 18.0),
          )
        ],
      ),
    );
  }
}

class TaskContainer extends StatefulWidget {
  const TaskContainer({Key? key}) : super(key: key);

  @override
  _TaskContainerState createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskContainer> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isActive = !isActive;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blueAccent, width: 4.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive
                              ? Colors.blueAccent
                              : Colors.transparent),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Daily UI Challenge',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  decoration: isActive
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                '9:00 am',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xff85AFEE),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetCard extends StatelessWidget {
  const BottomSheetCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/bottomsheet.png'))),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/home.png',
                  height: 30.0,
                  width: 30.0,
                ),
                Image.asset(
                  'assets/calendar.png',
                  height: 30.0,
                  width: 30.0,
                ),
                Container(
                  height: 30.0,
                  width: 30.0,
                ),
                Image.asset(
                  'assets/file-text.png',
                  height: 30.0,
                  width: 30.0,
                ),
                Image.asset(
                  'assets/settings.png',
                  height: 30.0,
                  width: 30.0,
                ),
              ],
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff86B0EF),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 8.0))
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff9FC5FC),
                        Color(0xff85AFEE),
                      ]),
                ),
                child: Icon(
                  Icons.add,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
