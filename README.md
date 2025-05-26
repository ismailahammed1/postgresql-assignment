
### 📝 **What is PostgreSQL?**
**A:** 📂 _PostgreSQL হলো একটি উন্নতমানের ডেটাবেজ সফটওয়্যার, এটি একটি শক্তিশালী, open-source রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS)। যা ডেটা সংরক্ষণ, ব্যবস্থাপনা এবং পুনরুদ্ধারের জন্য ব্যবহৃত হয়। এটি একটি উন্নত এবং বৈশিষ্ট্যসমৃদ্ধ ডাটাবেস সিস্টেম যা ৩০ বছরেরও বেশি সময় ধরে ব্যবহৃত হচ্ছে। এটি একটি শক্তিশালী অ্যাক্সেস কন্ট্রোল সিস্টেম।_
_মাল্টি-ইউজার সাপোর্ট – একাধিক ব্যবহারকারী একসাথে কাজ করতে পারে।_
_অনেক বড় ডেটা হ্যান্ডেল করতে পারে_
_ওয়েব অ্যাপ্লিকেশনের ব্যাকএন্ডে,ERP এবং CRM সিস্টেমে,গবেষণা ও বিশ্লেষণ প্রকল্পে,ডেটা ওয়্যারহাউজিং-এ ব্যবহৃত হয়_

#What is the purpose of a database schema in PostgreSQL?

_PostgreSQL schema হল একটি লজিক্যাল কাঠামো বা কন্টেইনার বা ধারক যা ডাটাবেজের অবজেক্ট গুলোকে গোছালোভাবে সাজিয়ে রাখে ।_
_যেমন: টেবিল, ভিউ, ফাংশন ইত্যাদিকে লজিক্যাল গ্রুপে ভাগ করে।_
_Schema-ডাটাবেজের বিভিন্ন অংশকে লজিক্যাল ভাগে আলাদা রাখতে সাহায্য করে।_
_একই ডাটাবেসে একাধিক ক্লায়েন্টের ডাটা আলাদা রাখা যায়_
_ভিন্ন ভিন্ন ইউজার/গ্রুপকে ভিন্ন স্কিমায় এক্সেস দিতে পারা যায়_
_একই টেবিল নাম ভিন্ন স্কিমায় ব্যবহার করা যায়_
_schema create_
```CREATE SCHEMA finance;```
```CREATE TABLE conservation.species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL
);
```
_স্কিমা থেকে ডাটা অ্যাক্সেস করা_
```SELECT * FROM conservation.species;```
_DROP SCHEMA_
```DROP SCHEMA conservation CASCADE```;

#Explain the Primary Key and Foreign Key concepts in PostgreSQL.

_PRIMARY KEY হলো একটি টেবিলের আইডেন্টিটি যার মাধ্যমে প্রতিটি শাড়িকে সনাক্ত করা যায় এবং এটি না নাল ভ্যালু হতে পারবে না অবশ্যই এটাতে একটি মান থাকতে হবে তবে ডুবলিকেট কোন মান থাকতে পারবে না_
example:
```CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL
);```

_Foreign Key এক কথায় বলতে গেলে একটি টেবিল এর সাথে আরেকটি টেবিলের যে সংযোগ_ 
_তৈরি করা হয় এ সংযোগ তৈরি করতে যে কি ব্যবহার করা হয় তাকে ফরেন কি বলা হয়।_
_Foreign Key তথ্য বিভক্ত হওয়ার প্রবণতাকে কমিয়ে দেয়।_ 

```CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),  -- Foreign Key
    ranger_id INT REFERENCES rangers(ranger_id),   -- Foreign Key
    location VARCHAR(100) NOT NULL,
    sighting_time TIMESTAMP NOT NULL
);```
#What is the difference between the VARCHAR and CHAR data types?

_CHAR এটি নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করতে ব্যবহৃত হয়।অর্থাৎ আপনি CHAR 
_ব্যবহার করে এর  CHAR(১০) লেন্থের বলে দিলে। এটি ১০ লেন্থের জায়গা স্টোর করে রাখে।_
_কিন্তু আপনি যখন এটাকে নিয়ে যখন কাজ করছেন তখন আপনার কিছু কিছু জায়গায় CHAR_
  
_(bd ) দুই ক্যারেক্টার বা দুই লেন্থ ক্যারেক্টার বলে দেওয়ার পর ও সে ১০ লেন্থের পেস দখল করে রাখবে এটি নির্দিষ্ট পরিমাণ জায়গা দখল করে রাখে। আপনি চাইলে এটাকে পরিবর্তন করতে পারবেন না।_
 