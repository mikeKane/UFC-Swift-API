//: Playground - noun: a place where people can play

import UIKit

let urlString = "http://ufc-data-api.ufc.com/api/v3/iphone/fighters"
var ufcFighter = Data()

do {
    ufcFighter = try Data.init(contentsOf:URL.init(string: urlString)!)
}
 print("\(ufcFighter)")


