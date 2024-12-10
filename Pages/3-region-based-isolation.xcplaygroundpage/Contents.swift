//引用: [https://github.com/swiftlang/swift-evolution/blob/main/proposals/0414-region-based-isolation.md]

class Client {
    var name: String
    var initialBalance: Double
    
    init(name: String, initialBalance: Double) {
        self.name = name
        self.initialBalance = initialBalance
  }
}

actor ClientStore {
    var clients: [Client] = []

    static let shared = ClientStore()

    func addClient(_ c: Client) {
        clients.append(c)
    }
}

func openNewAccount(name: String, initialBalance: Double) async {
    let client = Client(name: name, initialBalance: initialBalance)
    await ClientStore.shared.addClient(client)
    //print(client.name)
}
