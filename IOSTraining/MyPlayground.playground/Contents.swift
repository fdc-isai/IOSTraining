import UIKit

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
let greetings = greet("Isai", on: "Monday")
print(greetings)


UserDefaults.standard.set(true, forKey: "isLoggedIn")
UserDefaults.standard.set("Eyan", forKey: "username")
UserDefaults.standard.set(25, forKey: "userAge")


var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
var username = UserDefaults.standard.string(forKey: "username")
var userAge = UserDefaults.standard.integer(forKey: "userAge")

print("\(isLoggedIn)")
print(username ?? "No username")
print("\(userAge)")

UserDefaults.standard.removeObject(forKey: "isLoggedIn")

isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")

print("After remove: \(isLoggedIn)")

