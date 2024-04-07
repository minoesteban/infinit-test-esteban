# infinit_test_esteban

Author: `Esteban Miño`
Flutter version: `3.19.5` - also compatible with any version above `3.16`
Platforms: `iOS`, `Android`

## Before starting the app

Before running, trigger `build_runner` to generate all necessary files

Use the command `flutter pub run build_runner build --delete-conflicting-outputs`

## How to run

If using VSCode, use any of the run modes provided in `.vscode/launch.json`

If running via CLI, run `flutter run ios`

For guaranteed results it is advised to run on `iOS Emulator or Device` - to ensure Gemini API works properly

## Considerations

- There are API Keys exposed in the codebase. Steps were taken to ensure no major risk comes from this, but was done like this to allow you to run the app should you wish to
- They are configured so that only this app can use them, and will be valid for 2 weeks from now

- App file structure designed following `Clean Architecture`
- For data handling, I used `DTOs` (Data Transfer Objects) to translate remote API entities into app entities
- Any remote data source (in this case, Gemini API) is consumed by a `DataSource`. These know the required query structure, and can translate results into `DTOs`
- `DataSources` in turn are used by and return these `DTOs` to the `Repositories`, which handle the translation into app-specific entities
- `Repositories` are used by `UseCases`, which reflect entire bussiness use cases / flows, gather all required data and return whatever they are expected to return
- These `UseCases` are consumed by each of the `Screens` providers, handling loading and idle states for the UI to react to

- As the task required a `paginated` list, I chose to implement a simulation of it by just triggering the query each time the page changed (similar to what a query with pagination would achieve), to showcase state changes triggered by pagination buttons, loading and finally idle states with new results

- Considering the data source was flexible enough, I decided instead of using a public API, to just ask `Gemini API` to return a representative data structure for each page so the focus could be kept to the mentioned relevant aspects (data and state management).
