# A. Srinidhi – Personal Portfolio

A responsive personal portfolio website built with **Flutter and Dart** for a UI internal exam.

## Pages
- Home Page
- About Me Page
- My Projects Page

## Projects
1. Content Moderation System
2. Weather Forecast App
3. MoviePick – Similar Movies Finder using Machine Learning

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

## Build the website

```bash
flutter build web --release
```

The production website will be generated inside:

```text
build/web
```

## GitHub Pages deployment

After pushing the project to GitHub, the Flutter web build can be deployed using GitHub Pages or another static hosting service.

## Personal photo

The current home page uses an `AS` initials avatar so the project works without any extra assets. To use a real profile photo, add the image under `assets/images/` and update `pubspec.yaml` and the `Avatar` widget in `lib/main.dart`.
