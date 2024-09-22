import 'package:kewsa/imports_bindings.dart';

class DeleteUserDialog extends StatelessWidget {
  const DeleteUserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDetailsCubit, UserDetailsState>(
      listenWhen: (p, c) => p.deletingError != c.deletingError || p.isDeleted != c.isDeleted,
      listener: (context, state) {
        if (state.deletingError != null) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              SnackBar(
                content: Text(state.deletingError ?? 'Something went wrong! Please try again later.'),
              ),
            );
        }
        if (state.isDeleted) {
          context.pop();
        }
      },
      child: BlocBuilder<UserDetailsCubit, UserDetailsState>(
        buildWhen: (p, c) => p.isDeleting != c.isDeleting,
        builder: (context, state) {
          return PopScope(
            canPop: !state.isDeleting,
            child: AlertDialog(
              title: const Text('Delete Account'),
              content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
              actions: <Widget>[
                TextButton(
                  onPressed: state.isDeleting ? null : context.pop,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    foregroundColor: AppColors.dark,
                  ),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    backgroundColor: Colors.red,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: context.read<UserDetailsCubit>().deleteAccount,
                  child: Text(
                    switch (state.isDeleting) {
                      false => 'Delete',
                      true => 'Deleting...',
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
