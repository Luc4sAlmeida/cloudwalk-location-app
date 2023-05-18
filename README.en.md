## cloudwalk-location-app
[![pt-br](https://img.shields.io/badge/lang-pt--br-green.svg)](https://github.com/Luc4sAlmeida/cloudwalk-location-app#readme)

<p align="center">
  <img src="https://i.imgur.com/GWsaTdW.png">
  <img src="https://i.imgur.com/OhLB6Iq.gif">
</p>

## Note
For presentation purposes, I used a **monorepo** with all the necessary repositories.

The proposal of the architecture for this project is to divide the layers and functionalities as much as possible, aiming for a better workflow and avoiding conflicts among developers or teams.

Due to the limited time to complete this project, it was not possible to strictly adhere to the GitFlow for task completion. Therefore, an example [#Issue](/../../issues/1) will be created to demonstrate knowledge.

## Considerations
+ Scalable multi-modular approach.
+ Clean Architecture and its unit tests in all layers.
+ Good Git practices. (GitFlow, Atomic commits, Semantic commits)

## Future improvements
+ Robust implementation of navigation between features.
+ Add Git Workflows to ensure project integrity and health.
+ Create a core-ui module for creating shared components across features.

## Multi-modular Architecture

The architecture has been carefully designed to promote healthy and scalable development, enabling collaboration between multiple developers or teams.

To ensure the success of this architecture, there are some key modules:

+ **Core**: This module defines rules and standards that must be followed by all modules. It establishes a solid foundation for consistent and coherent development.

+ **Client**: In this module, the connection is established and all the necessary configurations for executing the features are defined.

+ **Navigator**: The module acts as a route exhibitor. Here, each team can register the routes that are open and available to be used by other features. This facilitates communication and integration between different parts of the system.

+ **Feature**: This module is dedicated to each specific functionality of the project. Here, each team has the freedom to choose the development pattern that best suits their feature. This allows customization and adaptation of each functionality according to their specific needs and requirements.

**Explanatory image**: 

![alt](https://i.imgur.com/w1mcqmg.png)

## Feature Home
This feature has the sole responsibility of navigating the user to the **feature-location**. In this example, you can observe how the navigation from one feature to another is done.

A Clean Architecture pattern was used, but without its domain and data layers, as we only have visualization and execution of a single event that does not qualify as a **use case**.

The general idea of the feature is to be able to connect different features and also have its own responsibilities, such as data preview.

## Feature Location

The technical objective of this feature is to be the example feature for the entire architecture, using Clean Architecture.

The chosen architecture is based on flexibility, meaning this module can easily adapt to changes (contract changes, complete screen changes, changes in data storage behavior). Another important point is that it can be easily unit tested in its main layers.

## Git/Github

To follow current development best practices, certain development patterns have been followed:

+ Every code change should come from an open Issue or a task management software.

+ Commits should always use semantic/conventional commits to maintain a clear and easily understandable track of what was being done.

+ Commits should always follow the pattern of Atomic Commits (without leaving things half-done).

## Necessary project setup

To run the project, you need to perform the following configurations:

Navigate to the project repository folder and then access the following file:

**iOS**:
```
client/ios/Runner/AppDelegate.swift
```

**Android**:
```
client/android/app/src/main/AndroidManifest.xml
```

In the respective file, insert your **API Key**.

**iOS**:

```bash
GMSServices.provideAPIKey("ApiKEY")
```

**Android**:

```bash
<meta-data android:name="com.google.android.geo.API_KEY" 
android:value="ApiKEY"/>
```

## Before running the project
If you are testing the application on iOS and have an ARM-based Apple machine, follow these steps before initializing the project:

1. Open your terminal.
2. Navigate to the folder of your project.
3. Access the "client" folder.
4. Access the "iOS" folder.
5. Run the following command:

```bash
arch --x86_64 pod install --repo-update
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
