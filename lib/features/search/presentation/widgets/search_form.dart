import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify/core/theme/widgets_themedata/input_decoration_theme.dart';
import 'package:shopify/core/utils/debouncer.dart';
import 'package:shopify/features/search/presentation/providers/search_provider.dart';

class SearchForm extends ConsumerStatefulWidget {
  const SearchForm({super.key});

  @override
  ConsumerState<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends ConsumerState<SearchForm> {
  Debouncer searchDebouncer = Debouncer();

  @override
  void dispose() {
    searchDebouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onChanged: (text) => onTextChange(text, ref),
        controller: ref.read(searchViewModelProvider.notifier).searchController,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Find something...",
          filled: false,
          border: secodaryOutlineInputBorder(context),
          enabledBorder: secodaryOutlineInputBorder(context),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () => clear(ref),
              child: SvgPicture.asset(
                "assets/icons/Close.svg",
                height: 24,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!.withValues(alpha: 0.3),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTextChange(String text, WidgetRef ref) {
    searchDebouncer(() {
      ref.read(searchViewModelProvider.notifier).search(text);
    });
  }

  void clear(WidgetRef ref) {
    ref.read(searchViewModelProvider.notifier).clearSearch();
  }
}
