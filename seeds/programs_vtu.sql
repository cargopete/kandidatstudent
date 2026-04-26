-- ===================================================================
-- ВТУ „Св. св. Кирил и Методий" — Full Program Catalog
-- Removes phantom data, adds all missing programs across 9 faculties
-- + Педагогически колеж Плевен (professional bachelor)
-- ===================================================================

-- ---------------------------------------------------------------
-- 1. Remove phantom program_offering rows
-- ---------------------------------------------------------------
DELETE FROM program_offering WHERE slug IN (
  'vtu-geodeziya-bachelor',
  'vtu-horeografiya-bachelor',
  'vtu-ikonomika-bachelor',
  'vtu-informatika-bachelor',
  'vtu-matematika-bachelor',
  'vtu-sotsialna-rabota-bachelor',
  'vtu-sotsiologiya-bachelor',
  'vtu-stroitelno-inzhenerstvo-bachelor',
  'vtu-pedagogy-bachelor',
  'vtu-spetsialna-pedagogy-bachelor',
  'vtu-izobrazitelno-izkustvo-bachelor',
  'vtu-nachalna-pedagogy-bachelor',
  'vtu-preduchilishna-pedagogy-bachelor'
);

-- ---------------------------------------------------------------
-- 2. Fix existing offerings
-- ---------------------------------------------------------------
UPDATE program_offering
SET title_bg    = 'Педагогика на обучението по музика',
    specialty_id = (SELECT id FROM specialty WHERE slug = 'pedob-muzika')
WHERE slug = 'vtu-muzika-bachelor';

-- ---------------------------------------------------------------
-- 3. New specialties
-- ---------------------------------------------------------------

-- Романска филология (was deleted as СУ phantom; ВТУ offers Романистика)
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'romanska-filologiya','Романска филология','Romance Philology',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

-- Предучилищна и начална педагогика (combined degree)
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'preduchilishna-i-nachalna-pedagogika','Предучилищна и начална училищна педагогика','Preschool and Primary School Pedagogy',
  id FROM professional_field WHERE code='1.2' ON CONFLICT (slug) DO NOTHING;

-- Начална педагогика и специална педагогика
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'nachalna-i-spetsialna-pedagogika','Начална училищна педагогика и специална педагогика','Primary School Pedagogy and Special Education',
  id FROM professional_field WHERE code='1.2' ON CONFLICT (slug) DO NOTHING;

-- Начална педагогика и чужд език
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'nachalna-ped-i-chuzhd-ezik','Начална училищна педагогика и чужд език','Primary School Pedagogy and Foreign Language',
  id FROM professional_field WHERE code='1.2' ON CONFLICT (slug) DO NOTHING;

-- Предучилищна педагогика и логопедия
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'preduchilishna-i-logopediya','Предучилищна педагогика и логопедия','Preschool Pedagogy and Speech Therapy',
  id FROM professional_field WHERE code='1.2' ON CONFLICT (slug) DO NOTHING;

-- Предучилищна педагогика и чужд език
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'preduchilishna-i-chuzhd-ezik','Предучилищна педагогика и чужд език','Preschool Pedagogy and Foreign Language',
  id FROM professional_field WHERE code='1.2' ON CONFLICT (slug) DO NOTHING;

-- Предучилищна педагогика и педагогика на ранното детство
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'preduchilishna-i-ranno-detstvo','Предучилищна педагогика и педагогика на ранното детство','Preschool Pedagogy and Early Childhood Education',
  id FROM professional_field WHERE code='1.2' ON CONFLICT (slug) DO NOTHING;

-- Cross-subject pedagogy (1.3) — БЕ combinations
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-bg-i-chuzhd-ezik','Педагогика на обучението по български език и чужд език','Teaching of Bulgarian Language and Foreign Language',
  id FROM professional_field WHERE code='1.3' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-bg-i-istoriya','Педагогика на обучението по български език и история','Teaching of Bulgarian Language and History',
  id FROM professional_field WHERE code='1.3' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-bg-i-geografiya','Педагогика на обучението по български език и география','Teaching of Bulgarian Language and Geography',
  id FROM professional_field WHERE code='1.3' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-bg-i-it','Педагогика на обучението по български език и информационни технологии','Teaching of Bulgarian Language and IT',
  id FROM professional_field WHERE code='1.3' ON CONFLICT (slug) DO NOTHING;

-- Cross-subject pedagogy (1.3) — История combinations
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-istoriya-i-geografiya','Педагогика на обучението по история и география','Teaching of History and Geography',
  id FROM professional_field WHERE code='1.3' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-istoriya-i-it','Педагогика на обучението по история и информационни технологии','Teaching of History and IT',
  id FROM professional_field WHERE code='1.3' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-istoriya-i-filosofiya','Педагогика на обучението по история и философия','Teaching of History and Philosophy',
  id FROM professional_field WHERE code='1.3' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-istoriya-i-chuzhd-ezik','Педагогика на обучението по история и чужд език','Teaching of History and Foreign Language',
  id FROM professional_field WHERE code='1.3' ON CONFLICT (slug) DO NOTHING;

-- Cross-subject pedagogy (1.3) — География
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-geografiya-i-it','Педагогика на обучението по география и информационни технологии','Teaching of Geography and IT',
  id FROM professional_field WHERE code='1.3' ON CONFLICT (slug) DO NOTHING;

-- Cross-subject pedagogy (1.3) — Математика и информатика
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-matematika-i-informatika','Педагогика на обучението по математика и информатика','Teaching of Mathematics and Informatics',
  id FROM professional_field WHERE code='1.3' ON CONFLICT (slug) DO NOTHING;

-- Cross-subject pedagogy (1.3) — Религия combinations
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-religia-i-filosofiya','Педагогика на обучението по религия и философия','Teaching of Religion and Philosophy',
  id FROM professional_field WHERE code='1.3' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-religia-i-istoriya','Педагогика на обучението по религия и история','Teaching of Religion and History',
  id FROM professional_field WHERE code='1.3' ON CONFLICT (slug) DO NOTHING;

-- Религия and Theology faculty
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'tsarkovna-izkustva','Църковни изкуства','Church Arts',
  id FROM professional_field WHERE code='2.4' ON CONFLICT (slug) DO NOTHING;

-- Fine arts
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'zhivopis','Живопис','Painting',
  id FROM professional_field WHERE code='8.2' ON CONFLICT (slug) DO NOTHING;

-- Philosophy faculty
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'diplomatsia-i-mr','Дипломация и международни отношения','Diplomacy and International Relations',
  id FROM professional_field WHERE code='3.3' ON CONFLICT (slug) DO NOTHING;

-- FMI
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'izkustven-intelekt-i-kibersigurnost','Изкуствен интелект и киберсигурност','Artificial Intelligence and Cybersecurity',
  id FROM professional_field WHERE code='4.6' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'informatsionno-brokerstvo','Информационно брокерство и дигитални медии','Information Brokerage and Digital Media',
  id FROM professional_field WHERE code='3.5' ON CONFLICT (slug) DO NOTHING;

-- Economics/Tourism
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'turizum-i-digitalizatsia','Туризъм и дигитализация','Tourism and Digitalization',
  id FROM professional_field WHERE code='3.9' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'predpriemachestvo-sotsialna-sfera','Предприемачество в социалната сфера','Entrepreneurship in the Social Sphere',
  id FROM professional_field WHERE code='3.4' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'kulturen-turizum','Културен туризъм','Cultural Tourism',
  id FROM professional_field WHERE code='3.9' ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------
-- 4. New program_offering rows
-- ---------------------------------------------------------------

-- === ФИЛОЛОГИЧЕСКИ ФАКУЛТЕТ ===

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-ruska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='ruska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Руска филология','Russian Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-germanistika-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='germanska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Германистика','German Studies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-romanistika-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='romanska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Романистика','Romance Studies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-balkanistika-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='balkanistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Балканистика','Balkan Studies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-slavyanski-ezitsi-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='slavyanska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Славянски езици и култури','Slavic Languages and Cultures'
ON CONFLICT (slug) DO NOTHING;

-- Приложна лингвистика variants
INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-prilozhna-lingv-dva-chuzhdi-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='prilozhna-lingvistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Приложна лингвистика с два чужди езика','Applied Linguistics with Two Foreign Languages'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-prilozhna-lingv-bg-en-it-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='prilozhna-lingvistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Приложна лингвистика. Български и английски език с информационни технологии','Applied Linguistics: Bulgarian and English with IT'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-prilozhna-lingv-en-vtori-it-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='prilozhna-lingvistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Приложна лингвистика. Английски и втори чужд език с информационни технологии','Applied Linguistics: English and Second FL with IT'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-prilozhna-lingv-turizum-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='prilozhna-lingvistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Приложна лингвистика. Два чужди езика с международен туризъм','Applied Linguistics: Two FLs with International Tourism'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-prilozhna-lingv-biznes-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='prilozhna-lingvistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Приложна лингвистика. Два чужди езика с бизнес комуникации','Applied Linguistics: Two FLs with Business Communications'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-prilozhna-lingv-mr-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='prilozhna-lingvistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Приложна лингвистика. Два чужди езика с международни отношения','Applied Linguistics: Two FLs with International Relations'
ON CONFLICT (slug) DO NOTHING;

-- Педагогика по БЕ и X (from FLF)
INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-bg-chuzhd-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-bg-i-chuzhd-ezik'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по български език и чужд език','Teaching of Bulgarian Language and Foreign Language'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-bg-istoriya-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-bg-i-istoriya'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по български език и история','Teaching of Bulgarian Language and History'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-bg-geografiya-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-bg-i-geografiya'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по български език и география','Teaching of Bulgarian Language and Geography'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-bg-it-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-bg-i-it'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по български език и информационни технологии','Teaching of Bulgarian Language and IT'
ON CONFLICT (slug) DO NOTHING;

-- PR, Journalism, Library
INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-zhurnalistika-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='zhurnalistika'),
  (SELECT id FROM professional_field WHERE code='3.5'),
  'bachelor','full_time','bg',8,240,NULL,'both','Журналистика','Journalism'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-vrazki-obshtestvo-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='vrazki-s-obshtestvenostta'),
  (SELECT id FROM professional_field WHERE code='3.5'),
  'bachelor','full_time','bg',8,240,NULL,'both','Връзки с обществеността','Public Relations'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-bibliotekoznanie-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='bibliotekoznanie'),
  (SELECT id FROM professional_field WHERE code='3.5'),
  'bachelor','full_time','bg',8,240,NULL,'both','Библиотекознание','Library Science'
ON CONFLICT (slug) DO NOTHING;

-- === ПЕДАГОГИЧЕСКИ ФАКУЛТЕТ ===

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-nup-spetsialna-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='nachalna-i-spetsialna-pedagogika'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Начална училищна педагогика и специална педагогика','Primary School Pedagogy and Special Education'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-nup-chuzhd-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='nachalna-ped-i-chuzhd-ezik'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Начална училищна педагогика и чужд език','Primary School Pedagogy and Foreign Language'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-fizichesko-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-fizichesko-vazpitanie'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по физическо възпитание','Physical Education Teaching'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-preduchilishna-nachalna-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='preduchilishna-i-nachalna-pedagogika'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Предучилищна и начална училищна педагогика','Preschool and Primary School Pedagogy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-preduchilishna-logopediya-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='preduchilishna-i-logopediya'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Предучилищна педагогика и логопедия','Preschool Pedagogy and Speech Therapy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-preduchilishna-chuzhd-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='preduchilishna-i-chuzhd-ezik'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Предучилищна педагогика и чужд език','Preschool Pedagogy and Foreign Language'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-preduchilishna-ranno-detstvo-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='preduchilishna-i-ranno-detstvo'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Предучилищна педагогика и педагогика на ранното детство','Preschool Pedagogy and Early Childhood Education'
ON CONFLICT (slug) DO NOTHING;

-- === СТОПАНСКИ ФАКУЛТЕТ ===

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-schetovodstvo-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='schetovodstvo-i-kontrol'),
  (SELECT id FROM professional_field WHERE code='3.8'),
  'bachelor','full_time','bg',8,240,NULL,'both','Счетоводство и контрол','Accounting and Control'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-marketing-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='marketing'),
  (SELECT id FROM professional_field WHERE code='3.8'),
  'bachelor','full_time','bg',8,240,NULL,'both','Маркетинг','Marketing'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-mio-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='mezhdunarodni-ikonomicheski-otnosheniya'),
  (SELECT id FROM professional_field WHERE code='3.8'),
  'bachelor','full_time','bg',8,240,NULL,'both','Международни икономически отношения','International Economic Relations'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-publichna-admin-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='publichna-administratsiya'),
  (SELECT id FROM professional_field WHERE code='3.7'),
  'bachelor','full_time','bg',8,240,NULL,'both','Публична администрация','Public Administration'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-turizum-digital-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='turizum-i-digitalizatsia'),
  (SELECT id FROM professional_field WHERE code='3.9'),
  'bachelor','full_time','bg',8,240,NULL,'both','Туризъм и дигитализация','Tourism and Digitalization'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-sotsialni-deynosti-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='sotsialni-dejnosti'),
  (SELECT id FROM professional_field WHERE code='3.4'),
  'bachelor','full_time','bg',8,240,NULL,'both','Социални дейности','Social Activities'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-predpriemachestvo-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='predpriemachestvo-sotsialna-sfera'),
  (SELECT id FROM professional_field WHERE code='3.4'),
  'bachelor','full_time','bg',8,240,NULL,'both','Предприемачество в социалната сфера','Entrepreneurship in the Social Sphere'
ON CONFLICT (slug) DO NOTHING;

-- === ИСТОРИЧЕСКИ ФАКУЛТЕТ ===

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-geografiya-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='geografiya'),
  (SELECT id FROM professional_field WHERE code='4.4'),
  'bachelor','full_time','bg',8,240,NULL,'both','География','Geography'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-etnologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='etnologiya-i-antropologiya'),
  (SELECT id FROM professional_field WHERE code='3.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Eтнология и културна антропология','Ethnology and Cultural Anthropology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-kulturen-turizum-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='kulturen-turizum'),
  (SELECT id FROM professional_field WHERE code='3.9'),
  'bachelor','full_time','bg',8,240,NULL,'both','Културен туризъм','Cultural Tourism'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-istoriya-geografiya-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-istoriya-i-geografiya'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по история и география','Teaching of History and Geography'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-istoriya-it-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-istoriya-i-it'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по история и информационни технологии','Teaching of History and IT'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-istoriya-filosofiya-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-istoriya-i-filosofiya'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по история и философия','Teaching of History and Philosophy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-istoriya-chuzhd-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-istoriya-i-chuzhd-ezik'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по история и чужд език','Teaching of History and Foreign Language'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-geografiya-it-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-geografiya-i-it'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по география и информационни технологии','Teaching of Geography and IT'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-regionalno-razvitie-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='regionalno-razvitie'),
  (SELECT id FROM professional_field WHERE code='4.4'),
  'bachelor','full_time','bg',8,240,NULL,'both','Регионално развитие и геоикономика','Regional Development and Geoeconomics'
ON CONFLICT (slug) DO NOTHING;

-- === ФАКУЛТЕТ ПО ИЗОБРАЗИТЕЛНО ИЗКУСТВО ===

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-zhivopis-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='zhivopis'),
  (SELECT id FROM professional_field WHERE code='8.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Живопис','Painting'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-grafika-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='grafika'),
  (SELECT id FROM professional_field WHERE code='8.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Графика','Graphics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-grafichen-dizain-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='dizain'),
  (SELECT id FROM professional_field WHERE code='8.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Графичен дизайн и визуални комуникации','Graphic Design and Visual Communications'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-risuvane-intermedia-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='izobrazitelno-izkustvo'),
  (SELECT id FROM professional_field WHERE code='8.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Рисуване и интермедии','Drawing and Intermedia'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-interaktiven-dizain-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='dizain'),
  (SELECT id FROM professional_field WHERE code='8.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Интерактивен дизайн и компютърни игри','Interactive Design and Computer Games'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-vizualni-izsledvaniya-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='izkustvoznanie'),
  (SELECT id FROM professional_field WHERE code='8.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Визуални изследвания','Visual Research'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-skulptura-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='skulptura'),
  (SELECT id FROM professional_field WHERE code='8.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Скулптура','Sculpture'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-freska-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='izobrazitelno-izkustvo'),
  (SELECT id FROM professional_field WHERE code='8.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Фреска','Fresco'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-izobr-izkustvo-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-izobrazitelno-izkustvo'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по изобразително изкуство','Teaching of Fine Arts'
ON CONFLICT (slug) DO NOTHING;

-- === ПРАВОСЛАВЕН БОГОСЛОВСКИ ФАКУЛТЕТ ===

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-religia-filosofiya-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-religia-i-filosofiya'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по религия и философия','Teaching of Religion and Philosophy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-religia-istoriya-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-religia-i-istoriya'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по религия и история','Teaching of Religion and History'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-tsarkovna-izkustva-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='tsarkovna-izkustva'),
  (SELECT id FROM professional_field WHERE code='2.4'),
  'bachelor','full_time','bg',8,240,NULL,'both','Църковни изкуства – иконопис, стенопис, дърворезба','Church Arts – Icon Painting, Fresco, Wood Carving'
ON CONFLICT (slug) DO NOTHING;

-- === ФИЛОСОФСКИ ФАКУЛТЕТ ===

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-politologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='politologiya'),
  (SELECT id FROM professional_field WHERE code='3.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Политология','Political Science'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-natsionalna-sigurnost-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='natsionalna-sigurnost'),
  (SELECT id FROM professional_field WHERE code='9.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Национална сигурност','National Security'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-diplomatsia-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='diplomatsia-i-mr'),
  (SELECT id FROM professional_field WHERE code='3.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Дипломация и международни отношения','Diplomacy and International Relations'
ON CONFLICT (slug) DO NOTHING;

-- === ФАКУЛТЕТ „МАТЕМАТИКА И ИНФОРМАТИКА" ===

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-izkustven-intelekt-kibersig-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='izkustven-intelekt-i-kibersigurnost'),
  (SELECT id FROM professional_field WHERE code='4.6'),
  'bachelor','full_time','bg',8,240,NULL,'both','Изкуствен интелект и киберсигурност','Artificial Intelligence and Cybersecurity'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pedob-matematika-informatika-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='pedob-matematika-i-informatika'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,NULL,'both','Педагогика на обучението по математика и информатика','Teaching of Mathematics and Informatics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-softuerno-inzhenerstvo-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='softuerno-inzhenerstvo'),
  (SELECT id FROM professional_field WHERE code='4.6'),
  'bachelor','full_time','bg',8,240,NULL,'both','Софтуерно инженерство','Software Engineering'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-informatsionno-brokerstvo-bak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='informatsionno-brokerstvo'),
  (SELECT id FROM professional_field WHERE code='3.5'),
  'bachelor','full_time','bg',8,240,NULL,'both','Информационно брокерство и дигитални медии','Information Brokerage and Digital Media'
ON CONFLICT (slug) DO NOTHING;

-- === ПЕДАГОГИЧЕСКИ КОЛЕЖ — ПЛЕВЕН (professional_bachelor) ===

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pkp-preduchilishna-profbak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='preduchilishna-pedagogy'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'professional_bachelor','full_time','bg',6,180,NULL,'both','Предучилищна педагогика (Пед. колеж Плевен)','Preschool Pedagogy (Pedagogical College Pleven)'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pkp-nachalna-profbak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='nachalna-uchilishna-pedagogy'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'professional_bachelor','full_time','bg',6,180,NULL,'both','Начална училищна педагогика (Пед. колеж Плевен)','Primary School Pedagogy (Pedagogical College Pleven)'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pkp-nachalna-angliyski-profbak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='nachalna-ped-i-chuzhd-ezik'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'professional_bachelor','full_time','bg',6,180,NULL,'both','Начална училищна педагогика и английски език (Пед. колеж Плевен)','Primary School Pedagogy and English (Pedagogical College Pleven)'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'vtu-pkp-preduchilishna-angliyski-profbak-rd',
  (SELECT id FROM institution WHERE slug='vtu-vt'),
  (SELECT id FROM specialty WHERE slug='preduchilishna-i-chuzhd-ezik'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'professional_bachelor','full_time','bg',6,180,NULL,'both','Предучилищна педагогика и английски език (Пед. колеж Плевен)','Preschool Pedagogy and English (Pedagogical College Pleven)'
ON CONFLICT (slug) DO NOTHING;
