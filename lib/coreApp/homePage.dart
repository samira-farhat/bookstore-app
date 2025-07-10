import 'package:flutter/material.dart';
import 'package:mobile_project/coreApp/bookListingPage.dart';
import '../bookCategories/fantasyPage.dart';
import '../bookCategories/romancePage.dart';
import '../bookCategories/mysteryPage.dart';
import '../bookCategories/classicsPage.dart';
import '../bookCategories/self_helpPage.dart';
import '../bookCategories/poetryPage.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> categories= ['𝙁𝙖𝙣𝙩𝙖𝙨𝙮', '𝙍𝙤𝙢𝙖𝙣𝙘𝙚 ', '𝙈𝙮𝙨𝙩𝙚𝙧𝙮/𝙏𝙝𝙧𝙞𝙡𝙡𝙚𝙧', '𝘾𝙡𝙖𝙨𝙨𝙞𝙘𝙨', '𝙎𝙚𝙡𝙛-𝙃𝙚𝙡𝙥', '𝙋𝙤𝙚𝙩𝙧𝙮'];
  List<Widget> categoryNav= [FantasyPage(), RomancePage(), MysteryPage(), ClassicsPage(), SelfHelpPage(), PoetryPage()];

  @override
  Widget build(BuildContext context) {
    // used a single child scroll view so that we could make the column scrollable since we will have multiple sections in this page
    return SingleChildScrollView(

      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            SizedBox(height: 50),

            // page view to have an image carousel design
            SizedBox(
              height: 250,
              child: PageView(

                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.deepPurpleAccent,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.asset('assets/imageCarousel/imageCarousel1.jpg', fit: BoxFit.cover),
                  ),

                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurpleAccent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset('assets/imageCarousel/imageCarousel2.jpg', fit: BoxFit.cover),
                  ),

                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurpleAccent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset('assets/imageCarousel/imageCarousel3.jpg', fit: BoxFit.cover),
                  ),

                ],

              ),
            ),

            SizedBox(height: 30),

            // row of buttons to navigate to more pages
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                TextButton(
                    onPressed: () {},
                    child: Text('Best Sellers',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                ),

                TextButton(
                  onPressed: () {},
                  child: Text('Offers',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  child: Text('Pre-Order',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(height: 30),

            // a grid view design for the book categories wrapped with a sized box since grid view doesn't render properly within the single child scroll view unless it has some fixed height
            SizedBox(
              height: 530,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30,
                  childAspectRatio: 1.3,
                ),

                itemCount: categories.length,
                itemBuilder: (context, index){
                  // wrapped the containers of categories with a gesture detector widget so we can navigate to their respective pages when they're tapped
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => categoryNav[index])
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent[100],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(categories[index],
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 15),

            // a shop all option that takes us to see the list of all products
            Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BooksPage())
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent[100],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text('𝙎𝙝𝙤𝙥 𝘼𝙡𝙡',
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ),
                ),
            ),

            SizedBox(height: 50),
          ],

        ),
      ),

    );


  }
}


