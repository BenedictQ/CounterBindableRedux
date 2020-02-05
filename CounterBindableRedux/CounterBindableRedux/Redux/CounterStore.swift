import SwiftUIBindableRedux
import Combine

final class CounterStore: ReduxStore {
    typealias Reducer = CounterReducer

    lazy var storedDispatch: Dispatch = defaultDispatch
    var state: CounterState
    var objectWillChange = ObservableObjectPublisher()

    init(state: CounterState?) {
        self.state = state ?? CounterState()
    }
}
