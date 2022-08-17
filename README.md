# rento

A Rent App.

Currently on experimental stage. trying different packages to fit the requirements.

## Requirements

1. Use Riverpod for state management

2. User can change Dark Theme / Light Theme / Material You.

3. Target Android , ios, Linux, Windows, and Mac OS. (optional) Web

4. First Class Accessibility

5. Use Supabase or Firebase, and use serverless such as cloud function.

6. Adaptive and responsive

7. Offline support

## Rules

### State Management

#### 1. Riverpod with ChangeNotifier

for reactive Widget that mutate state. less boilerplate.

#### 2. Riverpod with StateNotifier

for other things. preferred to use StateNotifier.

## Setup

### firebase

`flutterfire configure --project=YOUR-PROJECT-ID`

### drift

`flutter pub run build_runner build`

or watch

`flutter pub run build_runner watch`
