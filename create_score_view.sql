CREATE OR REPLACE VIEW "sing1643@algonquinlive.com".score
AS SELECT crawl.id,
    round(cume_dist() OVER (ORDER BY (length(crawl.html_content)))::numeric, 2) AS score,
    crawl.url,
    crawl.title,
    crawl.lang,
    crawl.html_content,
    crawl.last_crawled,
    crawl.last_updated,
    crawl.last_updated_date
   FROM louis_v004.crawl;
