import 'dart:typed_data';
import 'dart:ui';

import 'package:cool_alert/cool_alert.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:html';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'സാമൂഹിക സുരക്ഷ ക്യാമ്പയിൻ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPoster = 1;
  Uint8List? _overlay1Image;
  String _overlayText1Presidant = 'പേര്';
  String _overlayText1Panchayath = 'പഞ്ചായത്ത്‌';
  String _overlayText1DateStart = 'ജൂലൈ 1';
  String _overlayText1DateEnd = 'ജൂലൈ 15';
  ScreenshotController screenshotController = ScreenshotController();


  var scr= new GlobalKey();

  Uint8List? _overlay2Image;
  Uint8List? _overlay3Image;
  String _overlayText2Presidant = 'പ്രസിഡന്റ്';
  String _overlayText2Panchayath = 'പഞ്ചായത്ത്‌';
  String _overlayText2Member = 'മെമ്പർ';
  String _overlayText2Ward = '   ';
  String _overlayText2WardNumber = '';
  String _overlayText2DateStart = 'ജൂലൈ 1';
  String _overlayText2DateEnd = 'ജൂലൈ 15';
  String _overlayText2Location = 'അംഗനവാടി';
  String _overlayText2Date2 = 'ജൂലൈ 10';
  String _overlayText2Time = '12.30';
  String _overlayText2AMPM = 'AM';








  void _pickOverlayImage1() async {
    Uint8List? image = await ImagePickerWeb.getImageAsBytes();
    if (image != null) {
      setState(() {
        _overlay1Image = image;
      });
    }
  }
  void _pickOverlayImage2() async {
    Uint8List? image = await ImagePickerWeb.getImageAsBytes();
    if (image != null) {
      setState(() {
        _overlay2Image = image;
      });
    }
  }
  void _pickOverlayImage3() async {
    Uint8List? image = await ImagePickerWeb.getImageAsBytes();
    if (image != null) {
      setState(() {
        _overlay3Image = image;
      });
    }
  }



  void _saveImagePanchayath(Uint8List capturedImage) async {
    final blob = Blob([capturedImage]);
    final url = Url.createObjectUrlFromBlob(blob);
    final anchor = AnchorElement(href: url)
      ..setAttribute("download", "Poster.png")
      ..click();
    Url.revokeObjectUrl(url);
  }

  // Future<void> _downloadImage(Uint8List capturedImage) async {
  //   await WebImageDownloader.downloadImageFromUInt8List(uInt8List: capturedImage);
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // actions: [
        //   IconButton(onPressed: () {
        //     CoolAlert.show(
        //       context: context,
        //       type: CoolAlertType.info,
        //       title: "About Developers",
        //       Vyshnav A: vaishnavalppara@gmail.com",
        //     );
        //   }, icon: Icon(Icons.menu))
        // ],
        title:  Text('ക്യാമ്പയിൻ പോസ്റ്റർ',style:  Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedPoster = 1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            elevation: _selectedPoster == 1 ? 5 : 0,
                            backgroundColor: _selectedPoster == 1 ? Color(0xff6dcff6) : Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),side: BorderSide(color: _selectedPoster == 1 ? Colors.black : Colors.grey,)),
                          ),
                          child: const Text('പഞ്ചായത്ത്‌',style: TextStyle(color: Colors.black),),
                        ),
                      ),

                      const SizedBox(width: 10,),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedPoster = 2;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            elevation: _selectedPoster == 2 ? 5 : 0,
                            backgroundColor: _selectedPoster == 2 ? Color(0xff6dcff6) : Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),side: BorderSide(color: _selectedPoster == 2 ? Colors.black : Colors.grey,)),
                          ),
                          child: const Text('വാർഡ്',style: TextStyle(color: Colors.black),),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),


                  // PANCHAYATH POSTER


                  if (_selectedPoster != 2)
                    Column(
                      children: [
                        Screenshot(
                          controller: screenshotController,
                          child: Stack(
                            key: scr,
                            children: [

                              new Positioned.fill(child: Image.asset("assets/images/background.jpg",fit: BoxFit.cover,)),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width *.015),
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width > 600 ? (600*.15 )-8: (MediaQuery.sizeOf(context).width * .15)-8),
                                        child: Image.asset("assets/images/fixed_two_top.jpg",fit: BoxFit.cover,)),
                                    SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 600*.046 : MediaQuery.sizeOf(context).width * .046,),
                                    Stack(children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width > 600 ? 600*.2 : MediaQuery.sizeOf(context).width * .2),
                                            border: Border.all(width: 2,color: Colors.white,)
                                        ),
                                        width: MediaQuery.sizeOf(context).width > 600 ? 600*.21 : MediaQuery.sizeOf(context).width * .21,
                                        height: MediaQuery.sizeOf(context).width > 600 ? 600*.21 : MediaQuery.sizeOf(context).width * .21,

                                      ),
                                      if (_overlay1Image != null)
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width > 600 ? 600*.2 : MediaQuery.sizeOf(context).width * .2),
                                              border: Border.all(width: 2,color: Colors.white,)
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width > 600 ? 600*.2 : MediaQuery.sizeOf(context).width * .2),
                                            child: SizedBox(
                                                width: MediaQuery.sizeOf(context).width > 600 ? 600*.21 : MediaQuery.sizeOf(context).width * .21,
                                                height: MediaQuery.sizeOf(context).width > 600 ? 600*.21 : MediaQuery.sizeOf(context).width * .21,
                                                child: Image.memory(_overlay1Image!,fit:BoxFit.cover,)) ,

                                          ),
                                        ),
                                    ],),
                                    SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 6/80 : MediaQuery.sizeOf(context).width/80,),
                                    Text(_overlayText1Presidant,style:  Theme.of(context).textTheme.labelSmall?.copyWith(fontFamily: 'FML',fontSize: MediaQuery.sizeOf(context).width > 600 ? 600/50 : MediaQuery.sizeOf(context).width/50,fontWeight: FontWeight.w900
                                    )),
                                    SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 600/300 : MediaQuery.sizeOf(context).width/300,),
                                    Text('(പഞ്ചായത്ത്‌ പ്രസിഡന്റ്‌)',style:  Theme.of(context).textTheme.labelSmall?.copyWith(fontFamily: 'FML',fontSize:  MediaQuery.sizeOf(context).width > 600 ? 600/50 : MediaQuery.sizeOf(context).width/50,fontWeight: FontWeight.bold,)),
                                    const SizedBox(height: 5,),
                                    Text(_overlayText1Panchayath,style:  Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'FML',fontWeight: FontWeight.w900,fontSize: MediaQuery.sizeOf(context).width > 600 ? 600/22 : MediaQuery.sizeOf(context).width/22)),
                                    const SizedBox(height: 4,),
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Center(child: Text('സമ്പൂർണ സാമൂഹിക സുരക്ഷ',style:  Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w900,fontSize: MediaQuery.sizeOf(context).width > 600 ? 600/27 : MediaQuery.sizeOf(context).width/27)))),
                                    // Text('സുരക്ഷ',style:  Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: 'FML',fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width > 600 ? 600/26 : MediaQuery.sizeOf(context).width/26)),
                                    // SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 600/100: MediaQuery.sizeOf(context).width/200,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal:  MediaQuery.sizeOf(context).width > 600 ? (600*.23) : MediaQuery.sizeOf(context).width *.23),
                                      child: Image.asset('assets/images/campaign.png',fit: BoxFit.fill,),
                                    ),
                                    SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 600/60 : MediaQuery.sizeOf(context).width/60,),
                                    Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(3)),
                                          color: Colors.yellow,
                                        ),
                                        child: Text(_overlayText1DateStart+' മുതൽ '+_overlayText1DateEnd +' വരെ',style:  Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: 'FML',fontWeight: FontWeight.w700,fontSize: MediaQuery.sizeOf(context).width > 600 ? 600/28 : MediaQuery.sizeOf(context).width/28))),
                                    SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 600*.05 : MediaQuery.sizeOf(context).width * .05,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width > 600 ? 600*.045 : MediaQuery.sizeOf(context).width * .045),
                                      child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                            color: Color(0xff6dcff6),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('ലക്ഷ്യങ്ങൾ :',style:  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize:  MediaQuery.sizeOf(context).width > 600 ? 600/37 : MediaQuery.sizeOf(context).width/37,fontWeight: FontWeight.bold,fontFamily: 'FML')),
                                              const SizedBox(height: 3,),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 5),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("* "),
                                                        Expanded(child: Text('പഞ്ചായത്തിലെ മുഴുവൻ ആളുകൾക്കും ഇൻഷുറൻസ് പരിരക്ഷ ഉറപ്പുവരുത്തുന്നു',style:  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize:  MediaQuery.sizeOf(context).width > 600 ? 600/38 : MediaQuery.sizeOf(context).width/38,fontWeight: FontWeight.bold,fontFamily: 'FML'))),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 3,),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("* "),
                                                        Expanded(child: Text('സാമ്പത്തിക സുരക്ഷാ ബോധവത്കരണം',style:  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize:  MediaQuery.sizeOf(context).width > 600 ? 600/38 : MediaQuery.sizeOf(context).width/38,fontWeight: FontWeight.bold,fontFamily: 'FML'))),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    SizedBox(height:  MediaQuery.sizeOf(context).width > 600 ? 600*.045 : MediaQuery.sizeOf(context).width * .045),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 10),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _pickOverlayImage1();
                                },
                                child: const Text('പ്രസിഡന്റിന്റെ ഫോട്ടോ'),
                              ),
                              const SizedBox(height: 10,),
                              TextFormField(
                                decoration:  InputDecoration(
                                  border: const OutlineInputBorder().copyWith(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(width: 1, color: Colors.black12),
                                  ),
                                  labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                  hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                  hintText: 'പഞ്ചായത്ത്‌ പ്രസിഡന്റ്‌',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _overlayText1Presidant = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 10,),
                              TextFormField(
                                decoration:  InputDecoration(
                                  border: const OutlineInputBorder().copyWith(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(width: 1, color: Colors.black12),
                                  ),
                                  labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                  hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                  hintText: 'ഗ്രാമപഞ്ചായത്ത്',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _overlayText1Panchayath = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration:  InputDecoration(
                                        border: const OutlineInputBorder().copyWith(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(width: 1, color: Colors.black12),
                                        ),
                                        labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                        hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                        hintText: 'Start Date(eg:  ജൂലൈ 15)',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _overlayText1DateStart = value;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  Expanded(
                                    child: TextFormField(
                                      decoration:  InputDecoration(
                                        border: const OutlineInputBorder().copyWith(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(width: 1, color: Colors.black12),
                                        ),
                                        labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                        hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                        hintText: 'End Date(eg:  ജൂലൈ 25)',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _overlayText1DateEnd = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),



                  // WARD POSTER



                  if(_selectedPoster == 2)
                    Column(
                      children: [
                        Screenshot(
                          controller: screenshotController,
                          child: Stack(
                            children: [

                              new Positioned.fill(child: Image.asset("assets/images/background.jpg",fit: BoxFit.cover,)),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width *.015),
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width > 600 ? (600*.15 )-8: (MediaQuery.sizeOf(context).width * .15)-8),
                                        child: Image.asset("assets/images/fixed_two_top.jpg",fit: BoxFit.fill,)),
                                    SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 600*.050 : MediaQuery.sizeOf(context).width * .050,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal:  MediaQuery.sizeOf(context).width > 600 ? 600*.07 : MediaQuery.sizeOf(context).width * .07,),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              // const SizedBox(height: 15),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Stack(children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width > 600 ? 600*.2 : MediaQuery.sizeOf(context).width * .2),
                                                          border: Border.all(width: 2,color: Colors.white,)
                                                      ),
                                                      width: MediaQuery.sizeOf(context).width > 600 ? 600*.27 : MediaQuery.sizeOf(context).width * .27,
                                                      height: MediaQuery.sizeOf(context).width > 600 ? 600*.27 : MediaQuery.sizeOf(context).width * .27,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width > 600 ? 600*.2 : MediaQuery.sizeOf(context).width * .2),
                                                      ),
                                                    ),
                                                    if (_overlay2Image != null)
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width > 600 ? 600*.2 : MediaQuery.sizeOf(context).width * .2),
                                                            border: Border.all(width: 2,color: Colors.white,)
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width > 600 ? 600*.2 : MediaQuery.sizeOf(context).width * .2),
                                                          child: SizedBox(
                                                              width: MediaQuery.sizeOf(context).width > 600 ? 600*.27 : MediaQuery.sizeOf(context).width * .27,
                                                              height: MediaQuery.sizeOf(context).width > 600 ? 600*.27 : MediaQuery.sizeOf(context).width * .27,
                                                              child: Image.memory(_overlay2Image!,fit:BoxFit.cover,)) ,

                                                        ),
                                                      ),
                                                  ],),
                                                  // const SizedBox(height : 5),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 6/80 : MediaQuery.sizeOf(context).width/80,),
                                                      Text(_overlayText2Presidant,style:  Theme.of(context).textTheme.labelSmall?.copyWith(fontFamily: 'FML',fontSize: MediaQuery.sizeOf(context).width > 600 ? 600/50 : MediaQuery.sizeOf(context).width/50,fontWeight: FontWeight.w900
                                                      )),
                                                      SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 600/300 : MediaQuery.sizeOf(context).width/300,),
                                                      Text('(പഞ്ചായത്ത്‌ പ്രസിഡന്റ്‌)',style:  Theme.of(context).textTheme.labelSmall?.copyWith(fontFamily: 'FML',fontSize:  MediaQuery.sizeOf(context).width > 600 ? 600/50 : MediaQuery.sizeOf(context).width/50,fontWeight: FontWeight.bold,)),

                                                      const SizedBox(height : 20),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),

                                          Column(
                                            children: [


                                              Stack(children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width > 600 ? 600*.2 : MediaQuery.sizeOf(context).width * .2),
                                                      border: Border.all(width: 2,color: Colors.white,)
                                                  ),
                                                  width: MediaQuery.sizeOf(context).width > 600 ? 600*.21 : MediaQuery.sizeOf(context).width * .21,
                                                  height: MediaQuery.sizeOf(context).width > 600 ? 600*.21 : MediaQuery.sizeOf(context).width * .21,
                                                ),
                                                if (_overlay3Image != null)
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width > 600 ? 600*.2 : MediaQuery.sizeOf(context).width * .2),
                                                        border: Border.all(width: 2,color: Colors.white,)
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width > 600 ? 600*.2 : MediaQuery.sizeOf(context).width * .2),
                                                      child: SizedBox(
                                                          width: MediaQuery.sizeOf(context).width > 600 ? 600*.21 : MediaQuery.sizeOf(context).width * .21,
                                                          height: MediaQuery.sizeOf(context).width > 600 ? 600*.21 : MediaQuery.sizeOf(context).width * .21,
                                                          child: Image.memory(_overlay3Image!,fit:BoxFit.cover,)) ,

                                                    ),
                                                  ),

                                              ],),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 6/80 : MediaQuery.sizeOf(context).width/80,),
                                                  Text(_overlayText2Member,style:  Theme.of(context).textTheme.labelSmall?.copyWith(fontFamily: 'FML',fontSize: MediaQuery.sizeOf(context).width > 600 ? 600/50 : MediaQuery.sizeOf(context).width/50,fontWeight: FontWeight.w900
                                                  )),
                                                  Text('(പഞ്ചായത്ത്‌ മെമ്പർ)',style: Theme.of(context).textTheme.labelSmall?.copyWith(fontFamily: 'FML',fontSize:  MediaQuery.sizeOf(context).width > 600 ? 600/50 : MediaQuery.sizeOf(context).width/50,fontWeight: FontWeight.bold,)),
                                                  Text('വാർഡ് നമ്പർ: '+_overlayText2WardNumber,style:  Theme.of(context).textTheme.labelSmall?.copyWith(fontFamily: 'FML',fontSize:  MediaQuery.sizeOf(context).width > 600 ? 600/55 : MediaQuery.sizeOf(context).width/55,fontWeight: FontWeight.bold,)),
                                                  const SizedBox(height : 30),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 6/80 : MediaQuery.sizeOf(context).width/80,),

                                    const SizedBox(height: 5,),
                                    Text(_overlayText2Panchayath,style:  Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'FML',fontWeight: FontWeight.w900,fontSize: MediaQuery.sizeOf(context).width > 600 ? 600/22 : MediaQuery.sizeOf(context).width/22)),
                                    const SizedBox(height: 4,),
                                    FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Center(child: Text('സമ്പൂർണ സാമൂഹിക സുരക്ഷ',style:  Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w900,fontSize: MediaQuery.sizeOf(context).width > 600 ? 600/27 : MediaQuery.sizeOf(context).width/27)))),
                                    // Text('സുരക്ഷ',style:  Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: 'FML',fontWeight: FontWeight.bold,fontSize: MediaQuery.sizeOf(context).width > 600 ? 600/26 : MediaQuery.sizeOf(context).width/26)),
                                    // SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 600/100: MediaQuery.sizeOf(context).width/200,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal:  MediaQuery.sizeOf(context).width > 600 ? (600*.23) : MediaQuery.sizeOf(context).width *.23),
                                      child: Image.asset('assets/images/campaign.png',fit: BoxFit.fill,),
                                    ),
                                    SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 600/60 : MediaQuery.sizeOf(context).width/60,),
                                    Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(3)),
                                          color: Colors.yellow,
                                        ),
                                        child: Text(_overlayText2DateStart+' മുതൽ '+_overlayText2DateEnd+' വരെ',style:  Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: 'FML',fontWeight: FontWeight.w700,fontSize: MediaQuery.sizeOf(context).width > 600 ? 600/28 : MediaQuery.sizeOf(context).width/28))),
                                    SizedBox(height: MediaQuery.sizeOf(context).width > 600 ? 600*.05 : MediaQuery.sizeOf(context).width * .05,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width > 600 ? 600*.045 : MediaQuery.sizeOf(context).width * .045),
                                      child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                            color: Color(0xff6dcff6),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(5),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(_overlayText2Ward+' വാർഡിലെ മുഴുവൻ ആളുകൾക്കും ഇൻഷുറൻസ് പരിരക്ഷ ഉറപ്പുവരുത്തുന്നതിനായി നടത്തുന്ന ക്യാമ്പയിൻ ആലോചന യോഗം',textAlign: TextAlign.center,style:  Theme.of(context).textTheme.bodyLarge?.copyWith(color: Color(0xff3A0CA3),fontSize:  MediaQuery.sizeOf(context).width > 600 ? 600/38 : MediaQuery.sizeOf(context).width/38,fontWeight: FontWeight.bold,fontFamily: 'FML')),
                                                    const SizedBox(height: 5,),
                                                    Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.yellow,width: 1,),
                                                          borderRadius: BorderRadius.circular(4)
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text('2024 '+_overlayText2Date2+' '+_overlayText2Time+' ',textAlign: TextAlign.center,style:  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize:  MediaQuery.sizeOf(context).width > 600 ? 600/38 : MediaQuery.sizeOf(context).width/38,fontWeight: FontWeight.bold,fontFamily: 'FML')),
                                                              Text(_overlayText2AMPM,textAlign: TextAlign.center,style:  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize:  MediaQuery.sizeOf(context).width > 600 ? 600/48 : MediaQuery.sizeOf(context).width/48,fontWeight: FontWeight.w900,)),
                                                            ],
                                                          ),
                                                          Text(_overlayText2Location,textAlign: TextAlign.center,style:  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize:  MediaQuery.sizeOf(context).width > 600 ? 600/38 : MediaQuery.sizeOf(context).width/38,fontWeight: FontWeight.bold,fontFamily: 'FML')),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    SizedBox(height:  MediaQuery.sizeOf(context).width > 600 ? 600*.045 : MediaQuery.sizeOf(context).width * .045),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 10),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _pickOverlayImage3();
                                },
                                child: const Text('മെമ്പറുടെ ഫോട്ടോ'),
                              ),
                              const SizedBox(height: 10,),
                              ElevatedButton(
                                onPressed: () {
                                  _pickOverlayImage2();
                                },
                                child: const Text('പ്രസിഡന്റിന്റെ ഫോട്ടോ'),
                              ),
                              const SizedBox(height: 10,),
                              TextFormField(
                                decoration:  InputDecoration(
                                  border: const OutlineInputBorder().copyWith(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(width: 1, color: Colors.black12),
                                  ),
                                  labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                  hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                  hintText: 'പഞ്ചായത്ത്‌ മെമ്പർ',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _overlayText2Member = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 10,),
                              TextFormField(
                                decoration:  InputDecoration(
                                  border: const OutlineInputBorder().copyWith(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(width: 1, color: Colors.black12),
                                  ),
                                  labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                  hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                  hintText: 'പഞ്ചായത്ത്‌ പ്രസിഡന്റ്‌',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _overlayText2Presidant = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 10,),
                              TextFormField(
                                decoration:  InputDecoration(
                                  border: const OutlineInputBorder().copyWith(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(width: 1, color: Colors.black12),
                                  ),
                                  labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                  hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                  hintText: 'വാർഡ്',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _overlayText2Ward = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 10,),
                              TextFormField(
                                decoration:  InputDecoration(
                                  border: const OutlineInputBorder().copyWith(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(width: 1, color: Colors.black12),
                                  ),
                                  labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                  hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                  hintText: 'വാർഡ് നമ്പർ',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _overlayText2WardNumber = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 10,),
                              TextFormField(
                                decoration:  InputDecoration(
                                  border: const OutlineInputBorder().copyWith(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(width: 1, color: Colors.black12),
                                  ),
                                  labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                  hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                  hintText: 'ഗ്രാമപഞ്ചായത്ത്',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _overlayText2Panchayath = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration:  InputDecoration(
                                        border: const OutlineInputBorder().copyWith(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(width: 1, color: Colors.black12),
                                        ),
                                        labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                        hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                        hintText: 'Start Date(eg:  ജൂലൈ 15)',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _overlayText2DateStart = value;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  Expanded(
                                    child: TextFormField(
                                      decoration:  InputDecoration(
                                        border: const OutlineInputBorder().copyWith(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(width: 1, color: Colors.black12),
                                        ),
                                        labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                        hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                        hintText: 'End Date(eg:  ജൂലൈ 25)',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _overlayText2DateEnd = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              TextFormField(
                                decoration:  InputDecoration(
                                  border: const OutlineInputBorder().copyWith(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(width: 1, color: Colors.black12),
                                  ),
                                  labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                  hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                  hintText: 'ആലോചന യോഗം തീയതി',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _overlayText2Date2 = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      decoration:  InputDecoration(
                                        border: const OutlineInputBorder().copyWith(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(width: 1, color: Colors.black12),
                                        ),
                                        labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                        hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                        hintText: 'ആലോചന യോഗം സമയം',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _overlayText2Time = value;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: DropdownButton<String>(
                                          value: _overlayText2AMPM,
                                          icon: const Icon(Icons.arrow_drop_down),
                                          style: const TextStyle(color: Colors.black),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.black12,
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              _overlayText2AMPM = newValue!;
                                            });
                                          },
                                          items: const [
                                            DropdownMenuItem<String>(
                                              value: 'AM',
                                              child: Text('AM'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'PM',
                                              child: Text('PM'),
                                            )
                                          ],
                                        ),
                                      )
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              TextFormField(
                                decoration:  InputDecoration(
                                  border: const OutlineInputBorder().copyWith(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(width: 1, color: Colors.black12),
                                  ),
                                  labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
                                  hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black12),
                                  hintText: 'Location',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _overlayText2Location = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.green,
          onPressed: () async {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("downloading poster"),
            ));
            final capturedImage = await screenshotController.capture();
            if (capturedImage != null) {
              _saveImagePanchayath(capturedImage);
            }
          },
          child: const Icon(Icons.download)

      ),
    );
  }
}

