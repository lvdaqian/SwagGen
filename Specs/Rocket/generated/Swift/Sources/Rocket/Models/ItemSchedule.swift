//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

public class ItemSchedule: JSONDecodable, JSONEncodable, PrettyPrintable {

    public var id: String

    public var channelId: String

    /** The date and time this schedule starts. */
    public var startDate: Date

    /** The date and time this schedule ends. */
    public var endDate: Date

    /** True if this is a featured item schedule. */
    public var featured: Bool?

    /** The item this schedule targets. */
    public var item: ItemSummary?

    /** True if this is a live event. */
    public var live: Bool?

    /** True if this has been aired previously on the same channel. */
    public var `repeat`: Bool?

    public init(id: String, channelId: String, startDate: Date, endDate: Date, featured: Bool? = nil, item: ItemSummary? = nil, live: Bool? = nil, `repeat`: Bool? = nil) {
        self.id = id
        self.channelId = channelId
        self.startDate = startDate
        self.endDate = endDate
        self.featured = featured
        self.item = item
        self.live = live
        self.`repeat` = `repeat`
    }

    public required init(jsonDictionary: JSONDictionary) throws {
        id = try jsonDictionary.json(atKeyPath: "id")
        channelId = try jsonDictionary.json(atKeyPath: "channelId")
        startDate = try jsonDictionary.json(atKeyPath: "startDate")
        endDate = try jsonDictionary.json(atKeyPath: "endDate")
        featured = jsonDictionary.json(atKeyPath: "featured")
        item = jsonDictionary.json(atKeyPath: "item")
        live = jsonDictionary.json(atKeyPath: "live")
        `repeat` = jsonDictionary.json(atKeyPath: "repeat")
    }

    public func encode() -> JSONDictionary {
        var dictionary: JSONDictionary = [:]
        dictionary["id"] = id
        dictionary["channelId"] = channelId
        dictionary["startDate"] = startDate.encode()
        dictionary["endDate"] = endDate.encode()
        if let featured = featured {
            dictionary["featured"] = featured
        }
        if let item = item?.encode() {
            dictionary["item"] = item
        }
        if let live = live {
            dictionary["live"] = live
        }
        if let `repeat` = `repeat` {
            dictionary["repeat"] = `repeat`
        }
        return dictionary
    }

    /// pretty prints all properties including nested models
    public var prettyPrinted: String {
        return "\(type(of: self)):\n\(encode().recursivePrint(indentIndex: 1))"
    }
}
