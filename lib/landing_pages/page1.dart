import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_ui_challenges/core/presentation/res/assets.dart';
import 'package:flutter_ui_challenges/src/widgets/swiper_pagination.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntroThreePage extends StatefulWidget {
  static final String path = "lib/src/pages/onboarding/intro3.dart";
  @override
  _IntroThreePageState createState() => _IntroThreePageState();
}

class _IntroThreePageState extends State<IntroThreePage> {
  final SwiperController  _swiperController = SwiperController();
  final int _pageCount = 3;
  int _currentIndex = 0;
  final List<String> titles = [
    "Lorem ipsum dolor \nsit amet, consectetur adipiscing \n elit placerat. ",
    "Aliquam eget justo \n nec arcu ultricies elementum \n id at metus. ",
    "Nulla facilisi. \nFusce non tempus risus.\n Sed ultrices scelerisque sem,"
  ];
  final List<Color> pageBgs = [
    Colors.blue.shade300,
    Colors.grey.shade600,
    Colors.cyan.shade300
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Center(child: Container(
            height: 300,
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(5.0)
            ),
          ),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Swiper(
                index: _currentIndex,
                controller: _swiperController,
                itemCount: _pageCount,
                onIndexChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                loop: false,
                itemBuilder: (context, index){
                  return _buildPage(title: titles[index], icon: images[index+2], pageBg: pageBgs[index]);
                },
                pagination: SwiperPagination(
                  builder: CustomPaginationBuilder(
                  activeSize: Size(10.0, 20.0),
                  size: Size(10.0, 15.0),
                  color: Colors.grey.shade600
                  )
                ),
              )),
              SizedBox(height: 10.0),
              _buildButtons(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(){
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            textColor: Colors.grey.shade600,
            child: Text("Skip"),
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('home');
            },
          ),
          IconButton(
            icon: Icon(_currentIndex < _pageCount - 1 ? Icons.arrow_forward_ios : FontAwesomeIcons.check),
            onPressed: () async {
              if(_currentIndex < _pageCount - 1)
                _swiperController.next();
              else {
                Navigator.of(context).pushReplacementNamed('home');
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildPage({String title, String icon, Color pageBg}) {
    final TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20.0,
      color: Colors.white
    );
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16.0, 50.0,16.0,40.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: pageBg
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(title, textAlign: TextAlign.center, style: titleStyle,),
          SizedBox(height: 30.0),
          Expanded(
            child:ClipOval(child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(icon),
                  fit: BoxFit.cover
                )
              ),  
            )) ,
          ),
          
          SizedBox(height: 50.0),
        ],
      ),
    );
  }
}