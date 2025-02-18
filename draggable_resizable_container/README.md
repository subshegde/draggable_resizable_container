<!-- Improved compatibility of back to top link -->
<a id="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Contributors](https://img.shields.io/github/contributors/subshegde/draggable_resizable_container.svg?style=for-the-badge)](https://github.com/subshegde/draggable_resizable_container/graphs/contributors)

[![Forks](https://img.shields.io/github/forks/subshegde/draggable_resizable_container.svg?style=for-the-badge)](https://github.com/subshegde/draggable_resizable_container/network/members)

[![Stargazers](https://img.shields.io/github/stars/subshegde/draggable_resizable_container.svg?style=for-the-badge)](https://github.com/subshegde/draggable_resizable_container/stargazers)

[![Issues](https://img.shields.io/github/issues/subshegde/draggable_resizable_container.svg?style=for-the-badge)](https://github.com/subshegde/draggable_resizable_container/issues)

[![License](https://img.shields.io/github/license/subshegde/draggable_resizable_container.svg?style=for-the-badge)](https://github.com/subshegde/blob/master/LICENSE.txt)

[![LinkedIn](https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555)](https://linkedin.com/in/subrahmanya-s-hegde-2329112a2)

[![Instagram](https://img.shields.io/badge/-Instagram-black.svg?style=for-the-badge&logo=instagram&colorB=555)](https://instagram.com/_ss_hegde)

[![GitHub](https://img.shields.io/badge/-GitHub-black.svg?style=for-the-badge&logo=github&colorB=555)](https://github.com/subshegde)

[![YouTube](https://img.shields.io/badge/-YouTube-black.svg?style=for-the-badge&logo=youtube&colorB=555)](https://youtube.com/c/your_youtube_channel)

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/subshegde/draggable_resizable_container">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>


<h3 align="center">Draggable Resizable Container</h3>

  <p align="center">
    A customizable, draggable, and resizable Flutter container that supports light and dark themes.
    <br />
    <a href="https://github.com/subshegde/draggable_resizable_container"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/subshegde/draggable_resizable_container">View Demo</a>
    &middot;
    <a href="https://github.com/subshegde/draggable_resizable_container/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    &middot;
    <a href="https://github.com/subshegde/draggable_resizable_container/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#customization">Customization</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

A Flutter package that provides a customizable, draggable, and resizable container. This container allows users to interact with a list of items, drag to resize, and supports both light and dark themes. It's ideal for creating dynamic, user-friendly interfaces with customizable sections.

### Built With

* [Flutter](https://flutter.dev/)
* [Dart](https://dart.dev/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

To use the `draggable_resizable_container` package in your Flutter project, follow these steps:

### Prerequisites

Ensure you have the following installed on your system:
* [Flutter](https://flutter.dev/docs/get-started/install)
* [Dart](https://dart.dev/get-dart)

### Installation

1. Add Get to your `pubspec.yaml` file::

    ```yaml
    dependencies:
      draggable_resizable_container:
    ```

2. Install the dependencies by running the following command:

    ```bash

    flutter pub get
    ```
3. Import the package:

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

Here’s how to integrate the `DraggableResizableContainerSub` widget in your Flutter app:

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
