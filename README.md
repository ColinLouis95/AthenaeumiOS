# Athenaeum
A simple iOS app for managing passwords.

![Swift Version](https://img.shields.io/badge/Swift-5-orange)
![iOS](https://img.shields.io/badge/iOS-17%2B-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## Disclaimer

## Table of Contents
- [Setup](#setup)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [Contact](#contact)
- [Screenshots of Athenaeum](#screenshots-of-athenaeum)

## Setup
Clone the repository:

```bash 
git clone https://github.com/ColinLouis95/AthenaeumiOS.git
```
1. Open Xcode
2. Open Existing Project...
3. Navigate to where you cloned the repository.
4. Note: This project currently has been built using Xcode version 15.4, Swift 5, and iOS 17.5

## Usage
1. In Xcode, navigate to the Product tab.
2. Click on Run to build the project and run the simulator.
3. Once the simulator is running the app, all functionality will be live through the simulator. Currently testing has been done on an iPhone 15.
4. To safely close out the simulator, it is recommended to press the Home button on the simulator before existing to prevent crashing.

## Project Structure
```
├── Athenaeum
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   └── Contents.json
│   │   ├── welcome.imageset
│   │   │   ├── Contents.json
│   │   │   └── welcome.png
│   │   └── Contents.json
│   ├── Models
│   │   ├── User.swift
│   │   └── UserInfo.swift
│   ├── Preview Content
│   │   └── Preview Assets.xcassets
│   │       └── Contents.json
│   ├── Resources
│   │   ├── About Athenaeum.png
│   │   ├── About.txt
│   │   ├── Adding Password.png
│   │   ├── New User View.png
│   │   ├── Password Home.png
│   │   ├── Passwords View.png
│   │   └── Sorting Password.png
│   ├── Views
│   │   ├── AboutView.swift
│   │   ├── GroupView.swift
│   │   ├── LoginView.swift
│   │   └── NewUserView.swift
│   ├── AthenaeumApp.swift
│   └── ContentView.swift
└── Athenaeum.xcodeproj
    ├── project.xcworkspace
    │   ├── xcshareddata
    │   │   ├── swiftpm
    │   │   │   └── configuration
    │   │   └── IDEWorkspaceChecks.plist
    │   ├── xcuserdata
    │   │   └── colinkugler.xcuserdatad
    │   │       └── UserInterfaceState.xcuserstate
    │   └── contents.xcworkspacedata
    ├── xcuserdata
    │   └── colinkugler.xcuserdatad
    │       ├── xcdebugger
    │       │   └── Breakpoints_v2.xcbkptlist
    │       └── xcschemes
    │           └── xcschememanagement.plist
    └── project.pbxproj
```

## Contributing
Contributions are welcome! Please:
1. Fork the repo
2. Create a new branch named after issue/feature you want to contribute to.
3. Commit your changes.
4. Push to the branch.
5. Submit a Pull Request.
   
> [!IMPORTANT]
> Please keep your pull requests small and dedicated to one task or issue. This will help me review and merge your contributions!

If your contribution is a new feature, please open an issue and tag it as _enhancement_.

## Contact
You can contact me here or through email at kuglercolin4@gmail.com

## Screenshots of Athenaeum
- Home Menu Screen
![Screenshot of the Home Menu Screen in Athenaeum.](/Athenaeum/Resources/Home.png)

- New User Screen
![Screenshot of the New User Screen in Athenaeum.](/Athenaeum/Resources/NewUser.png)

- New Password Screen
![Screenshot of adding a new Password.](/Athenaeum/Resources/AddingPassword.png)

- Sorting Screen
![Sreenshot of sorting passwords.](/Athenaeum/Resources/Sorting.png)

