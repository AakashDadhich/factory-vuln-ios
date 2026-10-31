import SwiftUI

struct ContentView: View {
    @State private var password = ""
    @State private var status = ""

    var body: some View {
        VStack(spacing: 12) {
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            Button("Sign in") {
                let digest = Credentials.hash(password)
                Session.save(token: digest)
                status = Session.save(secret: password) ? "Saved" : "Failed"
            }
            Text(status)
                .font(.footnote)
        }
        .padding(24)
    }
}
