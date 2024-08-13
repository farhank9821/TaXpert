// import 'package:flutter/material.dart';

// class CustomCalcCard extends StatelessWidget {
//   String title;
//   Widget logo;
//   Widget destinationNavigate;
//   Color color;
//   CustomCalcCard({super.key, required this.title, required this.logo, required this.destinationNavigate, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 60,
//       width: double.infinity,
//       child: Material(
//         elevation: 8,
//         borderRadius: BorderRadius.circular(30),

//         child: Card(
//           color: Colors.greenAccent,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               logo,
//               SizedBox(
//                 height: double.infinity,
//                 width: 280,
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     elevation: MaterialStateProperty.all(0),
//                     backgroundColor: MaterialStateProperty.all(color),
//                   ),
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
//                       return destinationNavigate;
//                     }));
//                   },
//                   child: Text(
//                     title,
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomCalcCard extends StatelessWidget {
  final String title;
  final Widget logo;
  final Widget destinationNavigate;
  final Color color;

  CustomCalcCard({Key? key, required this.title, required this.logo, required this.destinationNavigate, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  logo,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                        return destinationNavigate;
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
