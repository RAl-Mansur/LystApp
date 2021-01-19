# Lyst App

## Approach

I decided to go with a MVVM with coordinator architecture pattern. I chose this as the app was quite straightforward and didn't need to be over engineered by using a pattern like VIPER. Also, using Protocol Oriented Programming with MVVM allows more testable code which would be harder to achieve if I had gone for the basic MVC pattern.

I've decided to mainly do the UI layout in code, apart from the UICollectionViewCell which was laid out in a xib file. I decided this as it's much easier to read and see where each view has been positioned.

## Current Limitations

- Code not fully tested. I tried adding some tests to the CatBreedsViewController and its components, but didn't have time to add tests on the CatBreedDetails screen.
- UI Design could be improved. I didn't want to spend too much time coming up with the UI so I decided to go with a very basic UI. I tried adding a bit of animation when the user taps on the collection view cell.

## Known Issues

- Navigation Bar is buggy on the list screen. When dragging down the nav bar the background colour doesn't expand with the title.
- Collection view on the CatBreedsViewController doesn't look like an organised grid on an iPhone 8 size device. Instead of hard coding the size of the collection view cell I could set the size so that it's dynamic and relative to the screen size.
