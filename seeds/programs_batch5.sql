-- Seed: Program offerings, batch 5 — СУ оставащи програми
-- Source: uni-sofia.bg/index.php/bul/obrazovanie/bakalav_rski_programi/bakalav_rski_programi
-- Fills remaining gaps identified from official bachelor programs page.

BEGIN;

-- ══════════════════════════════════════════════════════════════════════════
-- 0. Missing canonical specialties
-- ══════════════════════════════════════════════════════════════════════════

-- Филологии (2.1) — Romance and other European languages
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'rumanska-filologiya','Румънска филология','Romanian Philology',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'novogratska-filologiya','Новогръцка филология','Modern Greek Philology',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'ungarska-filologiya','Унгарска филология','Hungarian Philology',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'portugarska-filologiya','Португалска филология','Portuguese Philology',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'afrikanistika','Африканистика','African Studies',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'armenistika','Арменистика и кавказология','Armenian Studies and Caucasology',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'indologiya','Индология','Indology',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'iranistika','Иранистика','Iranian Studies',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'yuzhna-iztochna-aziya','Регион Южна,Източна и Югоизточна Азия','South, East and Southeast Asian Studies',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'hebraistika','Хебраистика','Hebrew Studies',
  id FROM professional_field WHERE code='2.2' ON CONFLICT (slug) DO NOTHING;

-- Медии и комуникации (3.5)
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'knigoizdavane','Книгоиздаване','Book Publishing',
  id FROM professional_field WHERE code='3.5' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'upravlenie-na-komunikatsiite','Управление на комуникациите','Communication Management',
  id FROM professional_field WHERE code='3.5' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'publichni-informatsionni-sistemi','Публични информационни системи','Public Information Systems',
  id FROM professional_field WHERE code='3.5' ON CONFLICT (slug) DO NOTHING;

-- Педагогика (1.2)
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'sotsialni-dejnosti','Социални дейности','Social Activities',
  id FROM professional_field WHERE code='1.2' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'neformalno-obrazovanie','Неформално образование','Non-Formal Education',
  id FROM professional_field WHERE code='1.2' ON CONFLICT (slug) DO NOTHING;

-- Природни науки (4.1)
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'meditsinskа-fizika','Медицинска физика','Medical Physics',
  id FROM professional_field WHERE code='4.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'fotonika-i-lazerna-fizika','Фотоника и лазерна физика','Photonics and Laser Physics',
  id FROM professional_field WHERE code='4.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'kompyutarno-inzhenerstvo','Компютърно инженерство','Computer Engineering',
  id FROM professional_field WHERE code='5.3' ON CONFLICT (slug) DO NOTHING;

-- Биология (4.3)
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'agrobiotehnologii','Агробиотехнологии','Agrobiotechnology',
  id FROM professional_field WHERE code='4.3' ON CONFLICT (slug) DO NOTHING;

-- Химия (4.2)
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'ekologichna-himiya','Екологична химия','Ecological Chemistry',
  id FROM professional_field WHERE code='4.2' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'yadrena-himiya','Ядрена химия','Nuclear Chemistry',
  id FROM professional_field WHERE code='4.2' ON CONFLICT (slug) DO NOTHING;

-- Регионално развитие (3.8)
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'regionalno-razvitie','Регионално развитие и политика','Regional Development and Policy',
  id FROM professional_field WHERE code='3.8' ON CONFLICT (slug) DO NOTHING;

-- Теология (2.4)
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'religii-v-evropa','Религии в Европа','Religions in Europe',
  id FROM professional_field WHERE code='2.4' ON CONFLICT (slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════
-- 1. Факултет по класически и нови филологии — останали програми
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-rumanska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='rumanska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Румънска филология','Romanian Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-novogratska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='novogratska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Новогръцка филология','Modern Greek Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-ungarska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='ungarska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Унгарска филология','Hungarian Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-portugarska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='portugarska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Португалска филология','Portuguese Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-afrikanistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='afrikanistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Африканистика','African Studies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-armenistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='armenistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Арменистика и кавказология','Armenian Studies and Caucasology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-indologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='indologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Индология','Indology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-iranistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='iranistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Иранистика','Iranian Studies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-yuzhna-iztochna-aziya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='yuzhna-iztochna-aziya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Регион Южна, Източна и Югоизточна Азия','South, East and Southeast Asian Studies'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 2. Исторически факултет — останали
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-hebraistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='hebraistika'),
  (SELECT id FROM professional_field WHERE code='2.2'),
  'bachelor','full_time','bg',8,240,750.00,'both','Хебраистика','Hebrew Studies'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 3. Факултет по журналистика и масова комуникация — останали
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-knigoizdavane-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='knigoizdavane'),
  (SELECT id FROM professional_field WHERE code='3.5'),
  'bachelor','full_time','bg',8,240,800.00,'both','Книгоиздаване','Book Publishing'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-upravlenie-komunikatsiite-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='upravlenie-na-komunikatsiite'),
  (SELECT id FROM professional_field WHERE code='3.5'),
  'bachelor','full_time','bg',8,240,800.00,'both','Управление на комуникациите','Communication Management'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 4. Философски факултет — останали
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-publichni-info-sistemi-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='publichni-informatsionni-sistemi'),
  (SELECT id FROM professional_field WHERE code='3.5'),
  'bachelor','full_time','bg',8,240,780.00,'both','Публични информационни системи','Public Information Systems'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 5. Педагогически факултет — останали
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-sotsialni-dejnosti-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='sotsialni-dejnosti'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'bachelor','full_time','bg',8,240,730.00,'both','Социални дейности','Social Activities'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-neformalno-obrazovanie-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='neformalno-obrazovanie'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'bachelor','full_time','bg',8,240,730.00,'both','Неформално образование','Non-Formal Education'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 6. Богословски факултет — останали
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-religii-v-evropa-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='religii-v-evropa'),
  (SELECT id FROM professional_field WHERE code='2.4'),
  'bachelor','full_time','bg',8,240,660.00,'both','Религии в Европа','Religions in Europe'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 7. Физически факултет — останали
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-meditsinskа-fizika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='meditsinskа-fizika'),
  (SELECT id FROM professional_field WHERE code='4.1'),
  'bachelor','full_time','bg',8,240,840.00,'both','Медицинска физика','Medical Physics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-fotonika-i-lazerna-fizika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='fotonika-i-lazerna-fizika'),
  (SELECT id FROM professional_field WHERE code='4.1'),
  'bachelor','full_time','bg',8,240,840.00,'both','Фотоника и лазерна физика','Photonics and Laser Physics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-kompyutarno-inzhenerstvo-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='kompyutarno-inzhenerstvo'),
  (SELECT id FROM professional_field WHERE code='5.3'),
  'bachelor','full_time','bg',8,240,870.00,'both','Компютърно инженерство','Computer Engineering'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 8. Химически факултет — останали
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-ekologichna-himiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='ekologichna-himiya'),
  (SELECT id FROM professional_field WHERE code='4.2'),
  'bachelor','full_time','bg',8,240,820.00,'both','Екологична химия','Ecological Chemistry'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-yadrena-himiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='yadrena-himiya'),
  (SELECT id FROM professional_field WHERE code='4.2'),
  'bachelor','full_time','bg',8,240,820.00,'both','Ядрена химия','Nuclear Chemistry'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 9. Биологически факултет — останали
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-agrobiotehnologii-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='agrobiotehnologii'),
  (SELECT id FROM professional_field WHERE code='4.3'),
  'bachelor','full_time','bg',8,240,820.00,'both','Агробиотехнологии','Agrobiotechnology'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 10. Геолого-географски факултет — останали
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-regionalno-razvitie-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='regionalno-razvitie'),
  (SELECT id FROM professional_field WHERE code='3.8'),
  'bachelor','full_time','bg',8,240,780.00,'both','Регионално развитие и политика','Regional Development and Policy'
ON CONFLICT (slug) DO NOTHING;

COMMIT;
