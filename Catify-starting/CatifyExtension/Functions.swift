class Box<T> {
    var unbox: T
    init(_ value: T) {
        unbox = value
    }
}

enum Result<T> {
    case Success(Box<T>)
    case Error(String)
    
    func map<U>(transform: T -> U) -> Result<U> {
        switch self {
        case .Success(let value):
            return .Success(Box(transform(value.unbox)))
        case .Error(let error):
            return .Error(error)
        }
    }
    
}

func flatten<T>(array: [[T]]) -> [T] {
    return array.reduce([]) { $0 + $1 }
}

extension Array {
    func flatMap<U>(transform: T -> [U]) -> [U] {
        return flatten(self.map(transform))
    }
}

func flatten<T>(result: Result<Result<T>>) -> Result<T> {
    switch result {
    case .Success(let box):
        switch box.unbox {
        case .Success(let value): return .Success(value)
        case .Error(let error): return .Error(error)
        }
    case .Error(let error): return .Error(error)
    }
}

extension Result {
    func flatMap<U>(transform: T -> Result<U>) -> Result<U> {
        return flatten(self.map(transform))
    }
}

func compact<T>(items: [T?]) -> [T] {
    return items.reduce([]) {
        if let item = $1 {
            return $0 + [item]
        }
        return $0
    }
}

infix operator >>== { associativity left }

func >>==<T, U>(lhs: Result<T>, rhs: (T -> Result<U>)) -> Result<U> {
    return lhs.flatMap(rhs)
}


