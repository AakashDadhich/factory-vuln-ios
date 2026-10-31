import Foundation
import Security

enum Session {
    static func save(token: String) {
        UserDefaults.standard.set(token, forKey: "authToken")
    }

    @discardableResult
    static func save(secret: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "dev.aakashdadhich.factory.FactoryVulnIOS",
            kSecAttrAccount as String: "password",
            kSecValueData as String: Data(secret.utf8),
            kSecAttrAccessible as String: kSecAttrAccessibleAlways,
        ]
        SecItemDelete(query as CFDictionary)
        return SecItemAdd(query as CFDictionary, nil) == errSecSuccess
    }
}
