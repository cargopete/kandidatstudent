-- Seed: Program offerings, batch 3 — СУ "Св. Климент Охридски" (пълно покритие)
-- Source: Официален сайт на СУ, НАОА акредитации, МОН регистри — учебна 2025/2026
-- Covers all 16 faculties. Batch 1 already seeded 15 programs; this adds the rest.
-- Tuition: state-subsidised annual fee (лв.) per РМС 362/2025.
-- funding='both' — state quota + paid places available.

BEGIN;

-- ══════════════════════════════════════════════════════════════════════════
-- Факултет по класически и нови филологии
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-angliiska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='angliiska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Английска филология','English Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-germanska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='germanska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Германска филология','German Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-romanska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='romanska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Романска филология','Romance Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-klasicheska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='klasicheska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Класическа филология','Classical Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-prilozhna-lingvistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='prilozhna-lingvistika'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Приложна лингвистика','Applied Linguistics'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Факултет по славянски филологии
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-ruska-filologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='ruska-filologiya'),
  (SELECT id FROM professional_field WHERE code='2.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Руска филология','Russian Philology'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Исторически факултет
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-arheologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='arheologiya'),
  (SELECT id FROM professional_field WHERE code='2.2'),
  'bachelor','full_time','bg',8,240,750.00,'both','Археология','Archaeology'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Философски факултет
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-sotsiologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='sotsiologiya'),
  (SELECT id FROM professional_field WHERE code='3.1'),
  'bachelor','full_time','bg',8,240,780.00,'both','Социология','Sociology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-kulturologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='kulturologiya'),
  (SELECT id FROM professional_field WHERE code='3.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Културология','Cultural Studies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-antropologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='antropologiya'),
  (SELECT id FROM professional_field WHERE code='3.1'),
  'bachelor','full_time','bg',8,240,750.00,'both','Антропология','Anthropology'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Факултет по политически науки и международни отношения
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-politologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='politologiya'),
  (SELECT id FROM professional_field WHERE code='3.3'),
  'bachelor','full_time','bg',8,240,800.00,'both','Политология','Political Science'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-evropeistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='evropeistika'),
  (SELECT id FROM professional_field WHERE code='3.3'),
  'bachelor','full_time','bg',8,240,800.00,'both','Европеистика','European Studies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-mezhdunarodni-otnosheniya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='mezhdunarodni-otnosheniya'),
  (SELECT id FROM professional_field WHERE code='3.3'),
  'bachelor','full_time','bg',8,240,800.00,'both','Международни отношения','International Relations'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Факултет по социални дейности
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-sotsialna-rabota-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='sotsialna-rabota'),
  (SELECT id FROM professional_field WHERE code='3.4'),
  'bachelor','full_time','bg',8,240,730.00,'both','Социална работа','Social Work'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Факултет по журналистика и масова комуникация
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-vrazki-s-obshtestvenostta-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='vrazki-s-obshtestvenostta'),
  (SELECT id FROM professional_field WHERE code='3.5'),
  'bachelor','full_time','bg',8,240,800.00,'both','Връзки с обществеността','Public Relations'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-bibliotekoznanie-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='bibliotekoznanie'),
  (SELECT id FROM professional_field WHERE code='3.5'),
  'bachelor','full_time','bg',8,240,730.00,'both','Библиотечно-информационни дейности','Library and Information Science'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Стопански факултет
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-ikonomika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='ikonomika'),
  (SELECT id FROM professional_field WHERE code='3.8'),
  'bachelor','full_time','bg',8,240,840.00,'both','Икономика','Economics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-finansi-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='finansi'),
  (SELECT id FROM professional_field WHERE code='3.8'),
  'bachelor','full_time','bg',8,240,840.00,'both','Финанси','Finance'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-schetovodstvo-i-kontrol-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='schetovodstvo-i-kontrol'),
  (SELECT id FROM professional_field WHERE code='3.8'),
  'bachelor','full_time','bg',8,240,840.00,'both','Счетоводство и контрол','Accounting and Control'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-marketing-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='marketing'),
  (SELECT id FROM professional_field WHERE code='3.8'),
  'bachelor','full_time','bg',8,240,840.00,'both','Маркетинг','Marketing'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-mezhdunarodni-ikonomicheski-otnosheniya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='mezhdunarodni-ikonomicheski-otnosheniya'),
  (SELECT id FROM professional_field WHERE code='3.8'),
  'bachelor','full_time','bg',8,240,840.00,'both','Международни икономически отношения','International Economic Relations'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-statistika-i-ikonomometrika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='statistika-i-ikonomometrika'),
  (SELECT id FROM professional_field WHERE code='3.8'),
  'bachelor','full_time','bg',8,240,840.00,'both','Статистика и иконометрика','Statistics and Econometrics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-biznes-administratsiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='biznes-administratsiya'),
  (SELECT id FROM professional_field WHERE code='3.7'),
  'bachelor','full_time','bg',8,240,840.00,'both','Бизнес администрация','Business Administration'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-publichna-administratsiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='publichna-administratsiya'),
  (SELECT id FROM professional_field WHERE code='3.7'),
  'bachelor','full_time','bg',8,240,800.00,'both','Публична администрация','Public Administration'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Педагогически факултет и ФНОИ
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-pedagogy-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='pedagogy'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'bachelor','full_time','bg',8,240,730.00,'both','Педагогика','Pedagogy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-preduchilishna-pedagogy-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='preduchilishna-pedagogy'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'bachelor','full_time','bg',8,240,730.00,'both','Предучилищна педагогика','Preschool Education'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-nachalna-uchilishna-pedagogy-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='nachalna-uchilishna-pedagogy'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'bachelor','full_time','bg',8,240,730.00,'both','Начална училищна педагогика','Primary School Education'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-sotsialna-pedagogika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='sotsialna-pedagogika'),
  (SELECT id FROM professional_field WHERE code='3.4'),
  'bachelor','full_time','bg',8,240,730.00,'both','Социална педагогика','Social Pedagogy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-spetsialna-pedagogy-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='spetsialna-pedagogy'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'bachelor','full_time','bg',8,240,730.00,'both','Специална педагогика','Special Education'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-logopediya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='logopediya'),
  (SELECT id FROM professional_field WHERE code='1.2'),
  'bachelor','full_time','bg',8,240,730.00,'both','Логопедия','Speech Therapy'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Физически факултет
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-astronomiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='astronomiya'),
  (SELECT id FROM professional_field WHERE code='4.1'),
  'bachelor','full_time','bg',8,240,840.00,'both','Астрономия','Astronomy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-meteorologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='meteorologiya'),
  (SELECT id FROM professional_field WHERE code='4.1'),
  'bachelor','full_time','bg',8,240,840.00,'both','Метеорология','Meteorology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-geofizika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='geofizika'),
  (SELECT id FROM professional_field WHERE code='4.1'),
  'bachelor','full_time','bg',8,240,840.00,'both','Геофизика','Geophysics'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Биологически факултет
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-ekologiya-i-opm-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='ekologiya-i-opm'),
  (SELECT id FROM professional_field WHERE code='4.3'),
  'bachelor','full_time','bg',8,240,820.00,'both','Екология и опазване на околната среда','Ecology and Environmental Protection'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-mikrobiologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='mikrobiologiya'),
  (SELECT id FROM professional_field WHERE code='4.3'),
  'bachelor','full_time','bg',8,240,820.00,'both','Микробиология','Microbiology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-biohimiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='biohimiya'),
  (SELECT id FROM professional_field WHERE code='4.3'),
  'bachelor','full_time','bg',8,240,820.00,'both','Биохимия','Biochemistry'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Геолого-географски факултет
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-geografiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='geografiya'),
  (SELECT id FROM professional_field WHERE code='4.4'),
  'bachelor','full_time','bg',8,240,820.00,'both','География','Geography'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-geologiya-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='geologiya'),
  (SELECT id FROM professional_field WHERE code='4.4'),
  'bachelor','full_time','bg',8,240,820.00,'both','Геология','Geology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-kartografiya-i-geoinformatika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='kartografiya-i-geoinformatika'),
  (SELECT id FROM professional_field WHERE code='4.4'),
  'bachelor','full_time','bg',8,240,820.00,'both','Картография и геоинформатика','Cartography and Geoinformatics'
ON CONFLICT (slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Факултет по математика и информатика
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-prilozhna-matematika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='prilozhna-matematika'),
  (SELECT id FROM professional_field WHERE code='4.5'),
  'bachelor','full_time','bg',8,240,870.00,'both','Приложна математика','Applied Mathematics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-statistika-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='statistika'),
  (SELECT id FROM professional_field WHERE code='4.5'),
  'bachelor','full_time','bg',8,240,870.00,'both','Статистика','Statistics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (slug,institution_id,specialty_id,professional_field_id,oks_level,study_form,language,duration_semesters,ects_credits,tuition_bgn_per_year,funding,title_bg,title_en)
SELECT 'su-izkustven-intelekt-bak-rd',
  (SELECT id FROM institution WHERE slug='su-sofia'),
  (SELECT id FROM specialty WHERE slug='izkustven-intelekt'),
  (SELECT id FROM professional_field WHERE code='4.6'),
  'bachelor','full_time','bg',8,240,900.00,'both','Изкуствен интелект','Artificial Intelligence'
ON CONFLICT (slug) DO NOTHING;

COMMIT;
