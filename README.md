[![Contributors](https://img.shields.io/github/contributors/subshegde/draggable_resizable_container.svg?style=for-the-badge)](https://github.com/subshegde/draggable_resizable_container/graphs/contributors)

[![Forks](https://img.shields.io/github/forks/subshegde/draggable_resizable_container.svg?style=for-the-badge)](https://github.com/subshegde/draggable_resizable_container/network/members)

[![Stargazers](https://img.shields.io/github/stars/subshegde/draggable_resizable_container.svg?style=for-the-badge)](https://github.com/subshegde/draggable_resizable_container/stargazers)

[![Issues](https://img.shields.io/github/issues/subshegde/draggable_resizable_container.svg?style=for-the-badge)](https://github.com/subshegde/draggable_resizable_container/issues)

[![LinkedIn](https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555)](https://linkedin.com/in/subrahmanya-s-hegde-2329112a2)

[![Instagram](https://img.shields.io/badge/-Instagram-black.svg?style=for-the-badge&logo=instagram&colorB=555)](https://instagram.com/_ss_hegde)

[![GitHub](https://img.shields.io/badge/-GitHub-black.svg?style=for-the-badge&logo=github&colorB=555)](https://github.com/subshegde)

[![YouTube](https://img.shields.io/badge/-YouTube-black.svg?style=for-the-badge&logo=youtube&colorB=555)](https://youtube.com/@sshegde.visuals)


# Draggable Resizable Container

**Draggable & Resizable Container**: 
  - The core feature of this package is a customizable container that allows users to change its height by dragging the bottom handle. It can be resized vertically, providing a dynamic and interactive user experience.

**Customizable Header**:
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




## About The Project

A Flutter package that provides a customizable, draggable, and resizable container. This container allows users to interact with a list of items, drag to resize, and supports both light and dark themes. It's ideal for creating dynamic, user-friendly interfaces with customizable sections.

## Getting Started

To use the `draggable_resizable_container` package in your Flutter project, follow these steps:

### Prerequisites
Ensure you have the following installed on your system:
* [Flutter](https://flutter.dev/docs/get-started/install)
* [Dart](https://dart.dev/get-dart)

### Installation
1. Add the package dependency in your `pubspec.yaml` file:
    ```yaml
    dependencies:
      draggable_resizable_container:
    ```

2. Install the dependencies by running the following command:
    ```bash
    flutter pub get
    ```

3. Import the package into your Dart file:
    ```dart
    import 'package:draggable_resizable_container/draggable_resizable_container.dart';
    ```

## Usage

Here’s how to integrate the `DraggableResizableContainerSub` widget into your Flutter app:

## Demo Video
[![YouTube](https://img.shields.io/badge/-YouTube-black.svg?style=for-the-badge&logo=youtube&colorB=555)](https://youtu.be/EilX-RuSG80?si=znDYudker77GpdlZ)


```dart
import 'package:flutter/material.dart';
import 'package:draggable_resizable_container/draggable_resizable_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Draggable Resizable Container Example')),
        body: Center(
          child: DraggableResizableContainerSub(
            headerText: 'My Custom Container',
            items: List.generate(10, (index) {
              return Container(
                color: Colors.blueAccent,
                child: Center(child: Text('Item $index', style: TextStyle(color: Colors.white))),
              );
            }),
            onItemPressed: (index) {
              print('Item $index pressed!');
            },
          ),
        ),
      ),
    );
  }
}
```
## 🚀 About Me
I'm Subrahmanya S. Hegde, a mobile app developer with expertise in Flutter and React Native, passionate about building high-performance, cross-platform applications. With skills in Kotlin, Node.js, Firebase, and Supabase, I create end-to-end solutions that deliver seamless user experiences.

I hold an MCA degree from MIT Manipal and have a strong passion for exploring new technologies. I am also a strong advocate of using Git and GitHub for version control and collaboration.

Let’s build something great together! 
#### Happy Coding!


## Authors

- [@subshegde](https://www.github.com/subshegde)


## Feedback

If you have any feedback, please reach out to us at subrahmanya460@gmail.com

