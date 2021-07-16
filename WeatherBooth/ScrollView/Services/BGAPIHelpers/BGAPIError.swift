

import Foundation

struct BGAPIError {
    var code: Int?
    var description: String?
}

struct ErrorMessage {
    static let internetError = "Please check your Internet connection"
    static let noDataError = "Data Received empty from the server please try again"
    static let locationDisabled = "You current location is unavailable please change the permissions under settings"
}
