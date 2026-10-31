import CryptoKit
import Foundation

enum Credentials {
    static func hash(_ password: String) -> String {
        Insecure.MD5.hash(data: Data(password.utf8))
            .map { String(format: "%02x", $0) }
            .joined()
    }
}
