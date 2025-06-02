import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/constants/text_constants.dart';

import '../../model/withdraw_model.dart';



class WithdrawCardWidget extends StatelessWidget {
  const WithdrawCardWidget({super.key, required this.shift, required this.showRequestButton});

  final Shift shift;
  final bool showRequestButton;

  @override
  Widget build(BuildContext context) {
    late var isSelected = false;
    return Container(
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
                child: preCardGradientView(false,shift),
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
                          Text(
                          "${shift.client?.name} ",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                        Icon(Icons.circle,
                            color: Colors.grey.withOpacity(0.5), size: 6),
                          Text(
                          " €${shift.totalPayRate}/hr",
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
                Row(
                  children: [
                    Text(isSelected ? 'Selected' : 'Select', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                    Checkbox(
                      value: isSelected ? true : isSelected,
                      onChanged: (bool? value) {

                      },

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    )
                  ],
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),



        ],
      ),
    );
  }
  static Widget preCardGradientView(bool showRequestButton,Shift shift) {
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
                          child:  Align(
                            alignment: Alignment.center,
                            child: Text(
                              TextConstants.formatDate(shift.date),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 110,),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 15),
                        child: SizedBox(
                          width: 98,
                          height: 27.11,
                          child: showRequestButton ?  Text("${shift.shiftCode}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white),) :Text("#XP126217",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 15),
                    child: Text(
                      "${shift.client?.name}",
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
            padding: EdgeInsets.only(top: 5.0, left: 13),
            child: Text(
              "${shift.client?.address ?? "Harmony, Old Bundoran road,\nSilgo. F91YK80"}",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: showRequestButton ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
