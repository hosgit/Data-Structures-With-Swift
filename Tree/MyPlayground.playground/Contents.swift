
enum Reindeer: Int {
    case Dasher, Dancer, Prancer, Vixen, Comet, Cupid, Donner, Blitzen
    case Rudolph
    
    static let count: Int = {
        var max: Int = 0
        while let _ = Reindeer(rawValue: max) { max += 1 }
        return max
    }()
}


Reindeer.count
