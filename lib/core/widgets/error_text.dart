import 'package:kewsa/imports_bindings.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(this.msg, {super.key});

  final String? msg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        msg ?? 'Something went wrong!',
        style: context.theme.textTheme.bodyLarge,
      ),
    );
  }
}
