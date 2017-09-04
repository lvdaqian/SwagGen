//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

public class EnumTest: JSONDecodable, JSONEncodable, PrettyPrintable {

    public enum EnumInteger: Int {
        case _1 = 1
        case negative1 = -1

        public static let cases: [EnumInteger] = [
          ._1,
          .negative1,
        ]
    }

    public enum EnumNumber: Double {
        case _11 = 1.1
        case negative12 = -1.2

        public static let cases: [EnumNumber] = [
          ._11,
          .negative12,
        ]
    }

    public enum EnumString: String {
        case upper = "UPPER"
        case lower = "lower"
        case lessThannullgreaterThan = "<null>"

        public static let cases: [EnumString] = [
          .upper,
          .lower,
          .lessThannullgreaterThan,
        ]
    }

    public var enumInteger: EnumInteger?

    public var enumNumber: EnumNumber?

    public var enumString: EnumString?

    public var outerEnum: OuterEnum?

    public init(enumInteger: EnumInteger? = nil, enumNumber: EnumNumber? = nil, enumString: EnumString? = nil, outerEnum: OuterEnum? = nil) {
        self.enumInteger = enumInteger
        self.enumNumber = enumNumber
        self.enumString = enumString
        self.outerEnum = outerEnum
    }

    public required init(jsonDictionary: JSONDictionary) throws {
        enumInteger = jsonDictionary.json(atKeyPath: "enum_integer")
        enumNumber = jsonDictionary.json(atKeyPath: "enum_number")
        enumString = jsonDictionary.json(atKeyPath: "enum_string")
        outerEnum = jsonDictionary.json(atKeyPath: "outerEnum")
    }

    public func encode() -> JSONDictionary {
        var dictionary: JSONDictionary = [:]
        if let enumInteger = enumInteger?.encode() {
            dictionary["enum_integer"] = enumInteger
        }
        if let enumNumber = enumNumber?.encode() {
            dictionary["enum_number"] = enumNumber
        }
        if let enumString = enumString?.encode() {
            dictionary["enum_string"] = enumString
        }
        if let outerEnum = outerEnum?.encode() {
            dictionary["outerEnum"] = outerEnum
        }
        return dictionary
    }

    /// pretty prints all properties including nested models
    public var prettyPrinted: String {
        return "\(type(of: self)):\n\(encode().recursivePrint(indentIndex: 1))"
    }
}
