import SwiftUI
import SwiftUIBindableRedux

struct Counter: View {
    @EnvironmentObject var store: CounterStore

    var toggleText: String {
        return store.state.isIncrementing ? "Increase" : "Decrease"
    }

    var updateCounter: Thunk<CounterStore> {
        Thunk<CounterStore> { dispatch, getState in
            let state = getState()
            var shouldChange = true
            if let numberLimit = Int(state.limitText) {
                shouldChange = state.isIncrementing ? state.count < numberLimit : state.count > numberLimit
            }

            if shouldChange {
                let action: ReduxAction = state.isIncrementing ? IncrementCount() : DecrementCount()
                dispatch(action)
            }
        }

    }

    var body: some View {
        VStack {
            Text("\(store.state.count)")
            HStack {
                Button(action: updateCount) {
                    Text("Update counter")
                }
                Spacer()
                Toggle(self.toggleText, isOn: $store.state.isIncrementing)
                    .frame(width: 150, height: 50, alignment: .trailing)
            }
            TextField("Enter number limit", text: $store.state.limitText)
                .keyboardType(.numberPad)
        }
        .padding()
    }

    func updateCount() {
        store.dispatch(updateCounter)
    }
}


struct Counter_Previews: PreviewProvider {
    static var previews: some View {
        Counter()
            .environmentObject(
                CounterStore.createStore(
                    reducer: CounterReducer.self,
                    preloadedState: nil
                ).initialize()
        )
    }
}
