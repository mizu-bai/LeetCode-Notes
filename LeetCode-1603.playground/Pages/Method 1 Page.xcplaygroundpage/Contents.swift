//: [Previous](@previous)

/*:
 就这？？？
 */

class ParkingSystem {
    var park = [Int](repeating: 0, count: 3)
    init(_ big: Int, _ medium: Int, _ small: Int) {
        self.park = [big, medium, small]
    }
    
    func addCar(_ carType: Int) -> Bool {
        if self.park[carType - 1] < 1 {
            return false
        }
        self.park[carType - 1] -= 1
        return true
    }
}

/**
 * Your ParkingSystem object will be instantiated and called as such:
 * let obj = ParkingSystem(big, medium, small)
 * let ret_1: Bool = obj.addCar(carType)
 */
