import SwiftUIBindableRedux

enum LoggingMiddleware: Middleware {
    typealias Store = CounterStore
    static var middleware: Store.Middleware {
        return { (dispatch: Dispatch, getState: @escaping () -> CounterState) in
            return { (next: @escaping Dispatch) in
                return { (action: ReduxAction) in
                    print("Logging state")
                    print(getState())
                    next(action)
                    print(getState())
                    print("End logging state")
                }
            }
        }
    }
}
