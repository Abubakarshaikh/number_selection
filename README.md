## Flutter Animation Game with Number Selection
This is a mobile game developed using Flutter that involves animation and requires players to select numbers in a specific sequence. The game features smooth animations, a scoring system, and a timer to create an engaging and challenging gameplay experience.

## Installation
To run this project, you need to have the following prerequisites installed:

Flutter SDK (version 2.0.6 or later)
Android Studio or Xcode (for mobile development)

Follow these steps to set up the project:

1. Clone the repository:
```
git clone https://github.com/your-username/flutter-animation-game.git
```

2. Navigate to the project directory:

```
cd flutter-animation-game
```
3. Install the required dependencies:
```
flutter pub get
```
4. Run the app on your preferred platform:
```
# For Android
flutter run --release

# For iOS
flutter run --release --no-codesign
```
## Dependencies
This project uses the following external packages:

`just_audio: ^0.9.37` - For playing audio assets (sound effects)
`flutter_bloc: ^8.1.5` - For state management using the Provider pattern
`collection: ^8.1.5` - For filtring list
`equatable: ^8.1.5` - For object compare

## Usage
To start the game, simply run the app on your mobile device or emulator/simulator. The game interface will appear with a game board, number selection area, score display, and timer.

Interact with the game by tapping on the numbers in the correct sequence as they appear and move around the game board. The game will keep track of your score and the remaining time.

## Game Rules

- Random numbers will appear and animate on the game board.
- Players must tap on the numbers in the correct ascending sequence (e.g., 1, 2, 3, 4, ...).
- Each correct selection awards points to the player's score.
- Incorrect selections will result in penalties or game over (configurable).
- The game timer limits the gameplay duration, adding a sense of urgency.


## State Management
This project uses the flutter_bloc package for state management, following the bloc pattern. The game state is managed by a HomeCubit class, which handles updates to the score, timer, and game progression.

## Animation Implementation
The number animations (appearance, movement, and disappearance) are implemented using Flutter's built-in animation widgets and controllers. The AnimatedPositioned widget is used to animate the position of the numbers on the game board.


## Optimization and Performance
To optimize animations and UI rendering for smooth performance, the following techniques were employed:

- Minimizing unnecessary rebuilds by separating stateful and stateless widgets.
- Optimizing widget trees and reducing layout thrashing.
- Profiling and addressing performance bottlenecks using the Flutter DevTools.

## Future Improvements

- Implement difficulty levels with varying number sequences and time constraints.
- Add online leaderboards and multiplayer functionality.
- Incorporate achievement systems and rewards for player progression.

THANK YOU