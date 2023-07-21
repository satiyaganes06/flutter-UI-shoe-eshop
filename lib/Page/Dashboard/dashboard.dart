import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoe_eshop_ui/Database/database.dart';
import 'package:shoe_eshop_ui/Widget/shoeitem_listview.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({ Key? key }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> 
  with SingleTickerProviderStateMixin{

  var tabController;
  var database = Database();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoes', style: GoogleFonts.poppins(
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.w500,
          fontSize: 24
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions:[
          IconButton(
            onPressed: (){
              Fluttertoast.showToast(msg:'Notification');
            }, 
            splashRadius: 20,
            icon: const Icon(Icons.notifications_none_outlined),
            color: Colors.black,
          ),
            
          const SizedBox(width:10),
          
          IconButton(
            onPressed: (){
              Fluttertoast.showToast(msg:'Shop Cart');
            }, 
            splashRadius: 20,
            icon: const Icon(Icons.local_grocery_store),
            color: Colors.black,
          ),

          const SizedBox(width:10),
        ]
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.only(left:25, right:25),
              child: Container(
                color: Colors.transparent,
                height: 40,
                child: TabBar(
                  controller: tabController,
                  tabs: const [
                    Tab(child: Text('All')),
                    Tab(child: Text('Sneakers')),
                    Tab(child: Text('Football')),
                    Tab(child: Text('Soccer')),
                  ],
                  isScrollable: true,
                  labelColor: Colors.black,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle: GoogleFonts.poppins(
                    fontSize: 16
                  ),
                  indicator: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25)
                  ),
                ),
              )
            ),
            
            const SizedBox(height:10),

            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ShoeListView(database.allList),
                  ShoeListView(database.shoesListSneakers),
                  ShoeListView(database.shoesListFootball),
                  ShoeListView(database.shoesListSoccer)
                ],
              )
            )
            
          ]
        )
      )
      
    );
  }
}

