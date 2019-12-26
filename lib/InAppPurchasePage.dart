import 'dart:async';
import 'dart:io';
import 'consumable_store.dart';

import 'data.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';


const bool kAutoConsume = true;
const String _kConsumableId = 'consumable';

class Purchase extends StatefulWidget {
  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  StreamSubscription _purchaseUpdatedSubscription;
  StreamSubscription _purchaseErrorSubscription;



  void _requestPurchase(int itemNumber) async {
    getPurchaseHistory();
    try {
      print(iaps[itemNumber].productId);
      await FlutterInappPurchase.instance
          .requestPurchase(iaps[itemNumber].productId);


      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Homes(),
          ));

    } catch (e) {
      PlatformException p = e as PlatformException;
      print(p.code);
      print("işlem sanırım iptal edildi");
      print(p.message);
      print(p.details);
    }


  }

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   print(iaps[1].localizedPrice);
   print(iaps[0].originalPrice);
   print("price");
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Color(0xFF2c3e50),
            Color(0xFF2c3e50),
          ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                          color: Colors.white,
                          iconSize: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo.png'))),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('TopicRead',
                          style: TextStyle(
                            fontFamily: 'GalanoBold',
                            color: Colors.white,
                            fontSize: 25.0,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF314659),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 4.0),
                            child: Text('Premium',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'GalanoBold',
                                  color: Colors.white,
                                  fontSize: 18.0,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    'Select your plan',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GalanoMedium',
                        fontSize: 17.0),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () async {
                                print('en sola basıldı.');
                                 _requestPurchase(1);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 25.0),
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                              color: Color(0xFF314659),
                                              fontFamily: 'GalanoBold',
                                              fontSize: 30.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Month',
                                        style: TextStyle(
                                            color: Color(0xFF314659),
                                            fontFamily: 'GalanoBold',
                                            fontSize: 18.0),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '${iaps[1].localizedPrice}',
                                        style: TextStyle(
                                            color: Color(0xFF314659),
                                            fontFamily: 'GalanoBold',
                                            fontSize: 15.0),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: GestureDetector(
                            onTap: () {
                              _requestPurchase(2);
                              print('Ortadakine basıldı.');
                            },
                            child: Container(
                              transform:
                                  Matrix4.translationValues(0.0, -10.0, 0.0),
                              decoration: BoxDecoration(
                                  color: Color(0xFF314659),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              transform:
                                                  Matrix4.translationValues(
                                                      -0.0, -6.0, 1.0),
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF314659),
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                'POPULAR',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'GalanoBold'),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 25.0),
                                          child: Text(
                                            '1',
                                            style: TextStyle(
                                                color: Color(0xFF314659),
                                                fontFamily: 'GalanoBold',
                                                fontSize: 30.0),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Year',
                                          style: TextStyle(
                                              color: Color(0xFF314659),
                                              fontFamily: 'GalanoBold',
                                              fontSize: 18.0),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          '3 DAY FREE TRIAL',
                                          style: TextStyle(
                                              color: Color(0xFFC4D8EE),
                                              fontFamily: 'GalanoBold',
                                              fontSize: 13.0),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          '${iaps[2].localizedPrice}',
                                          style: TextStyle(
                                              color: Color(0xFF314659),
                                              fontFamily: 'GalanoBold',
                                              fontSize: 15.0),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              print('en sağdakine basıldı');
                              _requestPurchase(0);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 25.0),
                                        child: Text(
                                          '6',
                                          style: TextStyle(
                                              color: Color(0xFF314659),
                                              fontFamily: 'GalanoBold',
                                              fontSize: 30.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Month',
                                        style: TextStyle(
                                            color: Color(0xFF314659),
                                            fontFamily: 'GalanoBold',
                                            fontSize: 18.0),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '${iaps[0].localizedPrice}',
                                        style: TextStyle(
                                            color: Color(0xFF314659),
                                            fontFamily: 'GalanoBold',
                                            fontSize: 15.0),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Restore Purchase.',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'GalanoMedium',
                          fontSize: 17.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
