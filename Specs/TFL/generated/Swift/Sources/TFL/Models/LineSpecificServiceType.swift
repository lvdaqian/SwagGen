//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

public class LineSpecificServiceType: JSONDecodable, JSONEncodable, PrettyPrintable {

    public var serviceType: LineServiceTypeInfo?

    public var stopServesServiceType: Bool?

    public init(serviceType: LineServiceTypeInfo? = nil, stopServesServiceType: Bool? = nil) {
        self.serviceType = serviceType
        self.stopServesServiceType = stopServesServiceType
    }

    public required init(jsonDictionary: JSONDictionary) throws {
        serviceType = jsonDictionary.json(atKeyPath: "serviceType")
        stopServesServiceType = jsonDictionary.json(atKeyPath: "stopServesServiceType")
    }

    public func encode() -> JSONDictionary {
        var dictionary: JSONDictionary = [:]
        if let serviceType = serviceType?.encode() {
            dictionary["serviceType"] = serviceType
        }
        if let stopServesServiceType = stopServesServiceType {
            dictionary["stopServesServiceType"] = stopServesServiceType
        }
        return dictionary
    }

    /// pretty prints all properties including nested models
    public var prettyPrinted: String {
        return "\(type(of: self)):\n\(encode().recursivePrint(indentIndex: 1))"
    }
}
