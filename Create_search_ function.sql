CREATE OR REPLACE FUNCTION "sing1643@algonquinlive.com".search(_keyword text)
RETURNS TABLE(id uuid, html_content text, score numeric) AS $$
BEGIN
 RETURN QUERY 
 SELECT SCORE.id, 
        SCORE.html_content, 
        SCORE.score
 FROM "sing1643@algonquinlive.com".score AS SCORE
 WHERE SCORE.html_content ILIKE '%' || _keyword || '%'
 ORDER BY SCORE.score DESC
 LIMIT 10;
END;
$$ LANGUAGE plpgsql;
