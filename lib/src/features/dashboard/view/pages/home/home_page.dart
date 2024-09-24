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
        actions: [
          IconButton(
            onPressed: () {
              final cubit = context.read<HomeCubit>();
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (context) => BlocProvider.value(
                  value: cubit,
                  child: const UnitNamesSheet(),
                ),
              );
            },
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      body: const HomeContent().pad(16),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final cubit = context.read<HomeCubit>();
          context.push(
            NewUserPage.route(null, cubit),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
