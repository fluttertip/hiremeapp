import 'package:flutter/material.dart';

class CandidateProfileTile extends StatelessWidget {
  final String name;
  final String position;
  final String profilePictureUrl;

  const CandidateProfileTile({
    Key? key,
    required this.name,
    required this.position,
    required this.profilePictureUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profilePictureUrl),
      ),
      title: Text(name),
      subtitle: Text(position),
      onTap: () {
        // Handle tap event
      },
    );
  }
}