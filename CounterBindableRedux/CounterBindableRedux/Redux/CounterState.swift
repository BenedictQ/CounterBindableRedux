import BindableSwiftUIRedux

final class CounterState: ReduxRootState {
    typealias Store = CounterStore

    var count = 0
    @ReduxBindable<CounterStore, Bool, UpdateBindingToggle> var isIncrementing = true
    @ReduxBindable<CounterStore, String, UpdateLimitText> var limitText = ""

    func deepcopy() -> CounterState {
        let newState = CounterState()
        newState.count = self.count
        newState._isIncrementing = _isIncrementing
        newState._limitText = _limitText
        return newState
    }

    func initialize(store: CounterStore) {
        _isIncrementing.store = store
        _limitText.store = store
    }
}
