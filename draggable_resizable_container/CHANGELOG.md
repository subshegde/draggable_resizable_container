## 0.0.1 - Initial Release

### Functionality:
- **Draggable & Resizable Container**: 
  - The core feature of this package is a customizable container that allows users to change its height by dragging the bottom handle. It can be resized vertically, providing a dynamic and interactive user experience.
  
- **Customizable Header**:
  - The container includes a header section that is customizable for the title or header text. The header height, background color, and text styling can be easily adjusted to fit the design of your app.
  
- **Item List**:
  - Inside the container, you can display a list of widgets or items. Each item can be customized, and you can add interactivity to each item via a callback (`onItemPressed`). This allows you to handle events when users interact with the items, like showing a menu, expanding content, or navigating to a new screen.
  
- **Theming Support**:
  - The package provides support for both light and dark modes via a `modeFlag`. This allows the container to adapt to the system's theme or any custom theme you define. The colors for various elements (e.g., header, background, borders) can either be set explicitly or automatically chosen based on the selected theme.
  
- **Resizable with Minimum Height**:
  - The container height can be adjusted, but it has a minimum height that ensures the container doesn't collapse beyond a certain point. This minimum height can be set by the developer.

- **Drag Handle**:
  - A small drag handle at the bottom of the container allows users to resize it by dragging. The appearance of the drag handle (color and size) is customizable.

### Key Features:
- **Customizable Design**: 
  - Users can customize the container's width, header, background color, border, shadow, card color, action button color, and more.
  
- **Interaction Handling**: 
  - Each item in the container has an action button (`more_horiz` icon) that allows users to interact with the item, triggering the `onItemPressed` callback.

- **Scrollability**:
  - The container supports scrolling when the list of items exceeds the visible space, ensuring that content can be scrolled vertically.

---
