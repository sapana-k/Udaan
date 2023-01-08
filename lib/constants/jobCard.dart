import 'package:flutter/material.dart';
import 'package:udaan/screens/profile.dart';
import 'package:udaan/screens/food.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
    required this.workMode,
    required this.jobName,
    required this.salary,
    required this.address,
    required this.jobDescription,
  }) : super(key: key);

  final String workMode;
  final String jobName;
  final int salary;
  final String address;
  final String jobDescription;
  //int jobno = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Image.asset('images/17.png'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey.shade700,
                            size: 18.0,
                          ),
                          Text('$workMode',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.currency_rupee,
                            color: Colors.grey.shade700,
                            size: 18.0,
                          ),
                          Text('$salary',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('$jobName',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Address - $address',
                    textAlign: TextAlign.left,
                    // style: TextStyle(
                    //     fontSize: 15.0,
                    //     fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    'Job Description - $jobDescription',
                    textAlign: TextAlign.left,
                    // style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RawMaterialButton(
                //on pressed goes to
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                splashColor: Color(0xFFE8CBCB),
                fillColor: Color(0xFF830E38),
                child: Text(
                  'Apply Now',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, FoodPage.id);
                  //jobno++;
                }),
          )
        ],
      ),
    );
  }
}
