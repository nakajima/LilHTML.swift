//
//  Parser.swift
//
//
//  Created by Pat Nakajima on 5/2/24.
//

import Foundation

public struct Parser {
	var html: String

	public init(html: String) {
		self.html = html
	}

	public func parse() throws -> Result<ElementNode, any Error> {
		let delegate = ParserDelegate()
		let xmlparser = XMLParser(data: Data(html.utf8))
		xmlparser.delegate = delegate
		xmlparser.parse()

		guard let result = delegate.result else {
			return .failure(ParserDelegate.ParseError.didNotGetResult)
		}

		return result
	}
}
