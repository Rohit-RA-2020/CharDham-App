import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_ui/main_page.dart';
import 'package:travel_ui/styles.dart';

class LeopardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: topMargin(context)),
        The72Text(),
        SizedBox(height: 32),
        TravelDescriptionLabel(),
        SizedBox(height: 32),
        LeopardDescription(),
      ],
    );
  }
}

class LeopardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetNotifier, AnimationController>(
      builder: (context, notifier, animation, child) {
        return Positioned(
          left: -0.85 * notifier.offset,
          width: MediaQuery.of(context).size.width * 1.6,
          child: Transform.scale(
            alignment: Alignment(0.6, 0),
            scale: 1 - 0.1 * animation.value,
            child: Opacity(
              opacity: 1 - 0.6 * animation.value,
              child: child,
            ),
          ),
        );
      },
      child: MapHider(
        child: IgnorePointer(
          child: Image.asset('assets/chardham.png', scale: 1.5,),
        ),
      ),
    );
  }
}

class TravelDescriptionLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Opacity(
          opacity: math.max(0, 1 - 4 * notifier.page),
          child: child,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Text(
          'Start your CharDham Yatra',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class LeopardDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Opacity(
          opacity: math.max(0, 1 - 4 * notifier.page),
          child: child,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          'The Chota Char Dham, is an important Hindu pilgrimage circuit in the Indian Himalayas. Located in the Garhwal region of the state of Uttarakhand, the circuit consists of four sites—Yamunotri, Gangotri, Kedarnath, and Badrinath',
          style: GoogleFonts.indieFlower(fontSize: 16, color: Colors.amber, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class The72Text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Transform.translate(
          offset: Offset(- 20 - 0.5 * notifier.offset, 0),
          child: child,
        );
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: SizedBox(
          width: mainSquareSize(context) - 20,
          child: FittedBox(
            alignment: Alignment.topCenter,
            fit: BoxFit.contain,
            child: Text(
              'DHAM',
              style: TextStyle(fontWeight: FontWeight.bold,),
            ),
          ),
        ),
      ),
    );
  }
}
