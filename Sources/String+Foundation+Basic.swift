/*

Erica Sadun, http://ericasadun.com

*/

import Foundation

// --------------------------------------------------
// MARK: Foundation Interop
// --------------------------------------------------

extension String {
    /// Property to force String to NSString
    public var ns: NSString {
        return self as NSString
    }
}

public extension NSString {
    /// Property to force NSString to String
    public var swift: String {return self as String}
}

extension NSString {
    /// Expose full range as core property
    public var lengthRange: NSRange {
        return NSRange(location: 0, length: length)
    }
}

// --------------------------------------------------
// MARK: Ranges
// --------------------------------------------------

extension String {
    /// Create String range from NSRange, using string endIndex limit to guard extent
    public func rangeFromNSRange(range: NSRange) -> Range<String.Index> {
        let start = startIndex.advancedBy(range.location, limit: endIndex)
        let end = startIndex.advancedBy(range.location + range.length, limit: endIndex)
        return start..<end
    }
}
