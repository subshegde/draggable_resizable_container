
import 'package:flutter/material.dart';

/// A widget that represents a draggable and resizable container with customizable sections.
/// It allows the user to change its height by dragging the bottom handle and displays a list of items
/// with an optional action button for each item.
class DraggableResizableContainerSub extends StatefulWidget {
  final double? initialHeight;  // Initial height of the container
  final double? minHeight;  // Minimum height the container can be resized to
  final double headerHeight;  // Height of the header section
  final String headerText;  // Header text to be displayed in the container
  final List<Widget> items;  // List of widgets (items) to be displayed inside the container
  final Function(int)? onItemPressed;  // Callback function for when an item is pressed
  final double containerWidthFactor;  // Factor to determine container's width relative to screen width
  final String mode;  // Theme mode flag (light or dark)

  // Optional custom colors for different elements (if not provided, defaults based on modeFlag)
  final Color? headerColor;
  final Color? containerBackgroundColor;
  final Color? borderColor;
  final Color? shadowColor;
  final Color? dragHandleColor;
  final Color? actionButtonColor;
  final Color? actionButtonIconColor;
  final Color? cardColor;

  // Constructor to initialize all the properties of the DraggableResizableContainerSub widget
  const DraggableResizableContainerSub({
    Key? key,
    this.initialHeight,
    this.minHeight,
    this.headerHeight = 60,
    this.headerText = "Header Section",
    required this.items,
    this.onItemPressed,
    this.containerWidthFactor = 0.8,
    this.mode = 'light',  // Default mode is light
    this.headerColor,
    this.containerBackgroundColor,
    this.borderColor,
    this.shadowColor,
    this.dragHandleColor,
    this.actionButtonColor,
    this.actionButtonIconColor,
    this.cardColor,
  }) : super(key: key);

  @override
  _DraggableResizableContainerSubState createState() =>
      _DraggableResizableContainerSubState();
}

class _DraggableResizableContainerSubState
    extends State<DraggableResizableContainerSub> {
  // Internal state variables
  late double _containerHeight;
  late double _initialHeight;
  late double _dragStartPosition;
  late double _dragOffset;

  // Color variables based on the modeFlag or custom color settings
  late Color _headerColor;
  late Color _containerBackgroundColor;
  late Color _borderColor;
  late Color _shadowColor;
  late Color _dragHandleColor;
  late Color _actionButtonColor;
  late Color _actionButtonIconColor;
  late Color _cardColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    double screenHeight = MediaQuery.of(context).size.height;

    // Set initial height either from the parameter or use 50% of screen height as default
    _containerHeight = widget.initialHeight ?? screenHeight * 0.5;
    _initialHeight = _containerHeight;
    _dragStartPosition = 0;
    _dragOffset = 0;

    // Apply color settings based on the modeFlag or user-provided values
    if (widget.mode == 'dark') {
      _headerColor = widget.headerColor ?? Colors.black;
      _containerBackgroundColor = widget.containerBackgroundColor ?? Colors.grey[500]!;
      _borderColor = widget.borderColor ?? Colors.grey.shade700;
      _shadowColor = widget.shadowColor ?? Colors.black87;
      _dragHandleColor = widget.dragHandleColor ?? Colors.grey.shade800;
      _actionButtonColor = widget.actionButtonColor ?? Colors.blueAccent;
      _actionButtonIconColor = widget.actionButtonIconColor ?? Colors.white;
      _cardColor = widget.cardColor ?? Colors.grey.shade800;
    } else if (widget.mode == 'light') {
      _headerColor = widget.headerColor ?? Colors.blue;
      _containerBackgroundColor = widget.containerBackgroundColor ?? Colors.white;
      _borderColor = widget.borderColor ?? Colors.grey;
      _shadowColor = widget.shadowColor ?? Colors.black54;
      _dragHandleColor = widget.dragHandleColor ?? Colors.grey.shade300;
      _actionButtonColor = widget.actionButtonColor ?? Colors.blue;
      _actionButtonIconColor = widget.actionButtonIconColor ?? Colors.black;
      _cardColor = widget.cardColor ?? Colors.white;
    } else {
      // Fallback case if modeFlag is neither 'dark' nor 'light'
      _headerColor = widget.headerColor ?? Colors.blue;
      _containerBackgroundColor = widget.containerBackgroundColor ?? Colors.white;
      _borderColor = widget.borderColor ?? Colors.grey;
      _shadowColor = widget.shadowColor ?? Colors.black54;
      _dragHandleColor = widget.dragHandleColor ?? Colors.grey.shade300;
      _actionButtonColor = widget.actionButtonColor ?? Colors.blue;
      _actionButtonIconColor = widget.actionButtonIconColor ?? Colors.black;
      _cardColor = widget.cardColor ?? Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Return the widget UI
    return GestureDetector(
      // Gesture detection for vertical dragging
      onVerticalDragStart: (details) {
        _dragStartPosition = details.localPosition.dy;
      },
      onVerticalDragUpdate: (details) {
        setState(() {
          // Update container height based on drag offset
          _dragOffset = details.localPosition.dy - _dragStartPosition;
          _containerHeight = _initialHeight + _dragOffset;

          // Enforce minimum height constraint
          double screenHeight = MediaQuery.of(context).size.height;
          if (_containerHeight < (widget.minHeight ?? screenHeight * 0.2)) {
            _containerHeight = widget.minHeight ?? screenHeight * 0.2;
          }
        });
      },
      onVerticalDragEnd: (details) {
        // Reset the initial height after the drag operation
        _initialHeight = _containerHeight;
        _dragOffset = 0;
      },
      child: Container(
        width: screenWidth * widget.containerWidthFactor,  // Set width based on the containerWidthFactor
        height: _containerHeight,  // Set dynamic height
        decoration: BoxDecoration(
          color: _containerBackgroundColor,  // Set background color of the container
          borderRadius: BorderRadius.circular(12),  // Rounded corners for the container
          border: Border.all(color: _borderColor, width: 1),  // Border color and width
          boxShadow: [
            BoxShadow(
              color: _shadowColor,  // Shadow color
              blurRadius: 2,  // Blur radius
              spreadRadius: .1,  // Spread radius
            ),
          ],
        ),
        child: Column(
          children: [
            // Header Section
            Container(
              height: widget.headerHeight,  // Header section height
              decoration: BoxDecoration(
                color: _headerColor,  // Header color
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  widget.headerText,  // Header text
                  style: TextStyle(
                    color: _headerColor == Colors.black || _headerColor == Colors.white ? Colors.white : Colors.black,
                    fontSize: 18,  // Text size
                    fontWeight: FontWeight.bold,  // Bold text style
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    widget.items.length,
                    (index) => Container(
                      height: MediaQuery.of(context).size.height * 0.1,  // Item height dynamically based on screen height
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 1.0),  // Margin between items
                      child: Card(
                        color: _cardColor,  // Card background color
                        elevation: 4,  // Card elevation for shadow
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),  // Rounded corners for the card
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: widget.items[index],  // Display the widget item
                              ),
                            ),
                            // Action Button to trigger onItemPressed
                            IconButton(
                              icon: Icon(
                                Icons.more_horiz,  // Icon for the action button
                                color: _actionButtonIconColor,  // Action button icon color
                              ),
                              onPressed: () {
                                if (widget.onItemPressed != null) {
                                  widget.onItemPressed!(index);  // Call the onItemPressed callback
                                }
                              },
                              color: _actionButtonColor,  // Action button background color
                              splashRadius: 20,  // Splash radius for the icon button
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Drag handle at the bottom of the container
            Container(
              height: 12,  // Height of the drag handle area
              decoration: BoxDecoration(
                color: _dragHandleColor,  // Color of the drag handle
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
              ),
              child: const Center(
                child: Icon(
                  Icons.drag_handle,  // Icon for the drag handle
                  size: 24,  // Icon size
                  color: Colors.white,  // Icon color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
