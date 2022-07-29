# rento

A new Flutter project.

## Goals

1. Demonstrate usage of many state management in one project.

2. Demonstrate Offline First App without vendor locking.

3. Dark Theme / Light Theme Usage without checking current mode in widgets (e.g Automatic Text Color).

4. cross-platform app that respects native theme.

5. Plug and Play SQL and noSQL local storage support

6. Realtime communication without vendor locking

7. advantage of using c or rust library with dart ffi

8. 



## Rules

### State Management :

#### 1. Riverpod with ChangeNotifier

MVC pattern for Widget that mutate state. less boilerplate.

#### 2. Cubit

Large Logic that use BaseState. Preffered in most cases. Because of testability and reliability. but a lot of boilerplate.

#### 3. SetState

Simple Widget with simple mutation. usually has callback to expose value.
