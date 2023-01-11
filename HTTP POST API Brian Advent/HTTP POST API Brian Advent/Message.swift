import Foundation

final class Message: Codable {
    var id: Int?
    var message: String
    
    init(message: String) {
        self.message = message
    }
}
