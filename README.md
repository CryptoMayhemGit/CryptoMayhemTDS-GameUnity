# Overview
This project is a Unity game involving player interactions, animations, and various components that manage the player's behavior within the game. The code is written in C# 9.0, targeting .NET Framework 4.7.1.

## Table of Contents
- [Overview](#overview)
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Key Components](#key-components)
  - [UIPlayer](#uiplayer)
  - [UISetTournamentData](#uisettournamentdata)
  - [PlayerContainer](#playercontainer)
  - [CharacterContainer](#charactercontainer)
  - [PlayerAnimationController](#playeranimationcontroller)
  - [PlayerCannonRotate](#playercannonrotate)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

### Prerequisites
To run and develop this project, you will need the following:

- Unity Engine (compatible with .NET Framework 4.7.1)
- .NET Framework 4.7.1
- C# 9.0 support

## Project Structure
```
Assets/
├── Scripts/
│   ├── UI/
│   │   ├── UIPlayer.cs
│   │   ├── UISetTournamentData.cs
│   ├── Containers/
│   │   ├── PlayerContainer.cs
│   │   └── CharacterContainer.cs
│   ├── Animations/
│   │   └── PlayerAnimationController.cs
│   ├── Cannon/
│       └── PlayerCannonRotate.cs
```

## Key Components

### UIPlayer
The `UIPlayer` is an abstract class responsible for managing UI elements related to the player. It listens for changes in the `PlayerContainer` and updates the UI accordingly.

**Features:**
- Monitors player state changes using a `PlayerContainerVariable`.
- Activates or deactivates UI elements based on the player's presence.
- Contains abstract methods `Enable` and `Disable` for custom UI behavior when the player is spawned or despawned.

### UISetTournamentData
The `UISetTournamentData` class is responsible for fetching and displaying active tournament data in the game UI.

**Features:**
- Sends a web request to retrieve the current active tournament information.
- Updates UI text elements with the tournament name and duration.
- Stores tournament parameters such as health points, movement speed, and shield points using `PlayerPrefs`.
- Processes quest details related to the tournament and saves them for gameplay use.

### PlayerContainer
The `PlayerContainer` class inherits from `CharacterContainer` and aggregates all player-specific components.

**Features:**
- Manages player inventory, items, passives, input, movement, and state machine.
- Contains components for player attack, interactions, fuel management, and animations.
- Handles spawning and despawning events for the player character.
- Provides access to the player's model and visual effects like trail rendering.

### CharacterContainer
The `CharacterContainer` serves as a base class for all character types in the game, providing common properties and methods.

**Features:**
- Manages fundamental character attributes like size, transform, rigidbody, stats, and health.
- Includes cooldowns, effects, skills, and sounds associated with the character.
- Handles movement blocking factors and attack permissions.
- Contains events for character spawning and despawning.

### PlayerAnimationController
The `PlayerAnimationController` is responsible for controlling the player's animations.

**Features:**
- Initializes and manages the player's animator components.
- Handles animation states for movement, dashing, idling, landing, death, and shooting.
- Updates animations based on player input and state changes.
- Integrates weapon animations with the main character animations.

### PlayerCannonRotate
The `PlayerCannonRotate` class manages the rotation of the player's cannon weapon.

**Features:**
- Rotates the cannon based on target positions.
- Calculates rotation angles and applies them to the cannon's transform.
- Smoothens rotation movements for better visual effects.
- Works in conjunction with player input to aim accurately.

## Contributing
1. Fork the repository.
2. Create a new branch:
git checkout -b feature-branch
3.	Commit your changes:
git commit -am 'Add new feature'
4.	Push to the branch:
git push origin feature-branch
5.	Open a Pull Request.

## License
This project is licensed under the MIT License. The license belongs to Mayhem Games OÜ.