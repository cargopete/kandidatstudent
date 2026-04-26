-- ===================================================================
-- ТУ — София: Full Program Catalog
-- Adds 10 missing bachelor programs + 4 ТКС professional bachelors
-- No phantom removals — all existing 24 programs are valid
-- ===================================================================

-- ---------------------------------------------------------------
-- 1. New specialties
-- ---------------------------------------------------------------

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'digitalni-industrialni-tehnologii','Дигитални индустриални технологии','Digital Industrial Technologies',
  id FROM professional_field WHERE code='5.13' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'dizain-i-tehnologii-obleklo','Дизайн и технологии за облекло и текстил','Design and Technologies for Clothing and Textiles',
  id FROM professional_field WHERE code='5.13' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'proektirane-i-tehnologii-obleklo','Проектиране и технологии за облекло и текстил','Design and Production Technologies for Clothing and Textiles',
  id FROM professional_field WHERE code='5.13' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'inzheneren-dizain','Инженерен дизайн','Engineering Design',
  id FROM professional_field WHERE code='5.13' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'inzhenerna-logistika','Инженерна логистика','Engineering Logistics',
  id FROM professional_field WHERE code='5.13' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'inteligentni-sistemi-industria','Интелигентни системи в индустрията, града и дома','Intelligent Systems in Industry, City and Home',
  id FROM professional_field WHERE code='5.2' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'kompyutarno-proektirane-mashinostroene','Компютърно проектиране и технологии в машиностроенето','Computer Design and Technologies in Mechanical Engineering',
  id FROM professional_field WHERE code='5.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'menidzhment-bis','Мениджмънт и бизнес информационни системи','Management and Business Information Systems',
  id FROM professional_field WHERE code='3.7' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'prilozhna-fizika','Приложна физика и компютърно моделиране','Applied Physics and Computer Modelling',
  id FROM professional_field WHERE code='4.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'prilozhna-el-i-komp-tehnika','Приложна електронна и компютърна техника','Applied Electronic and Computer Engineering',
  id FROM professional_field WHERE code='5.2' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'tehnologiya-mashinostroene','Технология на машиностроенето','Machine Building Technology',
  id FROM professional_field WHERE code='5.1' ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------
-- 2. Missing bachelor programs
-- ---------------------------------------------------------------

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-analiz-na-danni-bak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='analiz-na-danni'),
  (SELECT id FROM professional_field WHERE code='4.6'),
  'bachelor','full_time','bg',8,240,NULL,'both','Анализ на данни','Data Analysis'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-digitalni-ind-tehnologii-bak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='digitalni-industrialni-tehnologii'),
  (SELECT id FROM professional_field WHERE code='5.13'),
  'bachelor','full_time','bg',8,240,NULL,'both','Дигитални индустриални технологии','Digital Industrial Technologies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-dizain-obleklo-bak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='dizain-i-tehnologii-obleklo'),
  (SELECT id FROM professional_field WHERE code='5.13'),
  'bachelor','full_time','bg',8,240,NULL,'both','Дизайн и технологии за облекло и текстил','Design and Technologies for Clothing and Textiles'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-proektirane-obleklo-bak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='proektirane-i-tehnologii-obleklo'),
  (SELECT id FROM professional_field WHERE code='5.13'),
  'bachelor','full_time','bg',8,240,NULL,'both','Проектиране и технологии за облекло и текстил','Design and Production Technologies for Clothing and Textiles'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-inzheneren-dizain-bak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='inzheneren-dizain'),
  (SELECT id FROM professional_field WHERE code='5.13'),
  'bachelor','full_time','bg',8,240,NULL,'both','Инженерен дизайн','Engineering Design'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-inzhenerna-logistika-bak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='inzhenerna-logistika'),
  (SELECT id FROM professional_field WHERE code='5.13'),
  'bachelor','full_time','bg',8,240,NULL,'both','Инженерна логистика','Engineering Logistics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-inteligentni-sistemi-ind-bak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='inteligentni-sistemi-industria'),
  (SELECT id FROM professional_field WHERE code='5.2'),
  'bachelor','full_time','bg',8,240,NULL,'both','Интелигентни системи в индустрията, града и дома','Intelligent Systems in Industry, City and Home'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-komp-proektirane-mash-bak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='kompyutarno-proektirane-mashinostroene'),
  (SELECT id FROM professional_field WHERE code='5.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Компютърно проектиране и технологии в машиностроенето','Computer Design and Technologies in Mechanical Engineering'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-menidzhment-bis-bak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='menidzhment-bis'),
  (SELECT id FROM professional_field WHERE code='3.7'),
  'bachelor','full_time','bg',8,240,NULL,'both','Мениджмънт и бизнес информационни системи','Management and Business Information Systems'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-prilozhna-fizika-bak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='prilozhna-fizika'),
  (SELECT id FROM professional_field WHERE code='4.1'),
  'bachelor','full_time','bg',8,240,NULL,'both','Приложна физика и компютърно моделиране','Applied Physics and Computer Modelling'
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------
-- 3. ТКС при ТУ-София — professional bachelor programs
-- ---------------------------------------------------------------

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-tks-energetika-profbak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='energetika'),
  (SELECT id FROM professional_field WHERE code='5.4'),
  'professional_bachelor','full_time','bg',6,180,NULL,'both','Енергетика (ТКС)','Energy (Technical College Sofia)'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-tks-elektroenergetics-profbak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='elektroenergetics'),
  (SELECT id FROM professional_field WHERE code='5.2'),
  'professional_bachelor','full_time','bg',6,180,NULL,'both','Електроенергетика – производство и разпределение (ТКС)','Electrical Energy – Production and Distribution (TCS)'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-tks-prilozhna-el-tehnika-profbak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='prilozhna-el-i-komp-tehnika'),
  (SELECT id FROM professional_field WHERE code='5.2'),
  'professional_bachelor','full_time','bg',6,180,NULL,'both','Приложна електронна и компютърна техника (ТКС)','Applied Electronic and Computer Engineering (TCS)'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'tus-tks-tehnologiya-mashinostroene-profbak-rd',
  (SELECT id FROM institution WHERE slug='tu-sofia'),
  (SELECT id FROM specialty WHERE slug='tehnologiya-mashinostroene'),
  (SELECT id FROM professional_field WHERE code='5.1'),
  'professional_bachelor','full_time','bg',6,180,NULL,'both','Технология на машиностроенето (ТКС)','Machine Building Technology (TCS)'
ON CONFLICT (slug) DO NOTHING;
