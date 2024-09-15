import 'package:kewsa/imports_bindings.dart';

///
class DrawerView extends StatefulWidget {
  ///
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Drawer(
      width: context.width * 0.8,
      shape: const RoundedRectangleBorder(),
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (p, c) => p != c,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.viewPaddingOf(context).top),
                Center(
                  child: CircleAvatar(
                    backgroundColor: IconTheme.of(context).color,
                    radius: 40,
                    child: Text(
                      user.name?.split('').first ?? '',
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: AppColors.light),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  user.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.dark),
                ),
                const SizedBox(height: 4),
                Text(
                  user.email ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.dark),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    onSelected: (value) => context.read<AppBloc>().add(const AppLogoutRequested()),
                    itemBuilder: (context) => [
                      const PopupMenuItem<String>(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        value: 'Logout',
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: AppColors.dark),
                        child: Text('Logout'),
                      ),
                    ],
                  ),
                ),
                // Text(
                //   '$whichEnv $version',
                //   style: AppStyles.text12Px.interSemiBold,
                // ).pOnly(top: 16).align(Alignment.bottomCenter),
              ],
            ),
          );
        },
      ),
    );
  }
}
