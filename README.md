# CounterBindableRedux

This is an example project demonstrating how to use the [SwiftUIBindableRedux](https://github.com/BenedictQ/SwiftUI-Bindable-Redux) package

## The app
The example is a simple counter app. The `Counter` view has a `Text `view to display the count, and a `Button` to update the count. It has two modes, controlled by a `Toggle` - incrementing the counter and decrementing the counter. A user can optionally add a limit to the count by typing in a numeric `TextField`. The limit is enforced by dispatching a `Thunk` which checks the value against the limit before dispatching an `Increment` or `Decrement` action.

This example demonstrates the usefulness of Redux, and the advanced capability provided by the way that my library integrating with SwiftUI databinding.
