-- Seed: Program offerings, batch 4 — СУ пълно покритие (продължение)
-- Source: uni-sofia.bg official faculty pages, fmi.uni-sofia.bg — учебна 2025/2026
-- Adds missing specialty slugs + remaining СУ programs not covered in batch 3.

BEGIN;

-- ══════════════════════════════════════════════════════════════════════════
-- 0. New canonical specialties missing from the initial seed
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'frenska-filologiya','Французска филология','French Philology',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'ispanska-filologiya','Испанска филология','Spanish Philology',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'italianska-filologiya','Италианска филология','Italian Philology',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'niderlandska-filologiya','Нидерландска филология','Dutch Philology',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'skandinavistika','Скандинавистика','Scandinavian Studies',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'arabistika','Арабистика','Arabic Studies',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'kitaistika','Китаистика','Chinese Studies',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'yaponistika','Японистика','Japanese Studies',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'koreistika','Кореистика','Korean Studies',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'slavyanska-filologiya','Славянска филология','Slavic Philology',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'balkanistika','Балканистика','Balkan Studies',
  id FROM professional_field WHERE code='2.1' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'arhivistika','Архивистика и документалистика','Archival Studies',
  id FROM professional_field WHERE code='2.2' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'etnologiya-i-antropologiya','Eтнология и културна антропология','Ethnology and Cultural Anthropology',
  id FROM professional_field WHERE code='2.2' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'ikonomika-i-finansi','Икономика и финанси','Economics and Finance',
  id FROM professional_field WHERE code='3.8' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'analiz-na-danni','Анализ на данни','Data Analytics',
  id FROM professional_field WHERE code='4.5' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'informatsionni-sistemi','Информационни системи','Information Systems',
  id FROM professional_field WHERE code='4.6' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'softuerno-inzhenerstvo','Софтуерно инженерство','Software Engineering',
  id FROM professional_field WHERE code='4.6' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'matematika-i-informatika','Математика и информатика','Mathematics and Informatics',
  id FROM professional_field WHERE code='1.3' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'molekulyarna-biologiya','Молекулярна биология','Molecular Biology',
  id FROM professional_field WHERE code='4.3' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'inzhenerna-fizika','Инженерна физика','Engineering Physics',
  id FROM professional_field WHERE code='4.1' ON CONFLICT (slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════
-- 1. Исторически факултет (History Faculty)
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-etnologiya-i-antropologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='etnologiya-i-antropologiya'),
  (SELECT id FROM professional_field WHERE code='2.2'),
  'bachelor','full_time','bg',8,240,750.00,'both','Eтнология и културна антропология','Ethnology and Cultural Anthropology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-arhivistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='arhivistika'),
  (SELECT id FROM professional_field WHERE code='2.2'),
  'bachelor','full_time','bg',8,240,750.00,'both','Архивистика и документалистика','Archival Studies and Documentation'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 2. Факултет по класически и нови филологии
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-frenska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='frenska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Французска филология','French Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-ispanska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='ispanska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Испанска филология','Spanish Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-italianska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='italianska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Италианска филология','Italian Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-turska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='turska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Тюркология','Turkology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-arabistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='arabistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Арабистика','Arabic Studies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-kitaistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='kitaistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Китаистика','Chinese Studies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-yaponistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='yaponistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Японистика','Japanese Studies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-koreistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='koreistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Кореистика','Korean Studies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-skandinavistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='skandinavistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Скандинавистика','Scandinavian Studies'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 3. Факултет по славянски филологии
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-slavyanska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='slavyanska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Славянска филология','Slavic Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-balkanistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='balkanistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Балканистика','Balkan Studies'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 4. Стопански факултет
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-ikonomika-i-finansi-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='ikonomika-i-finansi'),
  (SELECT id FROM professional_field WHERE code='3.8'),
  'bachelor','full_time','bg',8,240,840.00,'both','Икономика и финанси','Economics and Finance'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 5. Факултет по науки за образованието и изкуствата (ФНОИ)
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-fizichesko-vazpitanie-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='fizichesko-vazpitanie-i-sport'),
  (SELECT id FROM professional_field WHERE code='7.6'),
  'bachelor','full_time','bg',8,240,750.00,'both','Физическо възпитание и спорт','Physical Education and Sport'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-izobrazitelno-izkustvo-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='izobrazitelno-izkustvo'),
  (SELECT id FROM professional_field WHERE code='8.2'),
  'bachelor','full_time','bg',8,240,750.00,'both','Изобразително изкуство','Visual Arts'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-grafika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='grafika'),
  (SELECT id FROM professional_field WHERE code='8.2'),
  'bachelor','full_time','bg',8,240,750.00,'both','Графичен дизайн','Graphic Design'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-muzika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='muzika'),
  (SELECT id FROM professional_field WHERE code='8.3'),
  'bachelor','full_time','bg',8,240,750.00,'both','Музика','Music'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 6. Медицински факултет
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-meditsinskа-sestra-profbak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='meditsinskа-sestra'),
  (SELECT id FROM professional_field WHERE code='7.5'),
  'professional_bachelor','full_time','bg',6,180,NULL,'both','Медицинска сестра','Nursing'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-rehabilitator-profbak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='rehabilitator'),
  (SELECT id FROM professional_field WHERE code='7.5'),
  'professional_bachelor','full_time','bg',6,180,NULL,'both','Медицинска рехабилитация и ерготерапия','Medical Rehabilitation and Ergotherapy'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 7. Физически факултет
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-inzhenerna-fizika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='inzhenerna-fizika'),
  (SELECT id FROM professional_field WHERE code='4.1'),
  'bachelor','full_time','bg',8,240,840.00,'both','Инженерна физика','Engineering Physics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-optometriya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='optometriya'),
  (SELECT id FROM professional_field WHERE code='7.5'),
  'bachelor','full_time','bg',8,240,NULL,'both','Оптометрия','Optometry'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 8. Биологически факултет
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-molekulyarna-biologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='molekulyarna-biologiya'),
  (SELECT id FROM professional_field WHERE code='4.3'),
  'bachelor','full_time','bg',8,240,820.00,'both','Молекулярна биология','Molecular Biology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-biotehnologii-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='biotehnologii'),
  (SELECT id FROM professional_field WHERE code='5.11'),
  'bachelor','full_time','bg',8,240,820.00,'both','Биотехнологии','Biotechnology'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 9. Геолого-географски факултет
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-turizum-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='turizum'),
  (SELECT id FROM professional_field WHERE code='3.9'),
  'bachelor','full_time','bg',8,240,750.00,'both','Туризъм','Tourism'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- 10. Факултет по математика и информатика (ФМИ)
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-analiz-na-danni-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='analiz-na-danni'),
  (SELECT id FROM professional_field WHERE code='4.5'),
  'bachelor','full_time','bg',8,240,870.00,'both','Анализ на данни','Data Analytics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-informatsionni-sistemi-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='informatsionni-sistemi'),
  (SELECT id FROM professional_field WHERE code='4.6'),
  'bachelor','full_time','bg',8,240,870.00,'both','Информационни системи','Information Systems'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-softuerno-inzhenerstvo-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='softuerno-inzhenerstvo'),
  (SELECT id FROM professional_field WHERE code='4.6'),
  'bachelor','full_time','bg',8,240,870.00,'both','Софтуерно инженерство','Software Engineering'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-matematika-i-informatika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='matematika-i-informatika'),
  (SELECT id FROM professional_field WHERE code='1.3'),
  'bachelor','full_time','bg',8,240,840.00,'both','Математика и информатика','Mathematics and Informatics'
ON CONFLICT (slug) DO NOTHING;

COMMIT;
