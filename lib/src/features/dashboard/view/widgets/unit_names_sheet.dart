import 'package:flutter/cupertino.dart';
import 'package:kewsa/imports_bindings.dart';

///
class UnitNamesSheet extends StatefulWidget {
  ///
  const UnitNamesSheet({super.key});

  @override
  State<UnitNamesSheet> createState() => _UnitNamesSheetState();
}

class _UnitNamesSheetState extends State<UnitNamesSheet> {
  String? q;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SizedBox(
        height: context.height * .5 + MediaQuery.viewInsetsOf(context).bottom,
        child: Scaffold(
            extendBody: true,
            appBar: AppBar(
              actions: [
                IconButton.outlined(
                  onPressed: context.pop,
                  icon: const Icon(
                    Icons.close,
                  ),
                ).pOnly(right: 8),
              ],
              leading: const SizedBox.shrink(),
              title: const Text('Filter By Unit'),
            ),
            body: BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (p, c) => p.isGettingUnitNames != c.isGettingUnitNames || p.unitNames != c.unitNames || p.selUnitNames != c.selUnitNames || p.error != c.error,
              builder: (context, state) {
                if (state.isGettingUnitNames) {
                  return const Loading();
                }
                if (state.error?.isNotEmpty ?? false) {
                  return ErrorText(state.error);
                }
                if (state.unitNames.isEmpty) {
                  return const ErrorText('No unit names available!');
                }
                final filteredUnitNames = state.unitNames.where((e) => '${e.unitName?.toLowerCase()}'.contains(q ?? ''));

                return Column(
                  children: [
                    _SearchUnitNames(
                      text: q ?? '',
                      onChanged: (p0) => setState(() => q = p0),
                    ),
                    Expanded(
                      child: switch (filteredUnitNames.isEmpty) {
                        true => ErrorText("Couldn't find $q!"),
                        false => ListView(
                            children: [
                              for (final unitName in filteredUnitNames)
                                InkWell(
                                  onTap: () => context.read<HomeCubit>().updateSelUnitNames(
                                        unitName,
                                        isSelected: state.selUnitNames.contains(unitName),
                                      ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        switch (state.selUnitNames.contains(unitName)) {
                                          true => Icons.radio_button_checked,
                                          false => Icons.radio_button_off_outlined,
                                        },
                                        size: 16,
                                      ),
                                      Text(
                                        unitName.unitName ?? '',
                                        style: const TextStyle(
                                          color: AppColors.dark,
                                        ),
                                      ).pxy(x: 8),
                                    ],
                                  ).pad(8),
                                ),
                            ],
                          ),
                      },
                    ),
                  ],
                );
              },
            ),
            floatingActionButton: BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (p, c) => p.selUnitNames != c.selUnitNames,
              builder: (context, state) {
                if (state.selUnitNames.isEmpty) {
                  return const SizedBox.shrink();
                }
                return IconButton.filled(
                  onPressed: context.read<HomeCubit>().clearUnitNames,
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.dark,
                  ),
                  icon: const Icon(Icons.clear_all),
                );
              },
            )
            // bottomNavigationBar: Row(
            //   children: [
            //     Flexible(
            //       child: SizedBox(
            //         width: double.maxFinite,
            //         child: OutlinedButton(
            //           style: OutlinedButton.styleFrom(
            //             padding: const EdgeInsets.all(16),
            //             backgroundColor: AppColors.light,
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(8),
            //             ),
            //           ),
            //           onPressed: () {},
            //           child: Text(
            //             'Clear',
            //             style: AppStyles.text16Px,
            //           ),
            //         ),
            //       ).pOnly(right: 8),
            //     ),
            //     Flexible(
            //       child: SizedBox(
            //         width: double.maxFinite,
            //         child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
            //           onPressed: () {},
            //           child: Text(
            //             'Apply',
            //             style: AppStyles.text16Px,
            //           ),
            //         ),
            //       ).pOnly(left: 8),
            //     ),
            //   ],
            // ).pad(16),
            ),
      ),
    );
  }
}

class _SearchUnitNames extends StatelessWidget {
  const _SearchUnitNames({
    required this.text,
    required this.onChanged,
  });

  final String text;

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Input(
      text: text,
      keyboardType: TextInputType.text,
      label: 'Search Unit Name',
      onChanged: onChanged,
    ).pOnly(top: 8).pxy(x: 8);
  }
}
