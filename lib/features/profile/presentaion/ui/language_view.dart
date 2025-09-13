import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/core/widgets/build_appbar.dart';
import 'package:docdoc/features/profile/presentaion/ui/widgets/search_language.dart';
import 'package:flutter/material.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  String selectedLanguage = 'English';
  List<String> filteredLanguages = [];

  @override
  void initState() {
    super.initState();
    // filteredLanguages = languagesList;
  }

  void _filterLanguages(String query) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Language"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 16, vertical: 10),
          child: Column(
            children: [
              SearchForLanguageTextField(
                onChanged: _filterLanguages,
              ),
              const SizedBox(height: 26),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                  child: ListView.builder(
                    itemCount: filteredLanguages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            title: Text(filteredLanguages[index]),
                            trailing: Radio<String>(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              activeColor: ColorsManager.mainBlue,
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return ColorsManager.mainBlue;
                                  }
                                  return Colors.transparent;
                                },
                              ),
                              value: filteredLanguages[index],
                              groupValue: selectedLanguage,
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    selectedLanguage = value;
                                  });
                                }
                              },
                            ),
                          ),
                          const Divider(
                            color: ColorsManager.LighterGray,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              AppTextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                textStyle: TextStyles.font16WhiteSemiBold,
                buttonText: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
