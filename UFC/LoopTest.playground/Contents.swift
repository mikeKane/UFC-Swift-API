//: Playground - noun: a place where people can play

import UIKit



var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0 ..< people.count {
    var str = "\(people[i]) gonna"
    for _ in 1 ... 5 {
        str += " \(actions[i])"
    }
    print(str)
}
