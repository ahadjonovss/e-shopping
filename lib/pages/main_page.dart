import 'package:flutter/material.dart';
import 'package:online_shop/utils/models.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 30,)),
          SizedBox(width: 20,),
          Center(
            child: Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white)
              ),
              child: Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.shopping_basket)),
                  Text("\$2",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),)
                ],
              ),
            ),
          ),
          SizedBox(width: 20,)
        ],
      ),
      drawer: Drawer(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 400,
              child: const DefaultTabController(
                length: 6,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(text: "New",),
                    Tab(text: "Best Seller",),
                    Tab(text: "Fruits",),
                    Tab(text: "Milky",),
                    Tab(text: "Meat",),
                    Tab(text: "Fast Food",),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Container(
                height: 644,
                width: 400,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0),
                    itemCount: 10,
                    itemBuilder: (BuildContext ctx, index) {
                      return product();
                    }),
              ),

        ),
        ],
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.redAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
        ],
      ),

    );
  }
}

Widget product(ProductModel product){
  return Container(
    padding: EdgeInsets.all(4),
    margin: EdgeInsets.all(3),
    height: 240,
    width: 190,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey,width: 1)

    ),
    child: Stack(
      children: [
        Positioned(child: Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(product.photo),
              fit: BoxFit.cover
            )
          ),
        ),),
        Positioned(
          top: 150,
            child: Text(product.name,style: TextStyle(fontSize: 16),)),
        Positioned(
          top: 165,
          child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(product.amount,style: TextStyle(fontSize: 16),)),
        ),
        Positioned(
          top: 200,
          child: Icon(Icons.info_outline,size: 28,),),
        Positioned(
          top: 200,
          right: 10,
          child: Text("${product.price}\$",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),),
              ],
            ),
        );
}

