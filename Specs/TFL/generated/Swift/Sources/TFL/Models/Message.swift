//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

public class Message: JSONDecodable, JSONEncodable, PrettyPrintable {

    public var bulletOrder: Int?

    public var header: Bool?

    public var linkText: String?

    public var messageText: String?

    public var url: String?

    public init(bulletOrder: Int? = nil, header: Bool? = nil, linkText: String? = nil, messageText: String? = nil, url: String? = nil) {
        self.bulletOrder = bulletOrder
        self.header = header
        self.linkText = linkText
        self.messageText = messageText
        self.url = url
    }

    public required init(jsonDictionary: JSONDictionary) throws {
        bulletOrder = jsonDictionary.json(atKeyPath: "bulletOrder")
        header = jsonDictionary.json(atKeyPath: "header")
        linkText = jsonDictionary.json(atKeyPath: "linkText")
        messageText = jsonDictionary.json(atKeyPath: "messageText")
        url = jsonDictionary.json(atKeyPath: "url")
    }

    public func encode() -> JSONDictionary {
        var dictionary: JSONDictionary = [:]
        if let bulletOrder = bulletOrder {
            dictionary["bulletOrder"] = bulletOrder
        }
        if let header = header {
            dictionary["header"] = header
        }
        if let linkText = linkText {
            dictionary["linkText"] = linkText
        }
        if let messageText = messageText {
            dictionary["messageText"] = messageText
        }
        if let url = url {
            dictionary["url"] = url
        }
        return dictionary
    }

    /// pretty prints all properties including nested models
    public var prettyPrinted: String {
        return "\(type(of: self)):\n\(encode().recursivePrint(indentIndex: 1))"
    }
}
