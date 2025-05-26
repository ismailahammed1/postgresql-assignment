/* 2025-05-26 14:26:21 [8 ms] */ 
CREATE TABLE শিক্ষার্থী (
    আইডি SERIAL PRIMARY KEY,
    নাম VARCHAR(100) NOT NULL,
    রোল INTEGER UNIQUE
);
/* 2025-05-26 14:26:23 [3 ms] */ 
INSERT INTO শিক্ষার্থী (নাম, রোল) VALUES ('রহিম', 101);
/* 2025-05-26 14:26:32 [4 ms] */ 
SELECT * FROM শিক্ষার্থী LIMIT 100;
/* 2025-05-26 14:26:43 [6 ms] */ 
DROP TABLE IF EXISTS শিক্ষার্থী;
