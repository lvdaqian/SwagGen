//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

public class TimetableRoute: JSONDecodable, JSONEncodable, PrettyPrintable {

    public var schedules: [Schedule]?

    public var stationIntervals: [StationInterval]?

    public init(schedules: [Schedule]? = nil, stationIntervals: [StationInterval]? = nil) {
        self.schedules = schedules
        self.stationIntervals = stationIntervals
    }

    public required init(jsonDictionary: JSONDictionary) throws {
        schedules = jsonDictionary.json(atKeyPath: "schedules")
        stationIntervals = jsonDictionary.json(atKeyPath: "stationIntervals")
    }

    public func encode() -> JSONDictionary {
        var dictionary: JSONDictionary = [:]
        if let schedules = schedules?.encode() {
            dictionary["schedules"] = schedules
        }
        if let stationIntervals = stationIntervals?.encode() {
            dictionary["stationIntervals"] = stationIntervals
        }
        return dictionary
    }

    /// pretty prints all properties including nested models
    public var prettyPrinted: String {
        return "\(type(of: self)):\n\(encode().recursivePrint(indentIndex: 1))"
    }
}
