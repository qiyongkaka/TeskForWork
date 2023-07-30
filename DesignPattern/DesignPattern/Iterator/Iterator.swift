//
//  Iterator.swift
//  DesignPattern
//
//  Created by qiyongka on 2023/7/29.
//

import Foundation

fileprivate class WordsCollection {

    fileprivate lazy var items = [String]()

    func append(_ item: String) {
        self.items.append(item)
    }
}

extension WordsCollection: Sequence {

    func makeIterator() -> WordsIterator {
        return WordsIterator(self)
    }
}

fileprivate class WordsIterator: IteratorProtocol {

    private let collection: WordsCollection
    private var index = 0

    init(_ collection: WordsCollection) {
        self.collection = collection
    }

    func next() -> String? {
        defer { index += 1 }
        return index < collection.items.count ? collection.items[index] : nil
    }
}

fileprivate class NumbersCollection {

    fileprivate lazy var items = [Int]()

    func append(_ item: Int) {
        self.items.append(item)
    }
}

extension NumbersCollection: Sequence {

    func makeIterator() -> AnyIterator<Int> {
        var index = self.items.count - 1

        return AnyIterator {
            defer { index -= 1 }
            return index >= 0 ? self.items[index] : nil
        }
    }
}

fileprivate class Client {
    static func clientCode<S: Sequence>(sequence: S) {
        for item in sequence {
            print(item)
        }
    }
}

fileprivate func testIteratorProtocol() {

    let words = WordsCollection()
    words.append("First")
    words.append("Second")
    words.append("Third")

    print("Straight traversal using IteratorProtocol:")
    Client.clientCode(sequence: words)
}

fileprivate func testAnyIterator() {

    let numbers = NumbersCollection()
    numbers.append(1)
    numbers.append(2)
    numbers.append(3)

    print("\nReverse traversal using AnyIterator:")
    Client.clientCode(sequence: numbers)
}

func testForIterator() {
    testIteratorProtocol()
//    testAnyIterator()
}
