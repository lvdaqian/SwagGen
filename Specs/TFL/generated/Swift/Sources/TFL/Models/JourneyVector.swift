//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

public class JourneyVector: JSONDecodable, JSONEncodable, PrettyPrintable {

    public var from: String?

    public var to: String?

    public var uri: String?

    public var via: String?

    public init(from: String? = nil, to: String? = nil, uri: String? = nil, via: String? = nil) {
        self.from = from
        self.to = to
        self.uri = uri
        self.via = via
    }

    public required init(jsonDictionary: JSONDictionary) throws {
        from = jsonDictionary.json(atKeyPath: "from")
        to = jsonDictionary.json(atKeyPath: "to")
        uri = jsonDictionary.json(atKeyPath: "uri")
        via = jsonDictionary.json(atKeyPath: "via")
    }

    public func encode() -> JSONDictionary {
        var dictionary: JSONDictionary = [:]
        if let from = from {
            dictionary["from"] = from
        }
        if let to = to {
            dictionary["to"] = to
        }
        if let uri = uri {
            dictionary["uri"] = uri
        }
        if let via = via {
            dictionary["via"] = via
        }
        return dictionary
    }

    /// pretty prints all properties including nested models
    public var prettyPrinted: String {
        return "\(type(of: self)):\n\(encode().recursivePrint(indentIndex: 1))"
    }
}
