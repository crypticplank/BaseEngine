import XCTest
@testable import BaseEngine

final class BaseEngineTests: XCTestCase {
    let engine = BaseEngine()
    func testJavaScript() throws {
        let code = """
        function test() {
            print("Hi :)")
        }
        var flag = 0
        function main() {
            var num = 0
            print("Hello from Morse Engine JavaScript")
            for(var i = 0; i < 10; i++) {
                print(i)
                num = i
            }
            print("Calling JavaScript function")
            test()
            swiftMethod(10)
            print()
            print(flag |= 0x8)
            print(flag |= 0x10)
            return num * 100
        }
        """
        print("Encoding script")
        let encoded = engine.baseEncode(code)!
        print(encoded)
        print("Decoding script")
        print(engine.baseDecode(encoded)!)
        print(engine.evalJavaScriptBase(encoded))
    }
}
