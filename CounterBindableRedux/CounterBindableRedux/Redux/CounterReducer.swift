import BindableSwiftUIRedux

enum CounterReducer: ReduxRootReducer {
    static func reduce(_ action: ReduxAction, state: CounterState) -> CounterState {
        let newState = state.deepcopy()

        switch action {
        case let action as UpdateBindingToggle:
            newState.$isIncrementing = action.state
            newState.$limitText = ""
        case let action as UpdateLimitText:
            newState.$limitText = action.state
        case is IncrementCount:
            newState.count += 1
        case is DecrementCount:
            newState.count -= 1
        default:
            break
        }

        return newState
    }
}
