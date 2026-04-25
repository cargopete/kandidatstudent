-- Seed: Program offerings, batch 2 — МУ-Пловдив, МУ-Варна, ВТУ, НБУ, ЮЗУ (учебна 2025/2026)
-- Source: Research report compiled 2026-04-25 from official university and MES sources
-- Fees: tuition_bgn_per_year is the state-subsidised annual fee where known; NULL otherwise.
--   МУ-Пловдив Медицина/Дентална/Фармация: 1 200 лв./г.
--   МУ-Пловдив МС/Акушерка: 0 лв. (protected specialty per МЗ)
--   МУ-Пловдив МК: ~750 лв./г. (approximate; exact Министерска заповед TBC)
--   МУ-Варна Медицина/Дентална/Фармация: 1 400 лв./г. (I–III курс), 1 200 (IV–VI); stored as 1400
--   МУ-Варна МС/Акушерка: 0 лв. (protected)
--   МУ-Варна ФОЗ bachelors: 650–800 лв./г. per confirmed tariff
--   МУ-Варна МК: 750 лв./г.
--   ВТУ / НБУ / ЮЗУ: fees not machine-readable — NULL
-- Note: МУ-Варна filial programs (Сливен, Шумен, В.Търново) deferred until institution_branch seeded

BEGIN;

-- ══════════════════════════════════════════════════════════════════════════
-- 0. New canonical specialties for batch 2
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'meditsinski-optik', 'Медицински оптик', 'Medical Optician',
       id FROM professional_field WHERE code = '7.5'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'instruktor-dietichno-hranene', 'Инструктор по диетично хранене', 'Dietetic Instructor',
       id FROM professional_field WHERE code = '7.5'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'biomedicinska-tehnika', 'Биомедицинска техника', 'Biomedical Technology',
       id FROM professional_field WHERE code = '5.2'
ON CONFLICT (slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════
-- 1. Медицински университет – Пловдив  (mu-plovdiv)
-- ══════════════════════════════════════════════════════════════════════════

-- 1a. Core faculties (master after secondary)

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-meditsina-master',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Медицина'),
    (SELECT id FROM professional_field WHERE code = '7.1'),
    'master','full_time','bg',12,360, 1200.00,'both',
    'Медицина','Medicine'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-dentalna-master',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Дентална медицина'),
    (SELECT id FROM professional_field WHERE code = '7.2'),
    'master','full_time','bg',12,360, 1200.00,'both',
    'Дентална медицина','Dental Medicine'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-farmatsiya-master',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Фармация'),
    (SELECT id FROM professional_field WHERE code = '7.3'),
    'master','full_time','bg',10,300, 1200.00,'both',
    'Фармация','Pharmacy'
ON CONFLICT (slug) DO NOTHING;

-- 1b. ФОЗ – bachelor programs

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-ms-bachelor',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Медицинска сестра'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'bachelor','full_time','bg',8,240, 0.00,'state_subsidy',
    'Медицинска сестра','Nursing'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-akusherka-bachelor',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Акушерка'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'bachelor','full_time','bg',8,240, 0.00,'state_subsidy',
    'Акушерка','Midwifery'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-la-bachelor',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Лекарски асистент'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Лекарски асистент','Physician Assistant'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-uzg-bachelor',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Управление на здравните грижи'),
    (SELECT id FROM professional_field WHERE code = '7.4'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Управление на здравните грижи','Health Care Management'
ON CONFLICT (slug) DO NOTHING;

-- 1c. МК Пловдив – professional bachelor programs

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-mk-ml-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Медицинска лаборатория'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Медицинска лаборатория','Medical Laboratory'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-mk-rl-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Рентгенов лаборант'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Рентгенов лаборант','Radiographic Technologist'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-mk-zt-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Зъботехник'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Зъботехник','Dental Technician'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-mk-pf-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Помощник-фармацевт'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Помощник-фармацевт','Pharmacy Assistant'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-mk-reh-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Рехабилитация'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Рехабилитатор','Rehabilitation Therapist'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-mk-ioz-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Инспектор по обществено здраве'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Инспектор по обществено здраве','Public Health Inspector'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-mk-mkoz-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Медицинска козметика'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Медицинска козметика','Medical Cosmetology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-mk-mopt-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Медицински оптик'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Медицински оптик','Medical Optician'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'mupld-mk-idh-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-plovdiv'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Инструктор по диетично хранене'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Инструктор по диетично хранене','Dietetic Instructor'
ON CONFLICT (slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════
-- 2. Медицински университет „Проф. д-р Параскев Стоянов" – Варна  (mu-varna)
-- ══════════════════════════════════════════════════════════════════════════
-- State fee stored as year-1 rate (1 400 лв.); years IV–VI drop to 1 200 лв.
-- Paid: Медицина 17 629; Дентална 10 144; Фармация 13 502; МК 9 564 лв./г.
-- Мед. сестра / Акушерка at filials (Сливен, Шумен, В.Търново): deferred

-- 2a. Core faculties

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-meditsina-master-bg',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Медицина'),
    (SELECT id FROM professional_field WHERE code = '7.1'),
    'master','full_time','bg',12,360, 1400.00,'both',
    'Медицина','Medicine'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-meditsina-master-en',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Медицина'),
    (SELECT id FROM professional_field WHERE code = '7.1'),
    'master','full_time','en',12,360, NULL,'both',
    'Медицина (английско обучение)','Medicine (English)'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-dentalna-master',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Дентална медицина'),
    (SELECT id FROM professional_field WHERE code = '7.2'),
    'master','full_time','bg',12,360, 1400.00,'both',
    'Дентална медицина','Dental Medicine'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-farmatsiya-master',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Фармация'),
    (SELECT id FROM professional_field WHERE code = '7.3'),
    'master','full_time','bg',10,300, 1400.00,'both',
    'Фармация','Pharmacy'
ON CONFLICT (slug) DO NOTHING;

-- 2b. ФОЗ Варна – bachelor programs

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-ms-bachelor',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Медицинска сестра'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'bachelor','full_time','bg',8,240, 0.00,'state_subsidy',
    'Медицинска сестра','Nursing'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-akusherka-bachelor',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Акушерка'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'bachelor','full_time','bg',8,240, 0.00,'state_subsidy',
    'Акушерка','Midwifery'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-uzg-bachelor',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Управление на здравните грижи'),
    (SELECT id FROM professional_field WHERE code = '7.4'),
    'bachelor','full_time','bg',8,240, 650.00,'both',
    'Управление на здравните грижи','Health Care Management'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-zm-bachelor',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Здравен мениджмънт'),
    (SELECT id FROM professional_field WHERE code = '7.4'),
    'bachelor','full_time','bg',8,240, 650.00,'both',
    'Здравен мениджмънт','Health Management'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-kinezierapiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Кинезитерапия'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'bachelor','full_time','bg',8,240, 800.00,'both',
    'Кинезитерапия','Kinesitherapy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-logopediya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Логопедия'),
    (SELECT id FROM professional_field WHERE code = '1.2'),
    'bachelor','full_time','bg',8,240, 800.00,'both',
    'Логопедия','Speech Therapy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-bmt-bachelor',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Биомедицинска техника'),
    (SELECT id FROM professional_field WHERE code = '5.2'),
    'bachelor','full_time','bg',8,240, 800.00,'both',
    'Биомедицинска техника','Biomedical Technology'
ON CONFLICT (slug) DO NOTHING;

-- 2c. МК Варна – professional bachelor programs (state 750 лв./г., paid 9 564 лв./г.)

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-mk-ml-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Медицинска лаборатория'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Медицинска лаборатория','Medical Laboratory'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-mk-rl-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Рентгенов лаборант'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Рентгенов лаборант','Radiographic Technologist'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-mk-zt-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Зъботехник'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Зъботехник','Dental Technician'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-mk-pf-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Помощник-фармацевт'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Помощник-фармацевт','Pharmacy Assistant'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-mk-reh-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Рехабилитация'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Рехабилитатор','Rehabilitation Therapist'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-mk-ioz-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Инспектор по обществено здраве'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Инспектор по обществено здраве','Public Health Inspector'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-mk-mkoz-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Медицинска козметика'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Медицинска козметика','Medical Cosmetology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'muvar-mk-mas-profbach',
    (SELECT id FROM institution        WHERE slug = 'mu-varna'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Масажист'),
    (SELECT id FROM professional_field WHERE code = '7.5'),
    'professional_bachelor','full_time','bg',4,120, 750.00,'both',
    'Масажист','Masseur'
ON CONFLICT (slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════
-- 3. Великотърновски университет „Св. св. Кирил и Методий"  (vtu-vt)
-- ══════════════════════════════════════════════════════════════════════════
-- Coverage: ~28 of ~68 bachelor/master programs (key programs from all 9 faculties)
-- Missing: Педагогически колеж Плевен + Филиал Враца (branch_id needed), ~40 programs
-- Fees: not machine-readable — NULL throughout

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-informatika-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Информатика'),
    (SELECT id FROM professional_field WHERE code = '4.6'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Информатика','Informatics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-kompyutarni-nauki-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Компютърни науки'),
    (SELECT id FROM professional_field WHERE code = '4.6'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Компютърни науки','Computer Science'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-matematika-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Математика'),
    (SELECT id FROM professional_field WHERE code = '4.5'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Математика','Mathematics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-istoriya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'История'),
    (SELECT id FROM professional_field WHERE code = '2.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'История','History'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-arheologiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Археология'),
    (SELECT id FROM professional_field WHERE code = '2.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Археология','Archaeology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-teologiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Теология'),
    (SELECT id FROM professional_field WHERE code = '2.4'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Теология','Theology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-filosofiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Философия'),
    (SELECT id FROM professional_field WHERE code = '2.3'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Философия','Philosophy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-sotsiologiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Социология'),
    (SELECT id FROM professional_field WHERE code = '3.1'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Социология','Sociology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-psihologiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Психология'),
    (SELECT id FROM professional_field WHERE code = '3.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Психология','Psychology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-sotsialna-pedagogika-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Социална педагогика'),
    (SELECT id FROM professional_field WHERE code = '3.4'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Социална педагогика','Social Pedagogy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-sotsialna-rabota-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Социална работа'),
    (SELECT id FROM professional_field WHERE code = '3.4'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Социална работа','Social Work'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-pravo-master',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Право'),
    (SELECT id FROM professional_field WHERE code = '3.6'),
    'master','full_time','bg',10,300, NULL,'both',
    'Право','Law'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-pedagogy-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Педагогика'),
    (SELECT id FROM professional_field WHERE code = '1.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Педагогика','Pedagogy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-nachalna-pedagogy-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Начална училищна педагогика'),
    (SELECT id FROM professional_field WHERE code = '1.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Начална педагогика','Primary School Education'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-preduchilishna-pedagogy-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Предучилищна педагогика'),
    (SELECT id FROM professional_field WHERE code = '1.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Предучилищна педагогика','Preschool Education'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-spetsialna-pedagogy-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Специална педагогика'),
    (SELECT id FROM professional_field WHERE code = '1.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Специална педагогика','Special Education'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-ikonomika-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Икономика'),
    (SELECT id FROM professional_field WHERE code = '3.8'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Икономика','Economics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-finansi-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Финанси'),
    (SELECT id FROM professional_field WHERE code = '3.8'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Финанси','Finance'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-stopansko-upravlenie-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Стопанско управление'),
    (SELECT id FROM professional_field WHERE code = '3.7'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Стопанско управление','Business Management'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-turizum-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Туризъм'),
    (SELECT id FROM professional_field WHERE code = '3.9'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Туризъм','Tourism'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-stroitelno-inzhenerstvo-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Строително инженерство'),
    (SELECT id FROM professional_field WHERE code = '5.7'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Строително инженерство','Civil Engineering'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-geodeziya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Геодезия'),
    (SELECT id FROM professional_field WHERE code = '5.7'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Геодезия','Geodesy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-izobrazitelno-izkustvo-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Изобразително изкуство'),
    (SELECT id FROM professional_field WHERE code = '8.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Изобразително изкуство','Visual Arts'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-muzika-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Музика'),
    (SELECT id FROM professional_field WHERE code = '8.3'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Музика','Music'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-horeografiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Хореография'),
    (SELECT id FROM professional_field WHERE code = '8.3'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Хореография','Choreography'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-balgarska-filologiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Българска филология'),
    (SELECT id FROM professional_field WHERE code = '2.1'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Българска филология','Bulgarian Philology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'vtu-angliiska-filologiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'vtu-vt'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Английска филология'),
    (SELECT id FROM professional_field WHERE code = '2.1'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Английска филология','English Philology'
ON CONFLICT (slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════
-- 4. Нов български университет  (nbu-sofia)
-- ══════════════════════════════════════════════════════════════════════════
-- Private university; funding='paid' throughout; fees NULL (not centrally published)
-- Representative range: 1 620–2 300 лв./семестър per published semester prices
-- Coverage: ~15 of ~50 bachelor/master programs

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-pravo-master',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Право'),
    (SELECT id FROM professional_field WHERE code = '3.6'),
    'master','full_time','bg',10,300, NULL,'paid',
    'Право','Law'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-arhitektura-master',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE slug = 'arhitektura'),
    (SELECT id FROM professional_field WHERE code = '5.7'),
    'master','full_time','bg',10,300, NULL,'paid',
    'Архитектура','Architecture'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-psihologiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Психология'),
    (SELECT id FROM professional_field WHERE code = '3.2'),
    'bachelor','full_time','bg',8,240, NULL,'paid',
    'Психология','Psychology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-sotsiologiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Социология'),
    (SELECT id FROM professional_field WHERE code = '3.1'),
    'bachelor','full_time','bg',8,240, NULL,'paid',
    'Социология','Sociology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-politologiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Политология'),
    (SELECT id FROM professional_field WHERE code = '3.3'),
    'bachelor','full_time','bg',8,240, NULL,'paid',
    'Политология','Political Science'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-mezh-otnosheniya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Международни отношения'),
    (SELECT id FROM professional_field WHERE code = '3.3'),
    'bachelor','full_time','bg',8,240, NULL,'paid',
    'Международни отношения','International Relations'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-publichna-admin-bachelor',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Публична администрация'),
    (SELECT id FROM professional_field WHERE code = '3.7'),
    'bachelor','full_time','bg',8,240, NULL,'paid',
    'Публична администрация','Public Administration'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-biznes-admin-bachelor',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Бизнес администрация'),
    (SELECT id FROM professional_field WHERE code = '3.7'),
    'bachelor','full_time','bg',8,240, NULL,'paid',
    'Бизнес администрация','Business Administration'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-ikonomika-bachelor',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Икономика'),
    (SELECT id FROM professional_field WHERE code = '3.8'),
    'bachelor','full_time','bg',8,240, NULL,'paid',
    'Икономика','Economics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-marketing-bachelor',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Маркетинг'),
    (SELECT id FROM professional_field WHERE code = '3.8'),
    'bachelor','full_time','bg',8,240, NULL,'paid',
    'Маркетинг','Marketing'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-zhurnalistika-bachelor',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Журналистика'),
    (SELECT id FROM professional_field WHERE code = '3.5'),
    'bachelor','full_time','bg',8,240, NULL,'paid',
    'Журналистика','Journalism'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-kino-televiziya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Кино и телевизия'),
    (SELECT id FROM professional_field WHERE code = '3.5'),
    'bachelor','full_time','bg',8,240, NULL,'paid',
    'Кино и телевизия','Film and Television'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-informatsionni-tehnologii-bachelor',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Информационни технологии'),
    (SELECT id FROM professional_field WHERE code = '5.3'),
    'bachelor','full_time','bg',8,240, NULL,'paid',
    'Информационни технологии','Information Technology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-kompyutarni-nauki-bachelor',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Компютърни науки'),
    (SELECT id FROM professional_field WHERE code = '4.6'),
    'bachelor','full_time','bg',8,240, NULL,'paid',
    'Компютърни науки','Computer Science'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'nbu-istoriya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'nbu-sofia'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'История'),
    (SELECT id FROM professional_field WHERE code = '2.2'),
    'bachelor','full_time','bg',8,240, NULL,'paid',
    'История','History'
ON CONFLICT (slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════
-- 5. Югозападен университет „Неофит Рилски"  (swu-blagoevgrad)
-- ══════════════════════════════════════════════════════════════════════════
-- Coverage: ~20 of ~84 programs (key programs; full list at swu.bg)
-- Fees: not machine-readable — NULL throughout; funding='both'

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-pravo-master',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Право'),
    (SELECT id FROM professional_field WHERE code = '3.6'),
    'master','full_time','bg',10,300, NULL,'both',
    'Право','Law'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-psihologiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Психология'),
    (SELECT id FROM professional_field WHERE code = '3.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Психология','Psychology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-sotsiologiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Социология'),
    (SELECT id FROM professional_field WHERE code = '3.1'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Социология','Sociology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-filosofiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Философия'),
    (SELECT id FROM professional_field WHERE code = '2.3'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Философия','Philosophy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-istoriya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'История'),
    (SELECT id FROM professional_field WHERE code = '2.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'История','History'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-pedagogy-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Педагогика'),
    (SELECT id FROM professional_field WHERE code = '1.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Педагогика','Pedagogy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-nachalna-pedagogy-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Начална училищна педагогика'),
    (SELECT id FROM professional_field WHERE code = '1.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Начална педагогика','Primary School Education'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-preduchilishna-pedagogy-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Предучилищна педагогика'),
    (SELECT id FROM professional_field WHERE code = '1.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Предучилищна педагогика','Preschool Education'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-spetsialna-pedagogy-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Специална педагогика'),
    (SELECT id FROM professional_field WHERE code = '1.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Специална педагогика','Special Education'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-sotsialna-pedagogika-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Социална педагогика'),
    (SELECT id FROM professional_field WHERE code = '3.4'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Социална педагогика','Social Pedagogy'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-sotsialna-rabota-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Социална работа'),
    (SELECT id FROM professional_field WHERE code = '3.4'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Социална работа','Social Work'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-informatika-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Информатика'),
    (SELECT id FROM professional_field WHERE code = '4.6'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Информатика','Informatics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-matematika-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Математика'),
    (SELECT id FROM professional_field WHERE code = '4.5'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Математика','Mathematics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-biologiya-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Биология'),
    (SELECT id FROM professional_field WHERE code = '4.3'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Биология','Biology'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-ikonomika-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Икономика'),
    (SELECT id FROM professional_field WHERE code = '3.8'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Икономика','Economics'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-marketing-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Маркетинг'),
    (SELECT id FROM professional_field WHERE code = '3.8'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Маркетинг','Marketing'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-turizum-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Туризъм'),
    (SELECT id FROM professional_field WHERE code = '3.9'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Туризъм','Tourism'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-publichna-admin-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Публична администрация'),
    (SELECT id FROM professional_field WHERE code = '3.7'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Публична администрация','Public Administration'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-izobrazitelno-izkustvo-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Изобразително изкуство'),
    (SELECT id FROM professional_field WHERE code = '8.2'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Изобразително изкуство','Visual Arts'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO program_offering (
    slug, institution_id, specialty_id, professional_field_id,
    oks_level, study_form, language, duration_semesters, ects_credits,
    tuition_bgn_per_year, funding, title_bg, title_en)
SELECT 'swu-muzika-bachelor',
    (SELECT id FROM institution        WHERE slug = 'swu-blagoevgrad'),
    (SELECT id FROM specialty          WHERE canonical_name_bg = 'Музика'),
    (SELECT id FROM professional_field WHERE code = '8.3'),
    'bachelor','full_time','bg',8,240, NULL,'both',
    'Музика','Music'
ON CONFLICT (slug) DO NOTHING;

COMMIT;
