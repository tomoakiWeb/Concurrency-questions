final class Counter {
    var value: Int = 0
}

func run() {
    let counter: Counter = .init()

    Task {
        counter.value = 1
    }

    Task {
        print(counter.value)
    }
}

run()
