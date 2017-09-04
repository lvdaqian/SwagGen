//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

public class RouteSearchResponse: JSONDecodable, JSONEncodable, PrettyPrintable {

    public var input: String?

    public var searchMatches: [RouteSearchMatch]?

    public init(input: String? = nil, searchMatches: [RouteSearchMatch]? = nil) {
        self.input = input
        self.searchMatches = searchMatches
    }

    public required init(jsonDictionary: JSONDictionary) throws {
        input = jsonDictionary.json(atKeyPath: "input")
        searchMatches = jsonDictionary.json(atKeyPath: "searchMatches")
    }

    public func encode() -> JSONDictionary {
        var dictionary: JSONDictionary = [:]
        if let input = input {
            dictionary["input"] = input
        }
        if let searchMatches = searchMatches?.encode() {
            dictionary["searchMatches"] = searchMatches
        }
        return dictionary
    }

    /// pretty prints all properties including nested models
    public var prettyPrinted: String {
        return "\(type(of: self)):\n\(encode().recursivePrint(indentIndex: 1))"
    }
}
