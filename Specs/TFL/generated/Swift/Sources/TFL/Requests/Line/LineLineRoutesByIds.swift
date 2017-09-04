//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.Line {

    public enum LineLineRoutesByIds {

        public static let service = APIService<Response>(id: "Line_LineRoutesByIds", tag: "Line", method: "GET", path: "/Line/{ids}/Route", hasBody: false)

        /** A comma seperated list of service types to filter on. Supported values: Regular, Night. Defaulted to 'Regular' if not specified */
        public enum ServiceTypes: String {
            case regular = "Regular"
            case night = "Night"

            public static let cases: [ServiceTypes] = [
              .regular,
              .night,
            ]
        }

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** A comma-separated list of line ids e.g. victoria,circle,N133. Max. approx. 20 ids. */
                public var ids: [String]

                /** A comma seperated list of service types to filter on. Supported values: Regular, Night. Defaulted to 'Regular' if not specified */
                public var serviceTypes: [ServiceTypes]?

                public init(ids: [String], serviceTypes: [ServiceTypes]? = nil) {
                    self.ids = ids
                    self.serviceTypes = serviceTypes
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: LineLineRoutesByIds.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(ids: [String], serviceTypes: [ServiceTypes]? = nil) {
                let options = Options(ids: ids, serviceTypes: serviceTypes)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "ids" + "}", with: "\(self.options.ids.joined(separator: ","))")
            }

            public override var parameters: [String: Any] {
                var params: JSONDictionary = [:]
                if let serviceTypes = options.serviceTypes?.encode().map({ String(describing: $0) }).joined(separator: ",") {
                  params["serviceTypes"] = serviceTypes
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [Line]

            /** OK */
            case status200([Line])

            public var success: [Line]? {
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
