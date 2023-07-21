import 'package:advanced_icon/advanced_icon.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class ProductDetails extends StatefulWidget {
  int heroTag;
  String imgPath;
  String shoeName;
  var sizeList = ['40', '42', '44', '46'];

  ProductDetails(this.heroTag, this.imgPath, this.shoeName);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  AdvancedIconState _state = AdvancedIconState.primary;

  void _changeState(){
    if (_state == AdvancedIconState.primary) {
        
      setState(() {
        _state = AdvancedIconState.secondary;
      });

    } else {
      
      setState(() {
        _state == AdvancedIconState.primary;
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.heroTag,
        child:SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imgPath), 
                fit: BoxFit.cover
              ),
            ),
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.6, 1],
                    colors: [
                      Colors.transparent,
                      Colors.black
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.white,
                            splashRadius:20,
                            onPressed: (){
                              Get.back();
                            },
                          )
                        ),
                        GestureDetector(
                          onTap: _changeState,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Center(
                              child: AdvancedIcon(
                                icon: Icons.favorite_border_rounded,
                                color: Colors.black,
                                secondaryColor: Colors.red[200],
                                secondaryIcon: Icons.favorite, 
                                size: 25, 
                                state: _state,
                                duration: const Duration(milliseconds: 250),
                                effect: AdvancedIconEffect.bubble,
                              )
                            )
                          )
                        )
                      ],
                    ),
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DelayedDisplay(
                          delay: const Duration(milliseconds: 250),
                          child: Text('${widget.shoeName}', style: GoogleFonts.rubik(
                            fontSize: 47,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: 1
                          ), overflow: TextOverflow.ellipsis,),
                        ),
                        
                        const SizedBox(height:20),
                        
                        const DelayedDisplay(
                          delay: Duration(milliseconds: 250),
                          child: Text('Size', style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            letterSpacing: 1
                          )),
                        ),

                        const SizedBox(height:10),

                        DelayedDisplay(
                          delay: const Duration(milliseconds: 250),
                          child: GroupButton(
                            buttonWidth: 40.0,
                            buttonHeight: 40.0,
                            spacing: 25.0,
                            borderRadius: BorderRadius.circular(10),
                            buttons: widget.sizeList, 
                            isRadio: true,
                            selectedButton: 1,
                            selectedColor: Colors.white,
                            selectedTextStyle: const TextStyle(color: Colors.black),
                            unselectedColor: Colors.transparent,
                            unselectedTextStyle: const TextStyle(color: Colors.white),
                            direction: Axis.horizontal,
                            onSelected: (i, isSelected){

                              Fluttertoast.showToast(msg: '${widget.sizeList[i]}');
                              
                            },
                          )
                        ),
                        
                        const SizedBox(height: 40),
                        
                        DelayedDisplay(
                          delay: const Duration(milliseconds: 250),
                          child:Material(
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: (){
                                Fluttertoast.showToast(msg: 'Buying');
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                                ),
                                child: Center(
                                  child: Text('Buy Now', style: GoogleFonts.rubik(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ))
                                )
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                    
                  ],
                )
              )
            )
          )
        )
      )
    );
  }
}