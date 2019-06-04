import UIKit

let returnDate: String! = "2019-06-3T15:39:00"
var dateReturnCar: Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    return dateFormatter.date(from: returnDate!)!
}
let timeLeft: TimeInterval = dateReturnCar.timeIntervalSinceReferenceDate - Date().timeIntervalSinceReferenceDate


struct TimeConverter {
    
    private let secondsInDay: TimeInterval = 86400
    private let secondsInHours: TimeInterval = 3600
    private let secondsInMinute: TimeInterval = 60
    
    private var timeInterval: TimeInterval!
    
    mutating func getLeftTime(_ time: TimeInterval) -> String {
        self.timeInterval = time
        
        if getDays() > 0 {
            return "\(getDays())d " + "\(getHours())h " + "\(getMinutes())m"
        } else if getHours() > 0 {
            return "\(getHours())h " + "\(getMinutes())m " + "\(getSeconds())s"
        } else if getMinutes() > 0 {
            return "\(getMinutes())m " + "\(getSeconds())s"
        } else {
            return "\(getSeconds())s"
        }
    }
    
    private func getDays() -> Int {
        return Int(self.timeInterval/secondsInDay)
    }
    
    private func getHours() -> Int {
        let timeLeftWithoutD = self.timeInterval - secondsInDay*TimeInterval(getDays())
        return Int(timeLeftWithoutD/secondsInHours)
    }
    
    private func getMinutes() -> Int {
        let timeLeftWithoutDH = self.timeInterval - secondsInDay*TimeInterval(getDays()) - secondsInHours*TimeInterval(getHours())
        return Int(timeLeftWithoutDH/secondsInMinute)
    }
    
    private func getSeconds() -> Int {
        let timeLeftWithoutDMH = self.timeInterval - secondsInDay*TimeInterval(getDays()) - secondsInHours*TimeInterval(getHours()) - secondsInMinute*TimeInterval(getMinutes())
        return Int(timeLeftWithoutDMH)
    }
}

var timeConverter = TimeConverter()
timeConverter.getLeftTime(timeLeft)
