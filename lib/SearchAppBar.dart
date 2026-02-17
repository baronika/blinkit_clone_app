import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String hintText;
  final Function(String)? onChanged;
  final VoidCallback onProfileTap;

  const SearchAppBar({
    Key? key,
    this.hintText = "Search...",
    this.onChanged,
    required,

    required this.onProfileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.yellow,
      child: SafeArea(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Blinkit in",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "8 minutes",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "Industrial Area, Sector 74, Mohali",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 10),

                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: TextField(
                      onChanged: onChanged,
                      decoration: InputDecoration(
                        hintText: hintText,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.mic),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
SizedBox(height: 10),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: IconButton(
                iconSize: 48,
                onPressed: onProfileTap,
                icon: Icon(Icons.account_circle_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 4);
}
