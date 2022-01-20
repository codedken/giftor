import 'package:google_fonts/google_fonts.dart';

import '../my_packages/my_packages.dart';
import '../constants_and_methods.dart';
import '../models/person/person.dart';

import 'menu_dialog.dart';

class Header extends StatelessWidget {
  final BuildContext ctx;
  final Person person;

  Header({required this.ctx, required this.person});

  Future<void> createDialog(BuildContext ctx) {
    return showDialog(
      context: ctx,
      builder: (ctx) => MenuDialog(ctx: ctx, person: person),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'header',
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: person.imageUrl!,
              imageBuilder: (ctx, imageProvider) => CircleAvatar(
                radius: 26.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 24.0,
                  backgroundImage: imageProvider,
                ),
              ),
              placeholder: (ctx, url) => CircleAvatar(
                radius: 26.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.transparent,
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                    strokeWidth: 2.0,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                radius: 26.0,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
              ),
            ),
            Text(
              kAppName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontFamily: GoogleFonts.lobster().fontFamily,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: const Color(0xffffffff),
                size: 30,
              ),
              onPressed: () async {
                await createDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
