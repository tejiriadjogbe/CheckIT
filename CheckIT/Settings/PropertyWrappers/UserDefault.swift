//
//  UserDefaultWrapper.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import Foundation

@propertyWrapper
struct UserDefault<T: Codable> {
    let key: String
    let userDefaults: UserDefaults

    init(_ key: String, userDefaults: UserDefaults = .standard) {
        self.key = key
        self.userDefaults = userDefaults
    }

    var wrappedValue: T? {
        get { getValue() }
        set { storeValue(newValue) }
    }

    private func getValue() -> T? {
        do {
            guard let data = userDefaults.object(forKey: key) as? Data else {
                return nil
            }

            let envelope = try JSONDecoder().decode(StorageEnvelope<T>.self, from: data)
            return envelope.value
        } catch {
            print("Couldn't get a value from the user defaults")
        }

        return nil
    }

    private func storeValue(_ value: T?) {
        guard let value = value else {
            userDefaults.removeObject(forKey: key)
            return
        }

        do {
            let envelope = StorageEnvelope(value: value)
            let data = try JSONEncoder().encode(envelope)

            userDefaults.set(data, forKey: key)
            userDefaults.synchronize()
        } catch {
            print("UserDeafultsWrapper. Couldn't encode a value")
        }

    }
}

struct StorageEnvelope<T: Codable>: Codable {
    let value: T
}
