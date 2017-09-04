//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

public class Instruction: JSONDecodable, JSONEncodable, PrettyPrintable {

    public var detailed: String?

    public var steps: [InstructionStep]?

    public var summary: String?

    public init(detailed: String? = nil, steps: [InstructionStep]? = nil, summary: String? = nil) {
        self.detailed = detailed
        self.steps = steps
        self.summary = summary
    }

    public required init(jsonDictionary: JSONDictionary) throws {
        detailed = jsonDictionary.json(atKeyPath: "detailed")
        steps = jsonDictionary.json(atKeyPath: "steps")
        summary = jsonDictionary.json(atKeyPath: "summary")
    }

    public func encode() -> JSONDictionary {
        var dictionary: JSONDictionary = [:]
        if let detailed = detailed {
            dictionary["detailed"] = detailed
        }
        if let steps = steps?.encode() {
            dictionary["steps"] = steps
        }
        if let summary = summary {
            dictionary["summary"] = summary
        }
        return dictionary
    }

    /// pretty prints all properties including nested models
    public var prettyPrinted: String {
        return "\(type(of: self)):\n\(encode().recursivePrint(indentIndex: 1))"
    }
}
