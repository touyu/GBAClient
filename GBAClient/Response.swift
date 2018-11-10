//
//  Response.swift
//  GBAClient
//
//  Created by Yuto Akiba on 2018/11/10.
//  Copyright © 2018 Yuto Akiba. All rights reserved.
//

import Foundation

public struct Response: Codable {
    public let kind: String
    public let totalItems: Int
    public let items: [Item]
}

public struct Item: Codable {
    public let kind: String
    public let id, etag: String
    public let selfLink: String
    public let volumeInfo: VolumeInfo
    public let saleInfo: SaleInfo
    public let accessInfo: AccessInfo
    public let searchInfo: SearchInfo?
}

public struct AccessInfo: Codable {
    public let country: String
    public let viewability: Viewability
    public let embeddable, publicDomain: Bool
    public let textToSpeechPermission: TextToSpeechPermission
    public let epub, pdf: Epub
    public let webReaderLink: String
    public let accessViewStatus: AccessViewStatus
    public let quoteSharingAllowed: Bool
}

public enum AccessViewStatus: String, Codable {
    case fullPurchased = "FULL_PURCHASED"
    case fullPublicDomain = "FULL_PUBLIC_DOMAIN"
    case none = "NONE"
    case sample = "SAMPLE"
}

public struct Epub: Codable {
    let isAvailable: Bool
    let downloadLink: String?
    let acsTokenLink: String?
}

public enum TextToSpeechPermission: String, Codable {
    case allowed = "ALLOWED"
    case allowedForAccessibility = "ALLOWED_FOR_ACCESSIBILITY"
    case notAllowed = "NOT_ALLOWED"
}

public enum Viewability: String, Codable {
    case noPages = "NO_PAGES"
    case partial = "PARTIAL"
    case allPages = "ALL_PAGES"
    case unknown = "UNKNOWN"
}

public struct SaleInfo: Codable {
    public let country: String
    public let saleability: Saleability
    public let isEbook: Bool
    public let listPrice, retailPrice: SaleInfoListPrice?
    public let buyLink: String?
    public let offers: [Offer]?
}

public struct SaleInfoListPrice: Codable {
    public let amount: Int
    public let currencyCode: String
}

public struct Offer: Codable {
    public let finskyOfferType: Int
    public let listPrice, retailPrice: OfferListPrice
}

public struct OfferListPrice: Codable {
    public let amountInMicros: Int
    public let currencyCode: String
}

public enum Saleability: String, Codable {
    case forSale = "FOR_SALE"
    case notForSale = "NOT_FOR_SALE"
}

public struct SearchInfo: Codable {
    public let textSnippet: String
}

public struct VolumeInfo: Codable {
    public let title: String
    public let authors: [String]?
    public let publishedDate: String
    public let description: String?
    public let industryIdentifiers: [IndustryIdentifier]
    public let readingModes: ReadingModes
    public let pageCount: Int?
    public let printType: String
    public let averageRating: Double?
    public let ratingsCount: Int?
    public let maturityRating: String
    public let allowAnonLogging: Bool
    public let contentVersion: String
    public let imageLinks: ImageLinks?
    public let language: String
    public let previewLink: String
    public let infoLink: String
    public let canonicalVolumeLink: String
    public let subtitle: String?
    public let categories: [String]?
    public let panelizationSummary: PanelizationSummary?
    public let publisher: String?
}

public struct ImageLinks: Codable {
    public let smallThumbnail: String
    public let thumbnail: String
}

public struct IndustryIdentifier: Codable {
    public let type: TypeEnum
    public let identifier: String

    public enum TypeEnum: String, Codable {
        case isbn10 = "ISBN_10"
        case isbn13 = "ISBN_13"
        case issn = "ISSN"
        case other = "OTHER"
    }
}

public struct PanelizationSummary: Codable {
    public let containsEpubBubbles: Bool
    public let containsImageBubbles: Bool
}

public struct ReadingModes: Codable {
    public let text: Bool
    public let image: Bool
}

