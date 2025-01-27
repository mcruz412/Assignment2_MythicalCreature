//Creature struct with attributes
struct Creature {
    var name = String()
    var description = String()
    var isGood = Bool()
    var magicPower: Int = Int()
    
    //computer property called "ability" to be used in conjunction witht the magicPower property
    var ability: String {
        var fibonacciPower = fibonacciAbility(n: magicPower)
        return "The power ratio from their magic power to actual ability is: \(magicPower):\(fibonacciAbility(n: magicPower))."
    }
    
    //prints out message based on goodness of the creature instance
    func interactWith(selectedCreature: Creature) {
        switch (selectedCreature.isGood, self.isGood) {
        case (true, true):
            print("You are well protected by this monster")
        case (true, false):
            print("Oh no. Hide as this monster will eat you")
        case (false, true):
            print("false, true")
        case (false, false):
            print("false, false")
        }
    }

}


//instances for Creature struct
let creatureOne = Creature(name: "BigFoot", description: "tall and hairy but friendly", isGood: true, magicPower: 10)

let creatureTwo = Creature(name: "Tikbalang", description: "head of a horse with body of a person", isGood: false, magicPower: 50)

let creatureThree = Creature(name: "Youkai", description: "sharp fangs with red skin", isGood: false, magicPower: 80)

//array that holds the Creature instances
let creatureCatalog = [creatureOne, creatureTwo, creatureThree]


//fibonacci function to be used for computed property "ability" within the Creature struct
func fibonacciAbility(n: Int) -> Int {
    var fibonacciSeries: [Int] = []
    
    //use-case for if user input <= 1
    if n <= 0 {
        return 0
    } else if n == 1 {
        return 1
    }
    
    //actual logic for the fibonacci sequence
    for index in 0...n {
        if index < 2 {
            fibonacciSeries.append(index)
        } else {
            let element1 = fibonacciSeries[fibonacciSeries.count - 1]
            let element2 = fibonacciSeries[fibonacciSeries.count - 2]
            fibonacciSeries.append(element1 + element2)
        }
        
    }
    
    return fibonacciSeries[n]
}

//function for printing out the the creature instances
func describeCreate(creatureArray: [Creature], creatureInstance: Creature) {
    for object in creatureArray {
        print("\(object)")
        print(object.ability)
        print(object.interactWith(selectedCreature: creatureInstance))
    }
        
}


describeCreate(creatureArray: creatureCatalog, creatureInstance: creatureOne)


