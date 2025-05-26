
### 📝 **What is PostgreSQL?**
**A:** 📂 _PostgreSQL হলো একটি উন্নতমানের ডেটাবেজ সফটওয়্যার, এটি একটি শক্তিশালী, open-source রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS)। যা ডেটা সংরক্ষণ, ব্যবস্থাপনা এবং পুনরুদ্ধারের জন্য ব্যবহৃত হয়। এটি একটি উন্নত এবং বৈশিষ্ট্যসমৃদ্ধ ডাটাবেস সিস্টেম যা ৩০ বছরেরও বেশি সময় ধরে ব্যবহৃত হচ্ছে। এটি একটি শক্তিশালী অ্যাক্সেস কন্ট্রোল সিস্টেম।_
_মাল্টি-ইউজার সাপোর্ট – একাধিক ব্যবহারকারী একসাথে কাজ করতে পারে।_
_অনেক বড় ডেটা হ্যান্ডেল করতে পারে_
_ওয়েব অ্যাপ্লিকেশনের ব্যাকএন্ডে,ERP এবং CRM সিস্টেমে,গবেষণা ও বিশ্লেষণ প্রকল্পে,ডেটা ওয়্যারহাউজিং-এ ব্যবহৃত হয়_

### 📝What is the purpose of a database schema in PostgreSQL?

_PostgreSQL schema হল একটি লজিক্যাল কাঠামো বা কন্টেইনার বা ধারক যা ডাটাবেজের অবজেক্ট গুলোকে গোছালোভাবে সাজিয়ে রাখে ।_
_যেমন: টেবিল, ভিউ, ফাংশন ইত্যাদিকে লজিক্যাল গ্রুপে ভাগ করে।_
_Schema-ডাটাবেজের বিভিন্ন অংশকে লজিক্যাল ভাগে আলাদা রাখতে সাহায্য করে।_
_একই ডাটাবেসে একাধিক ক্লায়েন্টের ডাটা আলাদা রাখা যায়_
_ভিন্ন ভিন্ন ইউজার/গ্রুপকে ভিন্ন স্কিমায় এক্সেস দিতে পারা যায়_
_একই টেবিল নাম ভিন্ন স্কিমায় ব্যবহার করা যায়_
_schema create_
```
CREATE SCHEMA finance;
```
```
CREATE TABLE conservation.species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL
);
```
_স্কিমা থেকে ডাটা অ্যাক্সেস করা_
```
SELECT * FROM conservation.species;
```
_DROP SCHEMA_
```
DROP SCHEMA conservation CASCADE;
```
### 📝Explain the Primary Key and Foreign Key concepts in PostgreSQL.

_PRIMARY KEY হলো একটি টেবিলের আইডেন্টিটি যার মাধ্যমে প্রতিটি শাড়িকে সনাক্ত করা যায় এবং এটি না নাল ভ্যালু হতে পারবে না অবশ্যই এটাতে একটি মান থাকতে হবে তবে ডুবলিকেট কোন মান থাকতে পারবে না_
example:
```
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL
);
```

_Foreign Key এক কথায় বলতে গেলে একটি টেবিল এর সাথে আরেকটি টেবিলের যে সংযোগ_ 
_তৈরি করা হয় এ সংযোগ তৈরি করতে যে কি ব্যবহার করা হয় তাকে ফরেন কি বলা হয়।_
_Foreign Key তথ্য বিভক্ত হওয়ার প্রবণতাকে কমিয়ে দেয়।_ 

```
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),  -- Foreign Key
    ranger_id INT REFERENCES rangers(ranger_id),   -- Foreign Key
    location VARCHAR(100) NOT NULL,
    sighting_time TIMESTAMP NOT NULL
);
```
# What is the difference between the VARCHAR and CHAR data types?

_CHAR এটি নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করতে ব্যবহৃত হয়।অর্থাৎ আপনি CHAR ব্যবহার করে এর  CHAR(১০) লেন্থের বলে দিলে। এটি ১০ লেন্থের জায়গা স্টোর করে রাখে। কিন্তু আপনি যখন এটাকে নিয়ে যখন কাজ করছেন তখন আপনার কিছু কিছু জায়গায় CHAR (bd ) দুই ক্যারেক্টার বা দুই লেন্থ ক্যারেক্টার বলে দেওয়ার পর ও সে ১০ লেন্থের পেস দখল করে রাখবে এটি নির্দিষ্ট সর্বদা সম্পূর্ণ নির্দিষ্ট পরিমাণ জায়গা দখল করে। আপনি চাইলে এটাকে পরিবর্তন করতে পারবেন না।_
```
CREATE TABLE regions (
    code CHAR(10)  -- সবসময় ঠিক 10 ক্যারেক্টার সংরক্ষণ করবে
);
```
_যদি কোনো ডাটা code = 'BD' হয়, তাহলে PostgreSQL এটি **'BD'` (একটি অতিরিক্ত 8 স্পেসসহ) সংরক্ষণ করবে।_

_তবে VARCHAR শুধু CHAR থেকে আলাদা এটি পরিবর্তনশীল অর্থাৎ আপনি যখন এর জন্য একটি নির্দিষ্ট পরিমাণ জায়গা দখল করে দিচ্ছেন VARCHARE(10)সেক্ষেত্রে এর লেন্থ হচ্ছে ১০ ক্যারেক্টার কিন্তু আপনি যখন 10 ক্যারেক্টারের কম 2 বা 4 ("bd"  or , "Ismail") ক্যারেক্টারের কোন ক্যারেক্টার এখানে স্টোর করছেন সে ক্ষেত্রে সে ১০ ক্যারেক্টারের লেন দখল করবে না bd 2 ক্যারেক্টারের or "Ismail" 6 ক্যারেক্টারের জায়গা অর্থাৎ ক্যারেক্টারের প্রয়োজন অনুসারে অনুসারে সে জায়গা দখল করবে।_
``` 
CREATE TABLE animals (
    name VARCHAR(50)  -- সর্বোচ্চ 50 ক্যারেক্টার পর্যন্ত সংরক্ষণ করা যাবে
);
```
 _যদি কোনো ডাটা name = 'Tiger' হয়, তাহলে PostgreSQL শুধুমাত্র 'Tiger' সংরক্ষণ করবে, অতিরিক্ত জায়গা নষ্ট হবে না।_

### 📝Explain the purpose of the WHERE clause in a SELECT statement.

_WHERE ক্লজ একটি condition এর জন্য ব্যবহৃত হয়, এর মাধ্যমে নির্দিষ্ট সারিগুলো নির্বাচন করা যায় SELECT স্টেটমেন্টের মাধ্যমে। এটি ডাটাকে ফিল্টার করতে সাহায্য করে, যাতে সম্পূর্ণ টেবিলের পরিবর্তে শুধুমাত্র ডাটা পাওয়া যায়।_
_অনেকগুলো সারি থেকে সবগুলো সারি না দেখিয়ে নির্দিষ্ট কিছু সারি থেকে ডাটা ফিল্টার করা যায়। কম তথ্য প্রসেস করা লাগে, তাই কোয়ারি দ্রুত চলে।_
```
SELECT * FROM species WHERE conservation_status = 'Endangered';
SELECT * FROM species WHERE discovery_date BETWEEN '1800-01-01' AND '1900-01-01';
SELECT * FROM species WHERE common_name LIKE 'Red%';

```
### 📝What are the LIMIT and OFFSET clauses used for?

_LIMIT এবং OFFSET ক্লজ PostgreSQL-এ ডাটা অনুসন্ধান (Query) অপটিমাইজ করতে ব্যবহৃত হয়। সাধারণত পেজিনেশন (Pagination) বা বড় ডাটাবেজ থেকে নির্দিষ্ট পরিমাণ ডাটা বের করতে ব্যবহৃত হয়।_
_বড় ডাটাবেজ থেকে কার্যকরভাবে তথ্য বের করে। পেজিনেশন সহজ করে, বিশেষত ওয়েব অ্যাপ বা ড্যাশবোর্ডে। কোয়ারি পারফরম্যান্স উন্নত করে, কারণ এটি প্রতিটি সারি লোড করতে হয় না।_
```
SELECT * FROM students LIMIT 5;
```
```
SELECT * FROM students OFFSET 5 LIMIT 5;
```
### 📝How can you modify data using UPDATE statements?

UPDATE স্টেটমেন্ট ব্যবহার করে টেবিলে যে ডাটা রয়েছে সেই ডাটা পরিবর্তন করা যায় এটি এক বা একাধিক সারির নির্দিষ্ট কলামের মান UPDATE করতে ব্যবহার করা হয়। সাধারণত UPDATE ক্লোজ এর মধ্যে where ক্লোজ ব্যবহার করা হয় যাতে। শুধুমাত্র নির্দিষ্ট সারি গুলোর মান পরিবর্তন করা হয় যায়। 
```
UPDATE rangers 
SET region = 'Central Valley' 
WHERE name = 'Alice Green';
```
UPDATE statement rangers টেবিলের Alice Green-এর অঞ্চল পরিবর্তন করে 'Central Valley' করে দেবে।
_multiple_
```
UPDATE species
SET conservation_status = 'Endangered', discovery_date = '1805-06-15'
WHERE common_name = 'Snow Leopard';

```
_all column_
```
UPDATE sightings 
SET notes = 'Data verified by expert';
```
_Update এর ভিতরে CASE কন্ডিশন ব্যবহার করে_
```
UPDATE species 
SET conservation_status = 
    CASE 
        WHEN discovery_date < '1800-01-01' THEN 'Historic' 
        ELSE conservation_status 
    END;
 ```

### 📝What is the significance of the JOIN operation, and how does it work in PostgreSQL?

_JOIN হল SQL-এর একটি শক্তিশালী ফিচার, যার মাধ্যমে একাধিক টেবিলের মধ্যে সম্পর্ক তৈরি করে তথ্য একসাথে করা যায়। যখন ডেটা একাধিক টেবিলে সংরক্ষিত থাকে, তখন JOIN ব্যবহার করে সেই টেবিলগুলোকে যুক্ত (join) করে আমরা সম্মিলিত তথ্য বের করতে পারি। JOIN ছাড়া আমরা আলাদা টেবিলের ডেটা একসাথে বিশ্লেষণ করতে পারি না।_
_To see the name of each student and the marks they have obtained_
```
SELECT students.name, marks.subject, marks.mark
FROM students
FULL JOIN marks ON students.id = marks.student_id;
```
_এখানে, students.id ↔ marks.student_id এর মধ্যে সম্পর্ক তৈরি হয়েছে JOIN অপারেশন দুই টেবিলকে যুক্ত করেছে_
JOIN-এর ধরন (প্রধান ৪টি):
_দুই টেবিলেই মেলানো রেকর্ড থাকলে তবেই দেখাব INNER JOIN_
SELECT r.name, s.location, s.sighting_time
FROM rangers r
INNER JOIN sightings s ON r.ranger_id = s.ranger_id;

_LEFT JOIN বাঁ দিকের টেবিলের সব রেকর্ড দেখাবে, ডানদিকে না থাকলে NULL_
```
SELECT students.name, marks.subject, marks.mark
FROM students
LEFT JOIN marks ON students.id = marks.student_id;
```
_RIGHT JOIN	ডান দিকের সব রেকর্ড দেখাবে, বাঁদিকে না থাকলে NULL_
```
SELECT students.name, marks.subject, marks.mark
FROM students
Right JOIN marks ON students.id = marks.student_id;
```
_FULL JOIN	উভয় টেবিলের সব রেকর্ড দেখাবে, না মিললে NULL_

```
SELECT students.name, marks.subject, marks.mark
FROM students
FULL JOIN marks ON students.id = marks.student_id;
```
একটি ভাল ডেটাবেজ ডিজাইনে (Normalization অনুযায়ী), তথ্য ভাগ করে রাখা হয় যাতে ডেটা পুনরাবৃত্তি না ঘটে। একাধিক টেবিলের ডেটা একত্রে এনে JOIN ব্যবহার করে জটিল রিপোর্ট তৈরি করা যায়:বিক্রয় রিপোর্ট, রেজাল্ট শীট, কর্মচারীর কাজের হিসাব।
JOIN ছাড়া একটি রিলেশনাল ডেটাবেজ অসম্পূর্ণ ও অকার্যকর। তাই, JOIN হল ডেটাবেজ বিশ্লেষণের প্রাণ।
JOIN এর মাধ্যমে আমরা বুঝতে পারি:

কোন ছাত্র কোন বিষয়ে পরীক্ষা দিয়েছে?

কোন কাস্টমার কোন অর্ডার করেছে?

কোন কর্মী কোন বিভাগে কাজ করে?

এসব প্রশ্নের উত্তর JOIN ছাড়া সম্ভব ননয়।

### 📝Explain the GROUP BY clause and its role in aggregation operations.

_GROUP BY হলো আরএকটি SQL ক্লজ যা ডেটাকে এক বা একাধিক কলামের মান অনুসারে গ্রুপ বা ভাগ করে।_
_এটি সাধারণত aggregation functions (যেমন: SUM(), AVG(), COUNT(), MAX(), MIN()) এর সঙ্গে ব্যবহার করা হয়।_
_GROUP BY ব্যবহার করে ডাটাকে নির্দিষ্ট ক্যাটাগরি অনুযায়ী ভাগ করে সংক্ষেপে বিশ্লেষণ করা যায়।_
_ধরা যাক, আমাদের sightings টেবিল আছে যেখানে বিভিন্ন প্রজাতির রেঞ্জারদের মাধ্যমে সনাক্তকরণ সংরক্ষণ করা হয়েছে। যদি আমরা প্রত্যেক প্রজাতির মোট সনাক্তকরণের সংখ্যা জানতে চাই, তাহলে ব্যবহার করতে হবে GROUP BY।_
```
COUNT()
SELECT species_id, COUNT(sighting_id) AS total_sightings
FROM sightings
GROUP BY species_id;

```
এখানে species_id অনুযায়ী সব sightings গ্রুপ হয়ে যাবে। তারপর COUNT(sighting_id) ব্যবহার করে প্রতিটি প্রজাতির মোট sightings সংখ্যা পাওয়া যাবে।

```
(AVG)
SELECT ranger_id, AVG(EXTRACT(HOUR FROM sighting_time)) AS avg_sighting_hour
FROM sightings
GROUP BY ranger_id;

```
_এটি প্রত্যেক রেঞ্জারের গড় সাইটিংস সময় বের করবে।_
```
GROUP BY + HAVING

SELECT species_id, COUNT(sighting_id) AS total_sightings
FROM sightings
GROUP BY species_id
HAVING COUNT(sighting_id) > 10;

```
_শুধুমাত্র যেসব প্রজাতির sightings সংখ্যা ১০-এর বেশি সেগুলো দেখাবে। HAVING ব্যবহার করে নির্দিষ্ট condition দেওয়া যায়।_

### 📝How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

_COUNT() পুরো students টেবিলে কতটি রেকর্ড আছে তা দেখাবে।_
```
SELECT COUNT(*) FROM students;
```
_SUM() – marks কলামের সব মানের মোট যোগফল দেখাবে।_
```
SELECT SUM(marks) FROM students;

```
_AVG() marks কলামের গড় বের করবে।_
```
SELECT AVG(marks) FROM students;
```
