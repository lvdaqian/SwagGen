//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.Mode {

    public enum ModeArrivals {

        public static let service = APIService<Response>(id: "Mode_Arrivals", tag: "Mode", method: "GET", path: "/Mode/{mode}/Arrivals", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** A mode name e.g. tube, dlr */
                public var mode: String

                /** A number of arrivals to return for each stop, -1 to return all available. */
                public var count: Int?

                public init(mode: String, count: Int? = nil) {
                    self.mode = mode
                    self.count = count
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: ModeArrivals.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(mode: String, count: Int? = nil) {
                let options = Options(mode: mode, count: count)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "mode" + "}", with: "\(self.options.mode)")
            }

            public override var parameters: [String: Any] {
                var params: JSONDictionary = [:]
                if let count = options.count {
                  params["count"] = count
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [Prediction]

            /** OK */
            case status200([Prediction])

            public var success: [Prediction]? {
                switch self {
                case .status200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 200: self = try .status200(JSONDecoder.decode(data: data))
                default: throw APIError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
