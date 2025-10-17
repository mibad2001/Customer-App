
import 'package:customer/View/Deshboard/Widget/osm.dart';
import 'package:customer/View/Widgets/all_text.dart';
import 'package:customer/View/Widgets/color.dart';
import 'package:flutter/material.dart';


class Aboutscreen extends StatelessWidget {
  const Aboutscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.background,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.all(Radius.circular(7))
                          ),
                          height: 40,
                          width: 40,
                          child: IconButton(onPressed: (){},
                              icon: Icon(Icons.menu, size: 25, color: Colors.white,))
                      ),

                    ),
                    SizedBox(width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.26),

                    Text(CustomText.About, style: TextStyle(
                        fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),)
                  ],
                ),
              SizedBox(height: 15,),
          
              Text("CRMILES",
                style: TextStyle(
                  fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              //==================================  address
              Container(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Icon(Icons.location_on_rounded, size:20 , color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        "1 MANSOR ROAD, HASTINGSEAST SECESSEX TN34 3LL",
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              //=====================================buttons call and email
              Container(
                height: 50,
                child:  Row(
                  children: [
                    SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.7
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.call,size: 20,color: Colors.black,)),
                    ),
                    SizedBox(width: 5,),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child:IconButton(onPressed: (){}, icon:  Icon(Icons.email,size: 20,color: Colors.black,)),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10
                ,),

              //============================================   map
              Container(
                height:600,
                child: OpenStreetMapWidget(),
              ),




            ],
          ),
        ),
        
      ),
    );
  }
}
