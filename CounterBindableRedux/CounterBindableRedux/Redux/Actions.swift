import BindableSwiftUIRedux

struct UpdateBindingToggle: BindingUpdateAction {
    let state: Bool
}

struct UpdateLimitText: BindingUpdateAction {
    let state: String
}
struct IncrementCount: ReduxAction { }

struct DecrementCount: ReduxAction { }
