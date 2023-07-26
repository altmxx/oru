# Oru Phones Assignment

This is the code repository for the oru phones assignment project.

## UI/UX Design

The UI/UX is the same as that of the original app to a great extent and in the scope of the assignment. I have used flutter_screen_util library to ensure that the design is made pixel perfect as per the figma design that I created to assist me with the padding and dimensions of the widgets. 

## State Management

Provider package was used to implement a good state management and over all rebuilding of widgets here and there.

## Memory optimization.

"const" keyword is used for most places wherever possible to enhance performance and reduce the unnecessary rebuilding of widgets. More over, proper disposal of text controllers is implemented to avoid memory leaks. In addition, API calls are kept properly in mind to avoid over burdening the server with API calls.

## Image Caching

cached_network_image package is used to ensure that the network images being fetched from the urls of internet is properly cached to avoid unnecessary downloads of images. 

To run and build the app, you can clone the repository and run 'flutter pub get'.
To create an APK of the app you can type "flutter build apk --no-tree-shake-icons"
