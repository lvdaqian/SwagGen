//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

public class Subscription: JSONDecodable, JSONEncodable, PrettyPrintable {

    /** The status of a subscription. */
    public enum Status: String {
        case active = "Active"
        case cancelled = "Cancelled"
        case lapsed = "Lapsed"
        case expired = "Expired"
        case none = "None"

        public static let cases: [Status] = [
          .active,
          .cancelled,
          .lapsed,
          .expired,
          .none,
        ]
    }

    /** The unique subscription code. */
    public var code: String

    /** The start date of a subscription. */
    public var startDate: Date

    /** True if a subscription is in its trial period, false if not. */
    public var isTrialPeriod: Bool

    /** The plan a subscription belongs to. */
    public var planId: String

    /** The status of a subscription. */
    public var status: Status

    /** The end date of a subscription.

Some subscriptions may not have an end date, in which case this
property will not exist.
 */
    public var endDate: Date?

    public init(code: String, startDate: Date, isTrialPeriod: Bool, planId: String, status: Status, endDate: Date? = nil) {
        self.code = code
        self.startDate = startDate
        self.isTrialPeriod = isTrialPeriod
        self.planId = planId
        self.status = status
        self.endDate = endDate
    }

    public required init(jsonDictionary: JSONDictionary) throws {
        code = try jsonDictionary.json(atKeyPath: "code")
        startDate = try jsonDictionary.json(atKeyPath: "startDate")
        isTrialPeriod = try jsonDictionary.json(atKeyPath: "isTrialPeriod")
        planId = try jsonDictionary.json(atKeyPath: "planId")
        status = try jsonDictionary.json(atKeyPath: "status")
        endDate = jsonDictionary.json(atKeyPath: "endDate")
    }

    public func encode() -> JSONDictionary {
        var dictionary: JSONDictionary = [:]
        dictionary["code"] = code
        dictionary["startDate"] = startDate.encode()
        dictionary["isTrialPeriod"] = isTrialPeriod
        dictionary["planId"] = planId
        dictionary["status"] = status.encode()
        if let endDate = endDate?.encode() {
            dictionary["endDate"] = endDate
        }
        return dictionary
    }

    /// pretty prints all properties including nested models
    public var prettyPrinted: String {
        return "\(type(of: self)):\n\(encode().recursivePrint(indentIndex: 1))"
    }
}
