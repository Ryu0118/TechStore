//
//  RSSReaderImpl.swift
//
//
//  Created by ryunosuke.shibuya on 2023/01/08.
//

import Dependencies
import Domain
import Foundation
import FeedKit

extension RSSReader: DependencyKey {
    public static var liveValue: RSSReader = .init { url in
        let parser = FeedParser(URL: URL(string: url)!)
        let feed = try await parser.parseAsync()
        
        var articles = convertFeedToArticle(feed: feed)
        let converter = ArticleThumbnailAssigner()
        articles = try await converter.assignThumbnailIfNeeded(articles: articles)
        
        return articles
    }
    
    private static func convertFeedToArticle(
        feed: Feed
    ) -> [Article] {
        switch feed {
        case .atom(let atomFeed):
            return atomFeed.entries?
                .compactMap { entry in
                    guard let title = entry.title,
                          let description = entry.content?.value,
                          let updatedAt = entry.updated ?? entry.published,
                          let link = entry.links?.first?.attributes?.href,
                          let linkUrl = URL(string: link)
                    else {
                        return nil
                    }
                    
                    return Article(title: title, description: description, updatedAt: updatedAt, linkUrl: linkUrl)
                } ?? []
            
        case .rss(let rSSFeed):
            return rSSFeed.items?
                .compactMap { item in
                    guard let title = item.title,
                          let description = item.description,
                          let link = item.link,
                          let linkUrl = URL(string: link),
                          let pubDate = item.pubDate
                    else {
                        return nil
                    }
                    
                    let thumbnail = item.enclosure?.attributes?.url ?? ""
                    let thumbnailUrl = URL(string: thumbnail)
                    
                    return Article(title: title, description: description, updatedAt: pubDate, linkUrl: linkUrl, thumbnailUrl: thumbnailUrl)
                } ?? []
            
        case .json(let jSONFeed):
            return jSONFeed.items?
                .compactMap { item in
                    guard let title = item.title,
                          let description = item.summary,
                          let link = item.url,
                          let linkUrl = URL(string: link),
                          let pubDate = item.dateModified ?? item.datePublished
                    else {
                        return nil
                    }
                    
                    let thumbnail = item.image ?? ""
                    let thumbnailUrl = URL(string: thumbnail)
                    
                    return Article(title: title, description: description, updatedAt: pubDate, linkUrl: linkUrl, thumbnailUrl: thumbnailUrl)
                } ?? []
        }
    }
}
