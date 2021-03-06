
public protocol TargetType {
    var baseURL: URL { get }
    var path: String { get }
    var method: Method { get }
    var task: Task { get }
    var headers: CoreAPI.HTTPHeaders? { get }
}

public extension TargetType {
    var headers: CoreAPI.HTTPHeaders? {
        return nil
    }
}

public enum Task {
    case requestParameters(parameters: CoreAPI.Parameters,
        encoding: ParameterEncoding)
    case plain
    case query(parameters: CoreAPI.Parameters)
    case body(parameters: CoreAPI.Parameters)
}

extension Task: Equatable {
    public static func ==(lhs: Task, rhs: Task) -> Bool {
        switch (lhs, rhs) {
        case (.plain, .plain):
            return true
        default:
            return false
        }
    }
}
