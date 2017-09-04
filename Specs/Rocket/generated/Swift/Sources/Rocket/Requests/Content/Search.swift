//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension Rocket.Content {

    /** Search the catalog of items and people. */
    public enum Search {

        public static let service = APIService<Response>(id: "search", tag: "content", method: "GET", path: "/search", hasBody: false)

        /** By default people, movies and tv (shows + programs) will be included
        in the search results.

        If you don't want all of these types you can specifiy the specific
        includes you care about.
         */
        public enum Include: String {
            case tv = "tv"
            case movies = "movies"
            case people = "people"

            public static let cases: [Include] = [
              .tv,
              .movies,
              .people,
            ]
        }

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The search term to query. */
                public var term: String

                /** By default people, movies and tv (shows + programs) will be included
in the search results.

If you don't want all of these types you can specifiy the specific
includes you care about.
 */
                public var include: [Include]?

                /** When this option is set, instead of all search result items being returned
in a single list, they will instead be returned under two lists. One for
movies and another for tv (shows + programs).

Default is undefined meaning items will be returned in a single list.

The array of `people` results will alway be separate from items.
 */
                public var group: Bool?

                /** The maximum number of results to return. */
                public var maxResults: Int?

                /** The maximum rating (inclusive) of items returned, e.g. 'auoflc-pg'. */
                public var maxRating: String?

                /** The type of device the content is targeting. */
                public var device: String?

                /** The active subscription code. */
                public var sub: String?

                /** The list of segments to filter the response by. */
                public var segments: [String]?

                /** The set of opt in feature flags which cause breaking changes to responses.

While Rocket APIs look to avoid breaking changes under the active major version, the formats of responses
may need to evolve over this time.

These feature flags allow clients to select which response formats they expect and avoid breaking
clients as these formats evolve under the current major version.

### Flags

- `all` - Enable all flags. Useful for testing. _Don't use in production_.
- `idp` - Dynamic item detail pages with schedulable rows.
- `ldp` - Dynamic list detail pages with schedulable rows.

See the `feature-flags.md` for available flag details.
 */
                public var ff: [FeatureFlags]?

                public init(term: String, include: [Include]? = nil, group: Bool? = nil, maxResults: Int? = nil, maxRating: String? = nil, device: String? = nil, sub: String? = nil, segments: [String]? = nil, ff: [FeatureFlags]? = nil) {
                    self.term = term
                    self.include = include
                    self.group = group
                    self.maxResults = maxResults
                    self.maxRating = maxRating
                    self.device = device
                    self.sub = sub
                    self.segments = segments
                    self.ff = ff
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: Search.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(term: String, include: [Include]? = nil, group: Bool? = nil, maxResults: Int? = nil, maxRating: String? = nil, device: String? = nil, sub: String? = nil, segments: [String]? = nil, ff: [FeatureFlags]? = nil) {
                let options = Options(term: term, include: include, group: group, maxResults: maxResults, maxRating: maxRating, device: device, sub: sub, segments: segments, ff: ff)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: JSONDictionary = [:]
                params["term"] = options.term
                if let include = options.include?.encode().map({ String(describing: $0) }).joined(separator: ",") {
                  params["include"] = include
                }
                if let group = options.group {
                  params["group"] = group
                }
                if let maxResults = options.maxResults {
                  params["max_results"] = maxResults
                }
                if let maxRating = options.maxRating {
                  params["max_rating"] = maxRating
                }
                if let device = options.device {
                  params["device"] = device
                }
                if let sub = options.sub {
                  params["sub"] = sub
                }
                if let segments = options.segments?.joined(separator: ",") {
                  params["segments"] = segments
                }
                if let ff = options.ff?.encode().map({ String(describing: $0) }).joined(separator: ",") {
                  params["ff"] = ff
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SearchResults

            /** OK. */
            case status200(SearchResults)

            /** Bad request. */
            case status400(ServiceError)

            /** Not found. */
            case status404(ServiceError)

            /** Internal server error. */
            case status500(ServiceError)

            /** Service error. */
            case defaultResponse(statusCode: Int, ServiceError)

            public var success: SearchResults? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: ServiceError? {
                switch self {
                case .status400(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<SearchResults, ServiceError> {
                if let successValue = success {
                    return .success(successValue)
                } else if let failureValue = failure {
                    return .failure(failureValue)
                } else {
                    fatalError("Response does not have success or failure response")
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                case .status400(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status400: return 400
                case .status404: return 404
                case .status500: return 500
                case .defaultResponse(let statusCode, _): return statusCode
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                case .status404: return false
                case .status500: return false
                case .defaultResponse: return false
                }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 200: self = try .status200(JSONDecoder.decode(data: data))
                case 400: self = try .status400(JSONDecoder.decode(data: data))
                case 404: self = try .status404(JSONDecoder.decode(data: data))
                case 500: self = try .status500(JSONDecoder.decode(data: data))
                default: self = try .defaultResponse(statusCode: statusCode, JSONDecoder.decode(data: data))
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
