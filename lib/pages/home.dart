import 'package:fitnessapp/models/category_model.dart'; // Importing category model
import 'package:fitnessapp/models/diet_model.dart'; // Importing diet model
import 'package:fitnessapp/models/popular_model.dart';
import 'package:flutter/material.dart'; // Importing Flutter material package for UI

class HomePage extends StatefulWidget {
  HomePage({super.key}); // Constructor with optional key

  @override
  State<HomePage> createState() => _HomePageState(); // Creating state for HomePage
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = []; // List to hold category data
  List<DietModel> diets = []; // List to hold diet data
  List<PopularDietsModels> popularDiets = []; // List for popular diets

  // Function to get categories
  void _getCategories() {}

  // Function to get diets
  void _getDiets() {
    diets = DietModel.getDiets(); // Assign diets from model function
  }

  // Function to initialize both categories and diets
  void _getInitialInfo() {
    categories = getCategories(); // Get categories
    diets = DietModel.getDiets(); // Get diets
    popularDiets =
        PopularDietsModels.getPopularDiets(); // Assign popular diets from
  }

  @override
  Widget build(BuildContext context) {
    _getCategories(); // Calling category data
    _getInitialInfo(); // Initializing all data (this causes duplicate getCategories call)

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Breakfast', // Title of app bar
          style: TextStyle(
            color: Colors.black, // Text color
            fontSize: 18, // Font size
            fontWeight: FontWeight.bold, // Font weight
          ),
        ),
        backgroundColor: Colors.white, // App bar background color
        centerTitle: true, // Center the title
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back icon
          onPressed: () {
            // Action for back button
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.donut_small, color: Colors.black), // Right icon
            onPressed: () {
              // Action for icon
            },
          ),
        ],
      ),
      backgroundColor: Colors.white, // Background color of page

      body: ListView(
        children: [
          _searchFeild(), // Search bar widget
          SizedBox(height: 30), // Spacer
          _categoriesSection(),
          SizedBox(height: 30), // Spacer
          _dietSection(),
          SizedBox(height: 30), // Spacer
          _populardietSection(),
          SizedBox(height: 30), // Spacer
        ],
      ),
    );
  }

  // Popular diet section widget
  Column _populardietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align children to start
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Popular ',
            style: TextStyle(
              fontSize: 18, // Font size
              fontWeight: FontWeight.w600, // Font weight
              color: Colors.black, // Text color
            ),
          ),
        ),
        SizedBox(height: 15), // Spacer
        ListView.separated(
          itemCount: popularDiets.length, // Total number of popular diets
          shrinkWrap: true, // Shrink the list to fit content
          physics: NeverScrollableScrollPhysics(), // Prevent nested scroll
          separatorBuilder: (context, index) =>
              SizedBox(height: 20), // Space between items
          itemBuilder: (context, index) {
            return Container(
              height: 115,
              decoration: BoxDecoration(
                color: popularDiets[index].boxIsSelected
                    ? Colors.white
                    : Colors.transparent, // Background color
                borderRadius: BorderRadius.circular(17), // Rounded
                boxShadow: popularDiets[index].boxIsSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.07),
                          offset: Offset(0, 10), // Shadow offset
                          blurRadius: 0, // Shadow blur radius
                        ),
                      ]
                    : [],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 80,
                    color: const Color.fromARGB(255, 16, 144, 179),
                  ), // Icon
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popularDiets[index].name, // Diet name
                        style: TextStyle(
                          fontSize: 16, // Font size
                          fontWeight: FontWeight.w500, // Font weight
                          color: Colors.black, // Text color
                        ),
                      ),
                      Text(
                        '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calories}',
                        style: TextStyle(
                          fontSize: 12, // Font size
                          fontWeight: FontWeight.w400, // Font weight
                          color: Color.fromARGB(255, 58, 57, 58),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onDoubleTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios, // Forward icon
                      color: Color.fromARGB(255, 0, 0, 0), // Icon color
                      size: 20,
                    ), // Icon size
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  //Diet card button section widget
  Column _dietSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), // Side padding
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Recommendation\nfor diet', // Section title
              style: TextStyle(
                fontSize: 20, // Font size
                fontWeight: FontWeight.w600, // Font weight
                color: Colors.black, // Text color
              ),
            ),
          ),
        ),
        SizedBox(height: 10), // Spacer
        Container(
          height: 155, // Height of container
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 165, // Width of item
                decoration: BoxDecoration(
                  color: diets[index].boxColor.withOpacity(0.3), // Item color
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      diets[index].icon1, // Diet icon
                      color: diets[index].boxColor, // Icon color
                      size: 30, // Icon size
                    ),
                    Text(
                      diets[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${diets[index].level} | ${diets[index].duration} | ${diets[index].calories} ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 58, 57, 58),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 120,
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                            color: diets[index].viewIsSelected
                                ? Colors.white
                                : Color(0xffC588F2),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            diets[index].viewIsSelected
                                ? Color(0xff9DCEFF)
                                : Colors.transparent,
                            diets[index].viewIsSelected
                                ? Color(0xff92A3FD)
                                : Colors.transparent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(width: 20), // Space between items
            itemCount: diets.length, // Total number of diet items
            scrollDirection: Axis.horizontal, // Scroll direction
            padding: EdgeInsets.only(left: 20, right: 20), // Padding of list
          ),
        ),
      ],
    );
  }

  // Widget to build categories section
  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align children to start
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20), // Padding from left
          child: Text(
            'Category', // Title
            style: TextStyle(
              fontSize: 20, // Font size
              fontWeight: FontWeight.w600, // Font weight
              color: Colors.black, // Text color
            ),
          ),
        ),
        SizedBox(height: 10), // Spacer
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 150, // Height of category list
            child: ListView.separated(
              itemCount: categories.length, // Total number of categories
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 10); // Space between items
              },
              scrollDirection: Axis.horizontal, // Horizontal scroll
              itemBuilder: (BuildContext context, index) {
                return Container(
                  width: 100, // Width of each item
                  decoration: BoxDecoration(
                    color: categories[index].boxColor, // Background color
                    borderRadius: BorderRadius.circular(16), // Rounded corners
                  ),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly, // Even space
                    children: [
                      Container(
                        height: 50, // Height of icon container
                        width: 50, // Width of icon container
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          shape: BoxShape.circle, // Circular shape
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            8.0,
                          ), // Padding inside circle
                          child: Icon(
                            categories[index].icon, // Category icon
                            color: categories[index].boxColor, // Icon color
                            size: 30, // Icon size
                          ),
                        ),
                      ),
                      Text(
                        categories[index].name, // Category name
                        style: TextStyle(
                          fontSize: 16, // Font size
                          fontWeight: FontWeight.w600, // Font weight
                          color: Colors.black, // Text color
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Widget for search field
  Container _searchFeild() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20), // Outer margin
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff1D1617).withOpacity(0.5), // Shadow color
            blurRadius: 20, // Blur radius
            spreadRadius: 0.0, // Spread radius
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search Pancakes',
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 137, 134, 139),
            fontSize: 16,
          ),
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 30.0),
          suffixIcon: Icon(Icons.filter_list, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
