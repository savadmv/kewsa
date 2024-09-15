import 'package:kewsa/imports_bindings.dart';
import 'package:kewsa/src/features/dashboard/view/pages/new_user/new_user_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Members'),
      ),
      body: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     const SizedBox(width: 12),
          //     OutlinedButton(
          //       onPressed: () {},
          //       style: OutlinedButton.styleFrom(
          //         padding: const EdgeInsets.symmetric(horizontal: 16),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(8),
          //         ),
          //       ),
          //       child: const Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Icon(
          //             Icons.filter_alt_outlined,
          //             size: 16,
          //           ),
          //           SizedBox(width: 4),
          //           Text(
          //             'Filter',
          //             style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.dark),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          const Expanded(
            child: HomeContent(),
          ),
        ],
      ).pad(16),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(NewUserPage.route());
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
