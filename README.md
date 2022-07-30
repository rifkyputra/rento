# rento

A Rent App.

## Goals

1. Demonstrate usage riverpod

2. Demonstrate Offline First App without vendor locking.

3. Dark Theme / Light Theme Usage without checking current mode in widgets (e.g Automatic Text Color).

4. cross-platform app that respects native theme.

5. Plug and Play SQL and noSQL local storage support

6. Realtime communication without vendor locking or tied to one protocol (grpc, trpc, mqtt, websocket, Firebase Realtime DB etc.)

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
