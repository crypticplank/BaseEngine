import base85
import JavaScriptCore
import JavaScriptEval

public struct BaseEngine {
    func baseEncode(_ str: String) -> String? {
        let data = str.data(using: .utf8)
        let encoded = data?.ascii85Encoded
        return encoded
    }
    
    func baseDecode(_ str: String) -> String? {
        let decodedData = Data(ascii85EncodedString: str)
        return String(data: decodedData, encoding: .utf8)
    }
    
    public func evalJavaScriptBase(_ base: String) -> Any {
        let source = baseDecode(base)
        let Eval = JavaScriptEval.self
        return Eval.Eval(source!)
    }
    
    public func evalMathBase(_ base: String) -> Float {
        let stringWithMathematicalOperation: String = baseDecode(base)!
        let exp: NSExpression = NSExpression(format: stringWithMathematicalOperation)
        return exp.expressionValue(with: nil, context: nil) as! Float
    }
}
