
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../res/constants/text_constants.dart';
import 'package:dotted_line/dotted_line.dart';
import '../../model/submit_model.dart';


class SubmitedCardWidget extends StatelessWidget {
  const SubmitedCardWidget({
    super.key,
    required this.shift,
    required this.showRequestButton,
  });

  final SubmittedShift shift;
  final bool showRequestButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 246,
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
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: TextConstants.fromHex('#F3F6FA'),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: preCardGradientView(showRequestButton),
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
                      "€${shift.hourlyRate.toStringAsFixed(2)}/hr ",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Text(
                          " Total: ${shift.totalWorkedHours.toStringAsFixed(1)} Hrs ",
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                        Icon(Icons.circle,
                            color: Colors.grey.withOpacity(0.5), size: 6),
                        Text(
                          " €${(shift.totalPayRate / shift.totalWorkedHours).toStringAsFixed(2)}/hr",
                          style: const TextStyle(
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
                  child: const Center(
                    child: Text(
                      "View Details",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: DottedLine(
              dashLength: 4.0,
              lineLength: MediaQuery.of(context).size.width * 0.8,
              dashColor: Colors.grey.withOpacity(0.5),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 3),
                child: SizedBox(
                  height: 16,
                  width: 18,
                  child: Image.asset('assets/images/icons/exclament.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 3),
                child: Text("Payment will be credited by ${shift.expectedDate}"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget preCardGradientView(bool showRequestButton) {
    return Container(
      decoration: BoxDecoration(
        gradient: showRequestButton
            ? TextConstants.linearGradientFromHex(
          ['#3D3C43', '#4C4953', '#65626D', '#2F2E34'],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          opacity: 0.9,
        )
            : TextConstants.linearGradientFromHex(
          ['#F5E1FA', '#FFF2C5', '#E65656'],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          opacity: 0.7,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15),
                    child: Container(
                      width: 98,
                      height: 27.11,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          TextConstants.formatDate(shift.date), // now accessible
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 15),
                    child: Text(
                      shift.clientName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: showRequestButton ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 15),
                child: SizedBox(
                  width: 98,
                  height: 27.11,
                  child: showRequestButton
                      ? Text(
                    shift.shiftCode,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white),
                  )
                      : Text(
                    shift.shiftCode,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 13),
            child: Text(
              shift.address ?? 'No Address',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: showRequestButton ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
