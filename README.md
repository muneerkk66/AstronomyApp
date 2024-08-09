# Astronomy App
## Cosmic View
Explore the universe with CosmicView, your gateway to NASA's Astronomy Picture of the Day (APOD). Discover breathtaking images and videos of space phenomena, complete with detailed explanations, all at your fingertips.

## Getting Started
### Environment Dependencies
- Xcode 15+
- iOS 16+
- SwiftUI

  
### Project Setup
1. Clone the repository.
2. Finally, navigate to the root folder run Xcode
<br><br>


## How to use app
Open the app to explore single view: the view displays the current picture of the day. you can easily browse the cosmos by date, ensuring you never miss a moment of the universe's beauty. 

### App Video
![Alt text](README_FILES/App.gif?raw=true "Astronomy App")

## Project Structure
iOS Project implemented with Clean Layered Architecture and MVVM-Coordinator pattern. 

## Layers
* **Domain Layer** = Entities + Use Cases + Repositories Interfaces
* **Data Repositories Layer** = Repositories Implementations + API (Network)
* **Presentation Layer (MVVM)** = ViewModels + Views

### Dependency Direction
![Alt text](README_FILES/CleanArchitectureDependencies.png?raw=true "Modules Dependencies")



* **AstronomyApp**(iOS Project): This folder contains the resources, source files and all other miscellaneous files to build the iOS project. This folder is further branched into:
	 The app is completely written in SwiftUI/Combine.
	 
	 
### Folder Structure

```markdown
📦PingMaster
┣ 📂Application
┃ ┗ 📂DI
┣ 📂Data
┃ ┣ 📂Mapper
┃ ┣ 📂Network
┃ ┣ 📂Persistence
┃ ┣ 📂DataSource
┃ ┗ 📂Repositories
┣ 📂Domain
┃ ┣ 📂Interfaces
┃ ┣ 📂Entities
┃ ┗ 📂UseCase
┣ 📂Presentation
┃ ┣ 📂ReusableViews
┃ ┣ 📂AppCoordinator
┃ ┣ 📂Screens
┃ ┃ ┣ 📂Home
┃ ┃ ┃ ┣ 📂Coordinator
┃ ┃ ┃ ┣ 📂ViewModels
┃ ┃ ┃ ┗ 📂Views
┗ 📜AstronomyAppApp.swift => The app entry point.

```

## Includes
* Display Astronomy picture of the day View

## Strings
*  Strings are added into catalog


## What needs to be improved ##
### Required
1. Improve UI test coverage.
2. Improve unit test coverage.
3. Add Snapshot testing.
4. Integrate Analytics.
5. Integrate A/B testing
5. Add [Circuit Breaker](https://medium.com/@gitaeklee/ios-circuitbreaker-with-swift-and-async-await-dbbb2a0cddc3) for handling network resilience.

### Tools have the capacity to be incorporated.
 1. - [Arkana](https://github.com/rogerluan/arkana) is used to handle/manage/store project keys secretely.
Arkana requires the declaration of a YAML config file, named e.g. `.arkana.yml` that lists the keys (names) and an `.env` (e.g. `.env.arkana`) file that stores the values for the keys stored in the YAML file. Since the `.env.arkana` file contains the actual values of the secrets, it should be stored locally and never be checked-in to the repository (It has already been added to `.gitignore`).
2. - [SwiftGen](https://github.com/SwiftGen/SwiftGen) is a tool allowing to parse the app's various assets (including but not limited to xibs, storyboards, fonts, assets library, strings file, etc). This app is built to use SwiftGen to generate 3 kinds of compile-time constants related to:
3. - [SwiftLint](https://github.com/realm/SwiftLint/) is a tool that parses `swift` files, and output warnings when a code-smell is identified. Sometimes, SwiftLint outputs warnings for desired code, and in these cases the warnings may be disabled in code.  
