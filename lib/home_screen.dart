import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({super.key});
  static const String id = 'home_screen';
  const HomeScreen({Key? key}): super(key : key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar:AppBar(
            title: const Text('WhatsApp'),
            bottom:const TabBar(
              tabs: [
                Tab(
                  child: Icon(Icons.camera_alt),
                ),
                Tab(
                  child: Text('Chats'),
                ),
                Tab(
                  child: Text('Status'),
                ),
                Tab(
                  child: Text('Calls'),
                ),
              ],
            ),
            actions: [
              const Icon(Icons.search),
              const SizedBox(width: 5),
              PopupMenuButton(
                icon: const Icon(Icons.more_horiz_outlined),
                itemBuilder:(context)=>[
                  const PopupMenuItem(
                    value: '1',
                    child: Text('New Group'),
                  ),
                  const PopupMenuItem(
                    value: '2',
                    child: Text('Settings'),
                  ),
                  const PopupMenuItem(
                    value: '3',
                    child: Text('Logout'),
                  )
                ],
              ),
              const SizedBox(width: 15),
            ],
          ),
          body: TabBarView(
            children: [
              const Center(
                  child: Text('Camera is in Under Construction',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              ListView.builder(
                itemCount: 20,
                itemBuilder: (context,index) {
                  //CHATS
                  return const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/image.jpg'),
                    ),
                    title: Text('M.Mohid'),
                    subtitle: Text('Doing great work'),
                    trailing: Text('11:55 pm'),
                  );
                },
              ),

              //STATUS
              ListView.builder(

                itemCount: 20,
                itemBuilder: (context,index)
                {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text('Status'),
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.teal,
                                width: 3,
                              )
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/image.jpg'),
                          ),
                        ),
                        title: Text('M.Mohid'),
                        subtitle: Text('60 min ago'),
                      ),
                    ],
                  );
                },
              ),

              //CALLS
              ListView.builder(
                itemCount: 20,
                itemBuilder: (context,index) {
                  return  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/image.jpg'),
                    ),
                    title: Text('M.Mohid'),
                    subtitle: Text(index /2 ==0 ?'Missed audio call' : 'missed video call'),
                    trailing: Icon(index /2 ==0 ?Icons.phone_missed : Icons.missed_video_call,color: Colors.redAccent),
                  );
                },
              ),
            ],
          ),
        )
    );
  }
}
