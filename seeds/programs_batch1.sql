-- Seed: Program offerings, batch 1 — 5 Bulgarian HEIs (учебна 2025/2026)
-- Source: Research report compiled 2026-04-25 from official university and MES sources
-- Coverage: МУ-С (full), ТУ-С (20 key programs), УНСС (16), ПУ (22), СУ (14)
-- Fees: tuition_bgn_per_year stores the state-subsidised annual fee where known.
--       funding='both' = state-quota places AND paid places both available.
--       NULL tuition = data not available in research report.

BEGIN;

-- ══════════════════════════════════════════════════════════════════════════
-- 0. Missing canonical specialties (primarily 7.5 health-care programmes
--    offered in МУ-С college and FOZ faculty)
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'kinezierapiya','Кинезитерапия','Kinesitherapy',
       id FROM professional_field WHERE code='7.5' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'lekarki-asistent','Лекарски асистент','Physician Assistant',
       id FROM professional_field WHERE code='7.5' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'zubotekhnik','Зъботехник','Dental Technician',
       id FROM professional_field WHERE code='7.5' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pomoshnik-farmatsevt','Помощник-фармацевт','Pharmacy Assistant',
       id FROM professional_field WHERE code='7.5' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'meditsinsko-kozmetik','Медицинска козметика','Medical Cosmetology',
       id FROM professional_field WHERE code='7.5' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'masazhist','Масажист','Masseur',
       id FROM professional_field WHERE code='7.5' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'mediko-sotsialni-grizhi','Медико-социални грижи','Medical Social Care',
       id FROM professional_field WHERE code='7.5' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'paramedik','Парамедик','Paramedic',
       id FROM professional_field WHERE code='7.5' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'rentgenov-laborant','Рентгенов лаборант','Radiographic Technologist',
       id FROM professional_field WHERE code='7.5' ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'upravlenie-zdravni-grizhi','Управление на здравните грижи','Health Care Management',
       id FROM professional_field WHERE code='7.4' ON CONFLICT (slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════
-- 1. Медицински университет – София  (mu-sofia)
-- ══════════════════════════════════════════════════════════════════════════
-- Fees (state quota): Медицина / Дентална / Фармация = 1 200 лв./г. (РМС 362/2025)
-- Paid fees:  Медицина 11 712; Дентална 10 795; Фармация 11 735 лв./г. (Ректорска заповед 2025)

-- 1a. Core faculties (master after secondary school)

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mus-meditsina-master-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE canonical_name_bg='Медицина'),
    (SELECT id FROM professional_field WHERE code='7.1'),
    'master','full_time','bg',12,360,1200.00,'both',
    'Медицина','Medicine'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mus-dentalna-master-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE canonical_name_bg='Дентална медицина'),
    (SELECT id FROM professional_field WHERE code='7.2'),
    'master','full_time','bg',12,360,1200.00,'both',
    'Дентална медицина','Dental Medicine'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mus-farmatsiya-master-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE canonical_name_bg='Фармация'),
    (SELECT id FROM professional_field WHERE code='7.3'),
    'master','full_time','bg',10,300,1200.00,'both',
    'Фармация','Pharmacy'
ON CONFLICT (slug) DO NOTHING;

-- 1b. ФОЗ – bachelor programmes

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-oz-bak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE canonical_name_bg='Обществено здраве'),
    (SELECT id FROM professional_field WHERE code='7.4'),
    'bachelor','full_time','bg',8,240,'both',
    'Обществено здраве и здравен мениджмънт','Public Health and Health Management'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-oz-bak-zd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE canonical_name_bg='Обществено здраве'),
    (SELECT id FROM professional_field WHERE code='7.4'),
    'bachelor','part_time','bg',8,240,'both',
    'Обществено здраве и здравен мениджмънт (задочно)','Public Health and Health Management (part-time)'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-uz-grizhi-bak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE slug='upravlenie-zdravni-grizhi'),
    (SELECT id FROM professional_field WHERE code='7.4'),
    'bachelor','full_time','bg',8,240,'both',
    'Управление на здравните грижи','Health Care Management'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-kinezierapiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE slug='kinezierapiya'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'bachelor','full_time','bg',8,240,'both',
    'Кинезитерапия','Kinesitherapy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-med-sestra-bak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE canonical_name_bg='Медицинска сестра'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'bachelor','full_time','bg',8,240,'both',
    'Медицинска сестра','Nursing'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-akusherka-bak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE canonical_name_bg='Акушерка'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'bachelor','full_time','bg',8,240,'both',
    'Акушерка','Midwifery'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-lekarki-asistent-bak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE slug='lekarki-asistent'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'bachelor','full_time','bg',8,240,'both',
    'Лекарски асистент','Physician Assistant'
ON CONFLICT (slug) DO NOTHING;

-- 1c. Медицински колеж „Й. Филаретова" – professional bachelor

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-med-laborant-pbak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE canonical_name_bg='Медицинска лаборатория'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'professional_bachelor','full_time','bg',6,180,'both',
    'Медицински лаборант','Medical Laboratory Technician'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-rentgenov-laborant-pbak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE slug='rentgenov-laborant'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'professional_bachelor','full_time','bg',6,180,'both',
    'Рентгенов лаборант','Radiographic Technologist'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-zubotekhnik-pbak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE slug='zubotekhnik'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'professional_bachelor','full_time','bg',6,180,'both',
    'Зъботехник','Dental Technician'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-pomfarm-pbak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE slug='pomoshnik-farmatsevt'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'professional_bachelor','full_time','bg',6,180,'both',
    'Помощник-фармацевт','Pharmacy Assistant'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-rehabilitator-pbak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE canonical_name_bg='Рехабилитация'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'professional_bachelor','full_time','bg',6,180,'both',
    'Рехабилитатор','Rehabilitation Therapist'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-inspektor-oz-pbak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE canonical_name_bg='Инспектор по обществено здраве'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'professional_bachelor','full_time','bg',6,180,'both',
    'Инспектор по обществено здраве','Public Health Inspector'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-med-kozmetik-pbak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE slug='meditsinsko-kozmetik'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'professional_bachelor','full_time','bg',6,180,'both',
    'Медицинска козметика','Medical Cosmetology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-masazhist-pbak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE slug='masazhist'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'professional_bachelor','full_time','bg',6,180,'both',
    'Масажист (за лица с увредено зрение)','Masseur (for the visually impaired)'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-mediko-soc-pbak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE slug='mediko-sotsialni-grizhi'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'professional_bachelor','full_time','bg',6,180,'both',
    'Медико-социални грижи','Medical and Social Care'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    funding, title_bg, title_en)
SELECT 'mus-paramedik-pbak-rd',
    (SELECT id FROM institution   WHERE slug='mu-sofia'),
    (SELECT id FROM specialty     WHERE slug='paramedik'),
    (SELECT id FROM professional_field WHERE code='7.5'),
    'professional_bachelor','full_time','bg',6,180,'both',
    'Парамедик','Paramedic'
ON CONFLICT (slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════
-- 2. Технически университет – София  (tu-sofia)
-- ══════════════════════════════════════════════════════════════════════════
-- State fees (annual) from Заповед № 1797/12.06.2025:
--   1.2 / 1.3      →  493 лв./г.  (246.50 × 2 сем.)
--   3.7 редовно    →  800 лв./г.  (400 × 2)
--   4.5 редовно    → 1 200 лв./г. (600 × 2)
--   4.6 редовно    → 1 500 лв./г. (750 × 2)
--   5.3 редовно    → 1 500 лв./г. (750 × 2)
--   5.4            →    0 лв./г.  (защитено направление)
--   5.12 редовно   →  900 лв./г.  (450 × 2)
--   др. обл. 5     → 1 200 лв./г. (600 × 2)

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-informatika-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='informatika'),
    (SELECT id FROM professional_field WHERE code='4.6'),
    'bachelor','full_time','bg',8,240,1500.00,'both',
    'Информатика и софтуерни науки','Informatics and Software Science'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-kompyutarni-nauki-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='kompyutarni-nauki'),
    (SELECT id FROM professional_field WHERE code='4.6'),
    'bachelor','full_time','bg',8,240,1500.00,'both',
    'Компютърно и софтуерно инженерство','Computer and Software Engineering'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-kompyutarni-nauki-bak-rd-en',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='kompyutarni-nauki'),
    (SELECT id FROM professional_field WHERE code='4.6'),
    'bachelor','full_time','en',8,240,NULL,'both',
    'Компютърни науки и инженерство','Computer Science and Engineering'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-izkustven-intelekt-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='izkustven-intelekt'),
    (SELECT id FROM professional_field WHERE code='4.6'),
    'bachelor','full_time','bg',8,240,1500.00,'both',
    'Интелигентни системи и изкуствен интелект','Intelligent Systems and Artificial Intelligence'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-kibersigurnost-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='kibersigurnost'),
    (SELECT id FROM professional_field WHERE code='5.3'),
    'bachelor','full_time','bg',8,240,1500.00,'both',
    'Киберсигурност','Cybersecurity'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-telekomunikatsii-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='telekomunikatsii'),
    (SELECT id FROM professional_field WHERE code='5.3'),
    'bachelor','full_time','bg',8,240,1500.00,'both',
    'Телекомуникации','Telecommunications'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-it-industria-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='informatsionni-tehnologii'),
    (SELECT id FROM professional_field WHERE code='5.3'),
    'bachelor','full_time','bg',8,240,1500.00,'both',
    'Информационни технологии в индустрията','Information Technologies in Industry'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-kompyutarna-tehnika-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='kompyutarna-tehnika'),
    (SELECT id FROM professional_field WHERE code='5.3'),
    'bachelor','full_time','bg',8,240,1500.00,'both',
    'Електронни информационни системи','Electronic Information Systems'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-yadrena-energetika-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='yadrena-energetika'),
    (SELECT id FROM professional_field WHERE code='5.4'),
    'bachelor','full_time','bg',8,240,0.00,'state_subsidy',
    'Топлоенергетика и Ядрена енергетика','Heat and Nuclear Energy Engineering'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-energetika-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='energetika'),
    (SELECT id FROM professional_field WHERE code='5.4'),
    'bachelor','full_time','bg',8,240,0.00,'state_subsidy',
    'Възобновяеми енергийни технологии и флуидна техника','Renewable Energy Technologies and Fluid Engineering'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-mashinno-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='mashinno-inzhenerstvo'),
    (SELECT id FROM professional_field WHERE code='5.1'),
    'bachelor','full_time','bg',8,240,1200.00,'both',
    'Машиностроене','Mechanical Engineering'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-mehatronika-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='mehatronika'),
    (SELECT id FROM professional_field WHERE code='5.1'),
    'bachelor','full_time','bg',8,240,1200.00,'both',
    'Мехатроника','Mechatronics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-toploenenergetika-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='toploenenergetika'),
    (SELECT id FROM professional_field WHERE code='5.1'),
    'bachelor','full_time','bg',8,240,1200.00,'both',
    'Топлинни и хладилни технологии и системи','Thermal and Refrigeration Technologies and Systems'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-elektrotehnika-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='elektrotehnika'),
    (SELECT id FROM professional_field WHERE code='5.2'),
    'bachelor','full_time','bg',8,240,1200.00,'both',
    'Електротехника','Electrical Engineering'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-elektroenergetics-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='elektroenergetics'),
    (SELECT id FROM professional_field WHERE code='5.2'),
    'bachelor','full_time','bg',8,240,1200.00,'both',
    'Електроенергетика и електрообзавеждане','Electrical Power Engineering'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-avtomatika-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='avtomatika'),
    (SELECT id FROM professional_field WHERE code='5.2'),
    'bachelor','full_time','bg',8,240,1200.00,'both',
    'Автоматика, информационна и управляваща техника','Automation, Information and Control Engineering'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-elektronika-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='elektronika'),
    (SELECT id FROM professional_field WHERE code='5.2'),
    'bachelor','full_time','bg',8,240,1200.00,'both',
    'Автомобилна електроника','Automotive Electronics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-transport-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='transport'),
    (SELECT id FROM professional_field WHERE code='5.5'),
    'bachelor','full_time','bg',8,240,1200.00,'both',
    'Транспортна техника и технологии','Transport Engineering and Technologies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-inzh-menidzhment-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='inzhenerstvo-i-menidzhment'),
    (SELECT id FROM professional_field WHERE code='5.13'),
    'bachelor','full_time','bg',8,240,1200.00,'both',
    'Технология и управление на транспорта','Transport Technology and Management'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-industrialen-menidzhment-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='industrialen-menidzhmunt'),
    (SELECT id FROM professional_field WHERE code='5.13'),
    'bachelor','full_time','bg',8,240,1200.00,'both',
    'Индустриален мениджмънт','Industrial Management'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-biznes-upravlenie-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='stopansko-upravlenie'),
    (SELECT id FROM professional_field WHERE code='3.7'),
    'bachelor','full_time','bg',8,240,800.00,'both',
    'Бизнес управление','Business Management'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-prilozhna-mat-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='prilozhna-matematika'),
    (SELECT id FROM professional_field WHERE code='4.5'),
    'bachelor','full_time','bg',8,240,1200.00,'both',
    'Приложна математика и информатика','Applied Mathematics and Informatics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-aviotehnika-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='aviotehnika'),
    (SELECT id FROM professional_field WHERE code='5.5'),
    'bachelor','full_time','bg',8,240,1200.00,'both',
    'Авиационна техника и технологии','Aviation Engineering and Technologies'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'tus-pedob-mat-fiz-inf-bak-rd',
    (SELECT id FROM institution   WHERE slug='tu-sofia'),
    (SELECT id FROM specialty     WHERE slug='pedob-matematika'),
    (SELECT id FROM professional_field WHERE code='1.3'),
    'bachelor','full_time','bg',8,240,493.00,'both',
    'Педагогика на обучението по математика, физика и информатика',
    'Pedagogy of Mathematics, Physics and Informatics Education'
ON CONFLICT (slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════
-- 3. Университет за национално и световно стопанство  (unss-sofia)
-- ══════════════════════════════════════════════════════════════════════════
-- State fees (annual, РМС 362/2025):
--   3.7 Администрация и управление → 700 лв./г.
--   3.8 Икономика                  → 700 лв./г.
--   3.1 / 3.3 / 3.5 / 3.6         → 900 лв./г.

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-finansi-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='finansi'),
    (SELECT id FROM professional_field WHERE code='3.8'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Финанси','Finance'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-ikonomika-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='ikonomika'),
    (SELECT id FROM professional_field WHERE code='3.8'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Икономика','Economics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-schetovodstvo-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='schetovodstvo-i-kontrol'),
    (SELECT id FROM professional_field WHERE code='3.8'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Счетоводство','Accounting'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-marketing-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='marketing'),
    (SELECT id FROM professional_field WHERE code='3.8'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Маркетинг','Marketing'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-mio-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='mezhdunarodni-ikonomicheski-otnosheniya'),
    (SELECT id FROM professional_field WHERE code='3.8'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Международни икономически отношения','International Economic Relations'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-ikonomika-turizam-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='ikonomika-na-turizma'),
    (SELECT id FROM professional_field WHERE code='3.8'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Икономика на туризма','Tourism Economics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-statistika-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='statistika-i-ikonomometrika'),
    (SELECT id FROM professional_field WHERE code='3.8'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Статистика и иконометрика','Statistics and Econometrics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-biznes-admin-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='biznes-administratsiya'),
    (SELECT id FROM professional_field WHERE code='3.7'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Бизнес администрация','Business Administration'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-publichna-admin-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='publichna-administratsiya'),
    (SELECT id FROM professional_field WHERE code='3.7'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Публична администрация','Public Administration'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-stopansko-upravlenie-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='stopansko-upravlenie'),
    (SELECT id FROM professional_field WHERE code='3.7'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Стопанско управление','Business Management'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-zhurnalistika-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='zhurnalistika'),
    (SELECT id FROM professional_field WHERE code='3.5'),
    'bachelor','full_time','bg',8,240,900.00,'both',
    'Медии и журналистика','Media and Journalism'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-pr-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='vrazki-s-obshtestvenostta'),
    (SELECT id FROM professional_field WHERE code='3.5'),
    'bachelor','full_time','bg',8,240,900.00,'both',
    'Връзки с обществеността','Public Relations'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-politologiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='politologiya'),
    (SELECT id FROM professional_field WHERE code='3.3'),
    'bachelor','full_time','bg',8,240,900.00,'both',
    'Политология','Political Science'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-mo-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='mezhdunarodni-otnosheniya'),
    (SELECT id FROM professional_field WHERE code='3.3'),
    'bachelor','full_time','bg',8,240,900.00,'both',
    'Международни отношения','International Relations'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-sotsiologiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='sotsiologiya'),
    (SELECT id FROM professional_field WHERE code='3.1'),
    'bachelor','full_time','bg',8,240,900.00,'both',
    'Социология','Sociology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'unss-pravo-master-rd',
    (SELECT id FROM institution   WHERE slug='unss-sofia'),
    (SELECT id FROM specialty     WHERE slug='pravo'),
    (SELECT id FROM professional_field WHERE code='3.6'),
    'master','full_time','bg',11,330,900.00,'both',
    'Право (магистър след средно образование)','Law (integrated master after secondary school)'
ON CONFLICT (slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════
-- 4. Пловдивски университет „Паисий Хилендарски"  (pu-plovdiv)
-- ══════════════════════════════════════════════════════════════════════════
-- State fees: ~700 лв./г. for most fields (ПМС 362/2025)

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-informatika-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='informatika'),
    (SELECT id FROM professional_field WHERE code='4.6'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Информатика','Informatics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-kompyutarni-nauki-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='kompyutarni-nauki'),
    (SELECT id FROM professional_field WHERE code='4.6'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Софтуерно инженерство','Software Engineering'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-izkustven-intelekt-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='izkustven-intelekt'),
    (SELECT id FROM professional_field WHERE code='4.6'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Изкуствен интелект','Artificial Intelligence'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-matematika-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='matematika'),
    (SELECT id FROM professional_field WHERE code='4.5'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Математика','Mathematics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-prilozhna-matematika-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='prilozhna-matematika'),
    (SELECT id FROM professional_field WHERE code='4.5'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Приложна математика','Applied Mathematics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-biologiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='biologiya'),
    (SELECT id FROM professional_field WHERE code='4.3'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Биология','Biology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-ekologiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='ekologiya-i-opm'),
    (SELECT id FROM professional_field WHERE code='4.3'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Екология и опазване на околната среда','Ecology and Environmental Protection'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-mikrobiologiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='mikrobiologiya'),
    (SELECT id FROM professional_field WHERE code='4.3'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Микробиология и вирусология','Microbiology and Virology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-himiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='himiya'),
    (SELECT id FROM professional_field WHERE code='4.2'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Химия','Chemistry'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-psihologiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='psihologiya'),
    (SELECT id FROM professional_field WHERE code='3.2'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Психология','Psychology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-finansi-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='finansi'),
    (SELECT id FROM professional_field WHERE code='3.8'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Финанси','Finance'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-schetovodstvo-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='schetovodstvo-i-kontrol'),
    (SELECT id FROM professional_field WHERE code='3.8'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Счетоводство','Accounting'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-marketing-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='marketing'),
    (SELECT id FROM professional_field WHERE code='3.8'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Маркетинг','Marketing'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-publichna-admin-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='publichna-administratsiya'),
    (SELECT id FROM professional_field WHERE code='3.7'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Публична администрация','Public Administration'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-balgarska-filologiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='balgarska-filologiya'),
    (SELECT id FROM professional_field WHERE code='2.1'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Българска филология','Bulgarian Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-angliiska-filologiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='angliiska-filologiya'),
    (SELECT id FROM professional_field WHERE code='2.1'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Английска филология','English Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-istoriya-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='istoriya'),
    (SELECT id FROM professional_field WHERE code='2.2'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'История','History'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-nachalna-pedagogy-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='nachalna-uchilishna-pedagogy'),
    (SELECT id FROM professional_field WHERE code='1.2'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Начална училищна педагогика','Primary School Education'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-preduchilishna-pedagogy-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='preduchilishna-pedagogy'),
    (SELECT id FROM professional_field WHERE code='1.2'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Предучилищна педагогика','Preschool Education'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-sotsialna-pedagogy-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='sotsialna-pedagogika'),
    (SELECT id FROM professional_field WHERE code='3.4'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Социална педагогика','Social Pedagogy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-spetsialna-pedagogy-bak-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='spetsialna-pedagogy'),
    (SELECT id FROM professional_field WHERE code='1.2'),
    'bachelor','full_time','bg',8,240,700.00,'both',
    'Специална педагогика','Special Education'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'pu-pravo-master-rd',
    (SELECT id FROM institution   WHERE slug='pu-plovdiv'),
    (SELECT id FROM specialty     WHERE slug='pravo'),
    (SELECT id FROM professional_field WHERE code='3.6'),
    'master','full_time','bg',10,300,700.00,'both',
    'Право (магистър след средно образование)','Law (integrated master after secondary school)'
ON CONFLICT (slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════
-- 5. Софийски университет „Св. Климент Охридски"  (su-sofia)
-- ══════════════════════════════════════════════════════════════════════════
-- Fees: verified only for select programs (Заповед РД-19-448/2025).
--       NULL = exact state-quota fee not available in current source data.

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-meditsina-master-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE canonical_name_bg='Медицина'),
    (SELECT id FROM professional_field WHERE code='7.1'),
    'master','full_time','bg',12,360,NULL,'both',
    'Медицина','Medicine'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-farmatsiya-master-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE canonical_name_bg='Фармация'),
    (SELECT id FROM professional_field WHERE code='7.3'),
    'master','full_time','bg',10,300,NULL,'both',
    'Фармация','Pharmacy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-pravo-master-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE slug='pravo'),
    (SELECT id FROM professional_field WHERE code='3.6'),
    'master','full_time','bg',10,300,NULL,'both',
    'Право (магистър след средно образование)','Law (integrated master after secondary school)'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-informatika-bak-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE slug='informatika'),
    (SELECT id FROM professional_field WHERE code='4.6'),
    'bachelor','full_time','bg',8,240,NULL,'both',
    'Информатика','Informatics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-kompyutarni-nauki-bak-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE slug='kompyutarni-nauki'),
    (SELECT id FROM professional_field WHERE code='4.6'),
    'bachelor','full_time','bg',8,240,NULL,'both',
    'Компютърни науки','Computer Science'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-matematika-bak-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE slug='matematika'),
    (SELECT id FROM professional_field WHERE code='4.5'),
    'bachelor','full_time','bg',8,240,NULL,'both',
    'Математика','Mathematics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-fizika-bak-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE slug='fizika'),
    (SELECT id FROM professional_field WHERE code='4.1'),
    'bachelor','full_time','bg',8,240,NULL,'both',
    'Физика','Physics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-himiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE slug='himiya'),
    (SELECT id FROM professional_field WHERE code='4.2'),
    'bachelor','full_time','bg',8,240,NULL,'both',
    'Химия','Chemistry'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-biologiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE slug='biologiya'),
    (SELECT id FROM professional_field WHERE code='4.3'),
    'bachelor','full_time','bg',8,240,NULL,'both',
    'Биология','Biology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-psihologiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE slug='psihologiya'),
    (SELECT id FROM professional_field WHERE code='3.2'),
    'bachelor','full_time','bg',8,240,NULL,'both',
    'Психология','Psychology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-istoriya-bak-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE slug='istoriya'),
    (SELECT id FROM professional_field WHERE code='2.2'),
    'bachelor','full_time','bg',8,240,NULL,'both',
    'История','History'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-filosofiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE slug='filosofiya'),
    (SELECT id FROM professional_field WHERE code='2.3'),
    'bachelor','full_time','bg',8,240,NULL,'both',
    'Философия','Philosophy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-balgarska-filologiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE slug='balgarska-filologiya'),
    (SELECT id FROM professional_field WHERE code='2.1'),
    'bachelor','full_time','bg',8,240,NULL,'both',
    'Българска филология','Bulgarian Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-zhurnalistika-bak-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE slug='zhurnalistika'),
    (SELECT id FROM professional_field WHERE code='3.5'),
    'bachelor','full_time','bg',8,240,NULL,'both',
    'Журналистика','Journalism'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'su-teologiya-bak-rd',
    (SELECT id FROM institution   WHERE slug='su-sofia'),
    (SELECT id FROM specialty     WHERE slug='teologiya'),
    (SELECT id FROM professional_field WHERE code='2.4'),
    'bachelor','full_time','bg',8,240,NULL,'both',
    'Теология','Theology'
ON CONFLICT (slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════
COMMIT;

SELECT
    i.short_name_bg              AS institution,
    count(*)                     AS programs_inserted
FROM program_offering po
JOIN institution i ON i.id = po.institution_id
WHERE i.slug IN ('mu-sofia','tu-sofia','unss-sofia','pu-plovdiv','su-sofia')
GROUP BY i.short_name_bg
ORDER BY i.short_name_bg;
