import 'package:kewsa/imports_bindings.dart';
import 'package:kewsa/src/features/dashboard/cubit/dashboard/home.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static Page<void> page() => const MaterialPage<void>(child: DashboardScreen());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: const _DashboardScreen(),
    );
  }
}

class _DashboardScreen extends StatelessWidget {
  const _DashboardScreen();

  static const _icons = [
    Icons.home_filled,
    Icons.person,
  ];

  static const _pages = [
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardCubit, int>(
        builder: (context, state) {
          return _pages[state];
        },
      ),
      bottomNavigationBar: BlocBuilder<DashboardCubit, int>(
        builder: (context, state) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  spreadRadius: .1,
                  color: Colors.grey,
                ),
              ],
            ),
            child: ColoredBox(
              color: AppColors.light,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (final e in _icons.asMap().entries)
                    IconButton(
                      onPressed: () => context.read<DashboardCubit>().change(e.key),
                      icon: Icon(
                        e.value,
                        color: switch (state == e.key) {
                          true => IconTheme.of(context).color,
                          false => IconTheme.of(context).color?.withOpacity(0.4),
                        },
                      ),
                    ),
                ],
              ).pxy(y: 6),
            ),
          );
        },
      ),
    );
  }
}
