import '../my_packages/my_packages.dart';

class AuthButton extends StatefulWidget {
  final isLoading;
  final Color btnColor;
  final String btnText;
  final VoidCallback onTap;

  AuthButton({
    this.isLoading = false,
    required this.btnColor,
    required this.btnText,
    required this.onTap,
  });

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  bool _startSpinner = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 60.0,
      width: widget.isLoading ? 60.0 : MediaQuery.of(context).size.width * 0.80,
      duration: const Duration(milliseconds: 500),
      onEnd: () {
        if (widget.isLoading) {
          setState(() => _startSpinner = true);
        } else {
          setState(() => _startSpinner = false);
        }
      },
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => widget.btnColor.withOpacity(0.9),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60.0),
            ),
          ),
          elevation: MaterialStateProperty.all(12.0),
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: FittedBox(
                child: (_startSpinner && widget.isLoading)
                    ? CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.0,
                      )
                    : Text(
                        widget.btnText,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            if (!widget.isLoading)
              Positioned(
                right: 10.0,
                child: Icon(
                  FontAwesomeIcons.longArrowAltRight,
                  color: Colors.white,
                  size: 28.0,
                ),
              ),
          ],
        ),
        onPressed: _startSpinner ? null : widget.onTap,
      ),
    );
  }
}
