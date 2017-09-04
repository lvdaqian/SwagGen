//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension PetstoreTest.Pet {

    public enum AddPet {

        public static let service = APIService<Response>(id: "addPet", tag: "pet", method: "POST", path: "/pet", hasBody: true, authorization: Authorization(type: "petstore_auth", scope: "write:pets"))

        public final class Request: APIRequest<Response> {

            public var body: Pet

            public init(body: Pet) {
                self.body = body
                super.init(service: AddPet.service)
            }

            public override var jsonBody: Any? {
                return body.encode()
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void

            /** Invalid input */
            case status405

            public var success: Void? {
                switch self {
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status405: return 405
                }
            }

            public var successful: Bool {
                switch self {
                case .status405: return false
                }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 405: self = .status405
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
