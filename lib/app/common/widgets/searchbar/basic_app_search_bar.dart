import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../core/config/themes/app_colors.dart';

class BasicAppSearchBar extends StatefulWidget {
  final String hintText;
  final Color backgroundColor;
  final double width;
  final Duration transitionDuration;
  final Duration debounceDelay;
  final double axisAlignment;
  final BorderRadius borderRadius;
  final Function(String) onQueryChanged;
  final List<String> suggestions;
  final Widget Function(BuildContext context, Animation<double> transition)
      searchResultsBuilder;

  const BasicAppSearchBar({
    super.key,
    this.hintText = 'Cari...',
    this.backgroundColor = AppColors.lightBackgroundColor,
    this.width = 600,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.debounceDelay = const Duration(milliseconds: 500),
    this.axisAlignment = 0.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(28)),
    required this.onQueryChanged,
    required this.suggestions,
    required this.searchResultsBuilder,
  });

  @override
  _BasicAppSearchBarState createState() => _BasicAppSearchBarState();
}

class _BasicAppSearchBarState extends State<BasicAppSearchBar> {
  List<String> filteredSuggestions = [];

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      onFocusChanged: (isFocused) async {},
      automaticallyImplyBackButton: false,
      leadingActions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
      ],
      backgroundColor: widget.backgroundColor,
      hint: widget.hintText,
      scrollPadding: const EdgeInsets.only(
        top: 16,
        bottom: 56,
      ),
      transitionDuration: widget.transitionDuration,
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: widget.axisAlignment,
      openAxisAlignment: widget.axisAlignment,
      width: widget.width,
      debounceDelay: widget.debounceDelay,
      borderRadius: widget.borderRadius,
      onQueryChanged: (query) {
        widget.onQueryChanged(query);

        setState(() {
          if (query.isEmpty) {
            filteredSuggestions = [];
          } else {
            filteredSuggestions = widget.suggestions
                .where((suggestion) =>
                    suggestion.toLowerCase().contains(query.toLowerCase()))
                .toList();
          }
        });
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: Container(),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (filteredSuggestions.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Material(
                  color: Colors.white,
                  elevation: 4.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: filteredSuggestions.map((suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                        onTap: () {
                          widget.onQueryChanged(suggestion);

                          setState(() {
                            filteredSuggestions = [];
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            if (filteredSuggestions.isEmpty)
              widget.searchResultsBuilder(context, transition),
          ],
        );
      },
    );
  }
}
