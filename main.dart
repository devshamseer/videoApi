
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:loading_indicator/loading_indicator.dart';

var curentPage = 0;
var s = '';
var like = ["12K", "32K", '1K', "1M", "75K", "300", "42K", "90K", "20M", "60K"];
var reversedShortList;
var allshortsList = [];
var chats = [
  "300",
  "500",
  "1K",
  "800",
  "40K",
  "100",
  "12K",
  "64K",
  "7.6K",
  "84K"
];
var ttchnelName = [
  '5-Minute Crafts',
  'The Everyday Dad',
  'Unbox Therapy',
  'Be Inspired',
  'Body Hub',
  'Silicon Valley Girl',
  'Motivation Core',
  'Burst check',
  'Plain Jane check',
  'Simple Pleasures',
  'The Bubbly Demeanor',
  'AlmostTogether check',
  'The Wild Things',
  "Punjab Viral",
  "Naya Pakistan Global",
  "Cover Story",
  "Go Global",
  "eCommerce",
  "Junaid Haleem Official",
  "Tayyab Hanif",
  "Zain Ali Official",
  "Mohsin Rajput",
  "Official"
];
final ytTitel = [
  'Lorem Ipsum is simply dummy text of the printing',
  'make a type specimen book. It has survived not only five',
  'ook like readable English. Many desktop publishing',
  'psum is not simply random text. It has roots in a piece of classical',
  'and going through the cites of the word in classical literature,',
  'Good and Evil) by Cicero, written in 45 BC. This book is a treatise',
  'Good and Evil) by Cicero, written in 45 BC. This book is a treatise',
  'It is a long established fact that a reader will be distracted',
  'The standard chunk of Lorem Ipsum used since',
  'always free from repetition, injected humour, or non-characteristic'
];

void main() => runApp(
      VideoPlayerApp(),
    );

class VideoPlayerApp extends StatelessWidget {
  VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    // allShortsApis();
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    // _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var randomytTitel = (ytTitel..shuffle()).first;
    var randomytlike = (like..shuffle()).first;
    var randomytchat = (chats..shuffle()).first;
    var randomyttchnelName = (ttchnelName..shuffle()).first;
    // var randomShorts = (allshortsList..shuffle());
    //  Future? _initializeVideoPlayerFuture;
    setState(() {
      _controller = VideoPlayerController.network(
          'https://devshamseer.github.io/youtubeApi/shorts/video${curentPage}.mp4');
      print("curetnpge${curentPage}");
    });
    _controller.play();
    // Initialize the controller and store the Future for later use.
    var _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
    return Scaffold(
        backgroundColor: Colors.black,
        // Use a FutureBuilder to display a loading spinner while waiting for the
        // VideoPlayerController to finish initializing.
        body: SafeArea(
          child: PageView.builder(
            
     
              allowImplicitScrolling: true,
              onPageChanged: ((value) {
              curentPage==curentPage?  setState(() {
                  curentPage=curentPage;
                  // _initializeVideoPlayerFuture = _controller.initialize();
                  print('object');
                  curentPage;
                }):SizedBox();
              }),
              scrollDirection: Axis.vertical,
              itemCount: 18,
              itemBuilder: ((context, index) {
               
                curentPage = index;
                _controller;
                print(allshortsList);
                print('Printg' + curentPage.toString());

                return Container(
                  child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the VideoPlayerController has finished initialization, use
                        // the data it provides to limit the aspect ratio of the video.
                        return Stack(
                          children: [
                            VideoPlayer(_controller),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                top: 675,
                                left: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 290,
                                      height: 50,
                                      child: Text(
                                        randomytTitel.toString(),
                                        softWrap: true,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              'https://source.unsplash.com/random?sig= $index&men'),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          randomyttchnelName.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                            Positioned(
                              top: 330,
                              left: 329,
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.thumb_up,
                                                color: Colors.white,
                                                size: 30,
                                              )),
                                          Text(
                                            randomytlike.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.thumb_down,
                                                color: Colors.white,
                                                size: 30,
                                              )),
                                          Text(
                                            'Dislike',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.chat,
                                                color: Colors.white,
                                                size: 30,
                                              )),
                                          Text(
                                            randomytchat.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                CupertinoIcons
                                                    .arrowshape_turn_up_right_fill,
                                                color: Colors.white,
                                                size: 30,
                                              )),
                                          Text(
                                            'Share',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      IconButton(
                                          enableFeedback: true,
                                          onPressed: () {
                                            curentPage;
                                            print(curentPage);
                                            setState(() {
                                              _controller =
                                                  VideoPlayerController.network(
                                                      'https://devshamseer.github.io/youtubeApi/shorts/video${curentPage}.mp4');
                                                      curentPage=16;
                                                      _controller.dispose();
                                              print("curetnpge${curentPage}");
                                            });
                                          },
                                          icon: Icon(
                                            Icons.more_horiz,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                      Container(
                                          height: 60,
                                          width: 60,
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                              'https://source.unsplash.com/random?sig= $index&men ')),
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  9))),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 6, right: 3),
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  60)),
                                                    ),
                                                    child: Center(
                                                      child: Container(
                                                        height: 11,
                                                        width: 11,
                                                        child: LoadingIndicator(
                                                          indicatorType: Indicator
                                                              .lineScaleParty,

                                                          /// Required, The loading type of the widget
                                                          colors: [
                                                            Colors.white
                                                          ],

                                                          /// Optional, The color collections
                                                          strokeWidth: 5,

                                                          /// Optional, The stroke of the line, only applicable to widget which contains line
                                                          /// Optional, Background of the widget
                                                          // pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          )),
                                    ],
                                  )),
                            ),
                          ],
                        );
                      } else {
                        // If the VideoPlayerController is still initializing, show a
                        // loading spinner.

                        return Center(
                          child: Container(
                            height: 70,
                            width: 70,
                            child: LoadingIndicator(
                              indicatorType: Indicator.ballRotateChase,

                              /// Required, The loading type of the widget
                              colors: [Colors.white],

                              /// Optional, The color collections
                              // strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                              /// Optional, Background of the widget
                              // pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              }),),
        )
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // Wrap the play or pause in a call to `setState`. This ensures the
        //     // correct icon is shown.
        //     setState(() {
        //       // If the video is playing, pause it.
        //       if (_controller.value.isPlaying) {
        //         _controller.pause();
        //       } else {
        //         // If the video is paused, play it.
        //         _controller.play();
        //       }
        //     });
        //   },
        //   // Display the correct icon depending on the state of the player.
        //   child: Icon(
        //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        //   ),
        // ),
        );
  }

  // allShortsApis() async {
  //   print('bahu');

  //   for (var i = 0; i <= 29; i++) {
  //     var dio = Dio();

  //     var shortVideo =
  //         "https://devshamseer.github.io/youtubeApi/shorts/video${i}.mp4";
  //       allshortsList.add(shortVideo);

  //     print(allshortsList.length);
  //   }

  //   print('end');
  //   // print("allShorts${allshortsList}");
  //   // var response =
  //   //     await Dio().get('https://devshamseer.github.io/movieApi/tamil.json');
  //   // // print(response);

  //   // setState(() {
  //   //   response.data.forEach((element) {
  //   //     // print(element);
  //   // allshortsList.add(element);
  //   // reversedShortList = new List.from(allshortsList.reversed);
  //   //     // print("Reversed Data" + reversedtamilList.toString());

  //   //   });

  //   //   // print(tamilMovie[2]['name']);
  //   // });

  //   // var hello=await dio.download('https://www.google.com/', './xx.html');
  //   // print(hello);
  // }
}
