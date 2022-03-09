import UIKit

var name = "Alison"
var lastName = "Lima"
var age = 24

let fullName = "Meu nome é \(name) \(lastName), minha idade é \(age) anos"

print(fullName)

class Person {
    var name: String;
    var lastName: String;
    var age: Int;
    
    init(name: String, lastname: String, age: Int){
        self.name = name
        self.lastName = lastname
        self.age = age
    }
}

var person1 = Person(name:"Alison", lastname: "Lima", age: 24)

print(person1)
