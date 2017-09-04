//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

public class User: JSONDecodable, JSONEncodable, PrettyPrintable {

    public var id: Int?

    public var name: String?

    public init(id: Int? = nil, name: String? = nil) {
        self.id = id
        self.name = name
    }

    public required init(jsonDictionary: JSONDictionary) throws {
        id = jsonDictionary.json(atKeyPath: "id")
        name = jsonDictionary.json(atKeyPath: "name")
    }

    public func encode() -> JSONDictionary {
        var dictionary: JSONDictionary = [:]
        if let id = id {
            dictionary["id"] = id
        }
        if let name = name {
            dictionary["name"] = name
        }
        return dictionary
    }

    /// pretty prints all properties including nested models
    public var prettyPrinted: String {
        return "\(type(of: self)):\n\(encode().recursivePrint(indentIndex: 1))"
    }
}
