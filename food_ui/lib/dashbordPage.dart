import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  _ListItem(String foodName,String imgPath,String price,Color bgColor,Color color){
    return Padding(
      padding:  EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {
          //
        },
        child: Container(
          height: 175,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgColor,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: foodName, 
                  child:Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      color:  Colors.white,
                      shape: BoxShape.circle

                    ),
                    child: Center(
                      child: Image.asset(imgPath,height: 50,width: 50),
                    ), 
                  )
                   ),
                   SizedBox(height: 25)
              ],

          ),
        ),
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Icon(Icons.menu,color: Colors.black),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 6,
                              spreadRadius: 4,
                              offset: Offset(0,3),
                            )
                            ],
                            color: Color(0xFFC6E7FE),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/tuxedo.png'),
                              fit: BoxFit.contain
                            )
                          ),

                        )
                    ]
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Search for",
                    style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w800,fontSize: 27
                    ),
                  ),
                  
                  ),
                    Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "RECIPES",
                    style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w800,fontSize: 27
                    ),
                  ),
                  
                  ),
                  SizedBox(height: 25,),
                  Padding(
                      padding: EdgeInsets.only(left: 15,right: 15),
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "search",
                                  hintStyle: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w800,
                          fontSize: 14
                          ),
                          border: InputBorder.none,
                          fillColor: Colors.grey.withOpacity(0.5),
                          prefixIcon: Icon(Icons.search,color: Colors.grey)
                                
                              ),

                            ),
                      ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding:EdgeInsets.only(left: 15),
                    child:Text(
                      "Recommended",
                      style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                          ),
                    ) ,
                    ),
                const SizedBox(height: 15),
                Container(
                  height: 200,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                          _ListItem('Hamburger','assets/burger.png','21', Color(0xFFFFE9C6), Color(0xFFDA9551))

                      ],


                  ),
                )

              ],

          ),


    );
  }
}