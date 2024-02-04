import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                print('click me');
              },
              child: Container(
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF89dad0)
                ),
                child: Center(child: Text('tap', style: TextStyle(fontSize: 20, color: Colors.white),),),

              ),
            ),
            GestureDetector(
              onTap: () {
                print('click me');
              },
              child: Container(
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF89dad0)
                ),
                child: Center(child: Text('tap', style: TextStyle(fontSize: 20, color: Colors.white),),),

              ),
            ),
            GestureDetector(
              onTap: () {
                print('click me');
              },
              child: Container(
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF89dad0)
                ),
                child: Center(child: Text('tap', style: TextStyle(fontSize: 20, color: Colors.white),),),

              ),
            ),
            GestureDetector(
              onTap: () {
                print('click me');
              },
              child: Container(
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF89dad0)
                ),
                child: Center(child: Text('tap', style: TextStyle(fontSize: 20, color: Colors.white),),),

              ),
            ),

          ],
            )
        ),
      );
  }
}
