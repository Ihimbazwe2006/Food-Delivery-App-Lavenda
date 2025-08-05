import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
class BestChoice extends StatelessWidget {
  const BestChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
         child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _choice('Welcome Back', 'Omlet is the most popular\n nutrient deit protein', 'assets/images/category2.jpeg'),
              SizedBox(width: 15),
              _choice('Pazza chinesse', 'Special Pizaa from china\n type super delicious', 'assets/images/meat3.png'),
              SizedBox(width: 15),
              _choice('Omlet Special', 'Special Pizaa from china\n type super delicious', 'assets/images/category3.png'),
            ],
          )
         ),
      )
    );
  }
  Widget _choice(String title, String descriptions,String imagePath) {
      return GestureDetector(
        onTap: (){
          
        },
        child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imagePath,
          height: 260,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            height: 400,
            color: Colors.grey[200],
            child: const Icon(Icons.broken_image, size: 40),
          ),
        ),
            ),
            Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 80, 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.transparent,
              ],
            ),
          ),
        ),
            ),
            Positioned(
        bottom: 6,
        left: 4,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 1,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color.fromARGB(55, 255, 255, 255),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 6,
                left:7,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 241, 240, 240),
                          ),
                        ),
                        SizedBox(width:8),
                        Container(
                      decoration: BoxDecoration(
                       color: const Color.fromARGB(141, 255, 255, 255),
                       borderRadius: BorderRadius.circular(18.0),
                      ),
                     child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Text('See All',
                        style: TextStyle(
                          fontSize:11,
                          color: Colors.white,
                        ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size:15,
                        color:AppColors.background),
                      ],
                    )
                    ,
                  ),
                ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.location_on,size:10,color: const Color.fromARGB(255, 224, 224, 224)),
                              Text('Kicukiro N60',
                              style: TextStyle(
                                  fontSize: 12,
                                  color:const Color.fromARGB(255, 230, 230, 230),
                              )
                              )
                            ],
                          ),
                        ),
                        
                        const SizedBox(width: 23),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(155, 151, 151, 151),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          
                        ),
                      ],
                    ),
                  ),
                  Text(
                          descriptions,
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 173, 173, 173),
                            height: 1.4,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
            )
          ],
          )
          ),
      );
  }
}