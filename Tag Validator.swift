class Solution {
    func isValid(_ code: String) -> Bool {
        if code == "t" { return false }
        var code = code.replacingOccurrences(of: "<!\\[CDATA\\[.*?\\]\\]>", with: "c", options: .regularExpression)

        var prev = ""
        while code != prev {
            prev = code
            code = code.replacingOccurrences(of: "<([A-Z]{1,9})>[^<]*</\\1>", with: "t", options: .regularExpression)
        }

        return code == "t"
    }
}