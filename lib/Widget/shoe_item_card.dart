import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoe_eshop_ui/Page/product_details.dart';
import 'package:advanced_icon/advanced_icon.dart';

class ShoeItemCard extends StatefulWidget {
  final id;
  final imgPath;
  final shoeName;
  final shoeBrand;
  final shoePrice;

  ShoeItemCard(this.id, this.imgPath, this.shoeName, this.shoeBrand, this.shoePrice);

  @override
  _ShoeItemCardState createState() => _ShoeItemCardState();
}

class _ShoeItemCardState extends State<ShoeItemCard> {

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
    return GestureDetector(
      onTap: (){
        Get.to(ProductDetails(widget.id, widget.imgPath, widget.shoeName));
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Hero(
          tag: widget.id,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(widget.imgPath),
                fit: BoxFit.cover
              ),
              boxShadow: const[
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0,2.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.8
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DelayedDisplay(
                            delay: const Duration(milliseconds: 250),
                            child: Text('${widget.shoeName}', style: GoogleFonts.rubik(
                              fontSize: 27,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: 1
                            )),
                          ),

                          GestureDetector(
                            onTap: _changeState,
                            child: Container(
                              width: 30,
                              height: 30,
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
                                  size: 20, 
                                  state: _state,
                                  duration: const Duration(milliseconds: 250),
                                  effect: AdvancedIconEffect.bubble,
                                )
                              )
                            )
                          )
                          
                        ],
                      ),
                        const SizedBox(height:10),
                      
                      DelayedDisplay(
                        delay: const Duration(milliseconds: 250),
                        child: Text('${widget.shoeBrand}', style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          letterSpacing: 1
                        ))
                      )
                    ]
                  ),
                  
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 250),
                    child: Text('${widget.shoePrice}\$', style: GoogleFonts.rubik(
                      fontSize: 32,
                      color: Colors.white
                    ))
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}