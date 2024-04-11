//import 'package:appinio_video_player/appinio_video_player.dart';

import 'package:flutter/material.dart';


class CardNoticia extends StatefulWidget {
  final List<String>? listpath;
  const CardNoticia({super.key, this.listpath});

  @override
  State<CardNoticia> createState() => _CardNoticiaState();
}

class _CardNoticiaState extends State<CardNoticia> {

  late List<Widget> pagesnew;
  int numpage = 0;
  final PageController pageController = PageController(initialPage: 0);
  final transController = TransformationController();
  
  
  late TapDownDetails doubleTapDetails;

  handleDoubleTapDown(TapDownDetails details){
    doubleTapDetails= details;
  }

  handleDoubleTap(){
    if(transController.value != Matrix4.identity()){
      transController.value = Matrix4.identity();
    }else{
      final position = doubleTapDetails.localPosition;
      transController.value = Matrix4.identity()
      ..translate(-position.dx, -position.dy)
      ..scale(2.0);
    }
  }
  

  @override
  void initState() {
    super.initState();
    pagesnew = List.generate(
      widget.listpath!.length,
      (index) => GestureDetector(
        onDoubleTapDown: handleDoubleTapDown,
        onDoubleTap: handleDoubleTap,
        child: InteractiveViewer(
          transformationController: transController,
          child: ImgPath(
            path: widget.listpath![index],
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      width: double.infinity,
      height: 380,
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.ac_unit_sharp),
            title: Text("Urvaseo"),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Text(
              "La naturaleza es un concepto utilizado para referirse al mundo material o universo material, incluyendo los fenómenos del mundo físico, la materia inerte generada como parte de procesos sin la intervención humana.",
              textAlign: TextAlign.justify,
            ),
          ),
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 4,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: widget.listpath!.length,
                      onPageChanged: (value) {
                        setState(() {
                          numpage = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        return pagesnew[index];
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                            pagesnew.length,
                            (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        pageController.animateToPage(index,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeIn);
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 4,
                                      backgroundColor: numpage == index
                                          ? const Color.fromARGB(
                                              255, 255, 255, 255)
                                          : const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImgPath extends StatelessWidget {
  final String? path;
  const ImgPath({super.key, this.path});

  @override
  Widget build(BuildContext context) {
    return Image.asset(path!,
      fit: BoxFit.cover,
    );
  }
}

