import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../res/constants/text_constants.dart';

import '../../model/unattended_model.dart';

class UnatendedWidget extends StatelessWidget {
  const UnatendedWidget({super.key, required this.shift, required this.showRequestButton});

  final UnattendedShift shift;
  final bool showRequestButton;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 237,
      width: MediaQuery.of(context).size.width * 0.9,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 148,
                width:  MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: TextConstants.fromHex('#F3F6FA'),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: preCardGradientView(false,shift,context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(
                      "€${shift.hourlyRate}/hr ",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [


                        const Text(
                          " Total: 6 Hrs ",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                        Icon(Icons.circle,
                            color: Colors.grey.withOpacity(0.5), size: 6),
                        const Text(
                          " €8.99/hr",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 99,
                  height: 38,
                  decoration: BoxDecoration(
                      color: TextConstants.fromHex('#2DBB7E'),
                      borderRadius: BorderRadius.circular(8)),
                  child:  Center(
                    child: Text(
                      " Confirm ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:  Colors.white  ),                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),



        ],
      ),
    );
  }
  static Widget preCardGradientView(bool showRequestButton, UnattendedShift shift,context) {
    final timeFormat = DateFormat.jm();
    return Container(
      decoration: BoxDecoration(
        gradient: showRequestButton ? TextConstants.linearGradientFromHex(
          ['#3D3C43', '#4C4953', '#65626D', '#2F2E34'],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          opacity: 0.9,
        ) : TextConstants.linearGradientFromHex(
          ['#F5E1FA','#FFF2C5','#E65656'],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          opacity:0.7,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 15),
                        child: Container(
                          width: 98,
                          height: 27.11,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "06 AUG TUE",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 100,),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 15),
                        child: SizedBox(
                          width: 98,
                          height: 27.11,
                          child: showRequestButton ?  Text("#XP126217",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white),) :Text("#XP126217",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 15),
                    child: Text(
                      "${shift.client}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: showRequestButton ? Colors.white : Colors.black),
                    ),
                  ),
                ],
              ),
              const Spacer(),

            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 13, bottom: 10),
            child: Row(
              children: [
                Icon(Icons.directions,   color: showRequestButton ? Colors.white : Colors.red),
                SizedBox(width: 5),
                Text(
                  "${(shift.distance / 1000).toStringAsFixed(2)} km",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: showRequestButton ? Colors.white : Colors.black),                ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02, // 2% of screen width
              ),
                Icon(Icons.access_time_filled_sharp,   color: showRequestButton ? Colors.white : Colors.red),
                SizedBox(width: 5),
                Text(
                  " ${shift.startTime} -${shift.endTime}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: showRequestButton ? Colors.white : Colors.black),                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  }

