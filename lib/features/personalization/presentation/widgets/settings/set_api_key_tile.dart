import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_app/core/utils/enums/enums.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';

import '../../blocs/settings/settings_bloc.dart';
import 'setting_tile.dart';

class SetApiKeyTile extends StatelessWidget {
  const SetApiKeyTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<SettingsBloc>(),
      builder: (context, state) {
        if (state is SettingsChanged) {
          return SettingTile(
            title: 'Set Your API KEY',
            type: SettingsTileType.buttonType,
            onTapButton: () {
              TextEditingController apiKeyController = TextEditingController();
              apiKeyController.text = state.apiKey;
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Set API KEY'),
                    content: TextField(
                      controller: apiKeyController,
                      decoration: const InputDecoration(hintText: "Enter API KEY here"),
                      onTapOutside: (_) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    actions: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Save'),
                        onPressed: () {
                          context.read<SettingsBloc>().add(ChangeSettings(apiKey: apiKeyController.text.trim()));
                          HelperFunctions.showSnackBar(context, 'API KEY has been saved');
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
