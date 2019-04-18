import 'package:flutter/material.dart';
import 'package:present_me/profile/experience/model/experiences.dart';

class HeaderExperience extends StatelessWidget {
  final Experience mExperience;

  const HeaderExperience({
    Key key,
    @required this.mExperience
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(mExperience.imageUrl)),
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  mExperience.name,
                  style: TextStyle(
                      color: Colors.white, fontSize: 16),
                ),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    mExperience.position,
                    style: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ))
            ],
          ),
        )
      ],
    );
  }
}