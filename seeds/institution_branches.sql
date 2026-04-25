-- Seed: Institution branches, colleges and outstations of Bulgarian HEIs
-- Source: Comprehensive catalog compiled 2026-04-25 from NACID, NAOA, university websites
-- 44 rows covering filials, medical/technical/pedagogical colleges, campuses, and RCDO centers
-- Branches with is_active=FALSE: planned but not yet formally open
-- Addresses: NULL unless confirmed in research; fill from each institution's contact page

BEGIN;

-- ══════════════════════════════════════════════════════════════════════════
-- Софийски университет „Св. Климент Охридски"
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'su-sofia'),
    'filial-burgas',
    'Филиал — Бургас на Софийския университет „Св. Климент Охридски"',
    'Бургас', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- УНСС — регионални центрове за дистанционно обучение
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'unss-sofia'),
    'rcdo-haskovo',
    'Регионален център за дистанционно обучение — Хасково',
    'Хасково', 'бул. „България" 168, гр. Хасково', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'unss-sofia'),
    'rcdo-plovdiv',
    'Регионален център за дистанционно обучение — Пловдив',
    'Пловдив', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Пловдивски университет „Паисий Хилендарски"
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'pu-plovdiv'),
    'filial-smolyan',
    'Филиал — Смолян на ПУ „Паисий Хилендарски"',
    'Смолян', 'ул. „Дичо Петров" № 32, 4700 Смолян', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'pu-plovdiv'),
    'filial-kardzhali',
    'Филиал „Любен Каравелов" — Кърджали на ПУ „Паисий Хилендарски"',
    'Кърджали', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Великотърновски университет „Св. св. Кирил и Методий"
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'vtu-vt'),
    'filial-vratsa',
    'Филиал — Враца на ВТУ „Св. св. Кирил и Методий"',
    'Враца', 'бул. „Мито Орозов" № 59, гр. Враца', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'vtu-vt'),
    'pedagogicheski-kolezh-pleven',
    'Педагогически колеж — Плевен на ВТУ „Св. св. Кирил и Методий"',
    'Плевен', 'ул. „Никола Д. Петков" № 18, гр. Плевен', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Югозападен университет „Неофит Рилски"
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'swu-blagoevgrad'),
    'tehnicheski-kolezh-blagoevgrad',
    'Технически колеж — Благоевград при ЮЗУ „Неофит Рилски"',
    'Благоевград', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Шуменски университет „Епископ Константин Преславски"
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'shu-shumen'),
    'kolezh-dobrich',
    'Колеж — Добрич при Шуменския университет',
    'Добрич', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Русенски университет „Ангел Кънчев"
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'ru-ruse'),
    'filial-silistra',
    'Филиал — Силистра на Русенския университет',
    'Силистра', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'ru-ruse'),
    'filial-razgrad',
    'Филиал — Разград на Русенския университет',
    'Разград', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'ru-ruse'),
    'filial-vidin',
    'Филиал — Видин на Русенския университет',
    'Видин', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Бургаски държавен университет „Проф. д-р Асен Златаров"
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'bdu-burgas'),
    'tehnicheski-kolezh-burgas',
    'Технически колеж — Бургас при БДУ „Проф. д-р Асен Златаров"',
    'Бургас', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'bdu-burgas'),
    'medicinski-kolezh-burgas',
    'Медицински колеж — Бургас при БДУ „Проф. д-р Асен Златаров"',
    'Бургас', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'bdu-burgas'),
    'kolezh-po-turizam-burgas',
    'Колеж по туризъм — Бургас при БДУ „Проф. д-р Асен Златаров"',
    'Бургас', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Тракийски университет
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'tru-starazagora'),
    'medicinski-kolezh-starazagora',
    'Медицински колеж — Стара Загора при Тракийския университет',
    'Стара Загора', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'tru-starazagora'),
    'filial-haskovo',
    'Филиал — Хасково при Тракийския университет',
    'Хасково', 'бул. „Съединение" 48, ет. 2, гр. Хасково', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'tru-starazagora'),
    'fakultet-tehnika-i-tehnologii-yambol',
    'Факултет „Техника и технологии" — Ямбол при Тракийския университет',
    'Ямбол', 'ул. „Граф Игнатиев" 38, гр. Ямбол', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Икономически университет — Варна
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'ue-varna'),
    'kolezh-po-turizam-varna',
    'Колеж по туризъм — Варна при Икономическия университет — Варна',
    'Варна', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Стопанска академия „Д. А. Ценов"
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'sa-svishtov'),
    'kolezh-po-ikonomika-i-upravlenie-svishtov',
    'Колеж по икономика и управление — Свищов при СА „Д. А. Ценов"',
    'Свищов', 'ул. „Емануил Чакъров" № 2, гр. Свищов', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Технически университет — София
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'tu-sofia'),
    'filial-plovdiv',
    'Филиал — Пловдив на Технически университет — София',
    'Пловдив', 'ул. „Цанко Дюстабанов" № 25, гр. Пловдив', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'tu-sofia'),
    'fakultet-i-kolezh-sliven',
    'Инженерно-педагогически факултет и Колеж — Сливен на ТУ — София',
    'Сливен', 'бул. „Бургаско шосе" № 59, гр. Сливен', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ТКС обхваща бази в Ботевград (Приложна електроника), Козлодуй (Енергетика), Казанлък (Машиностроене)
-- Сийдван като един ред с city=Sofia; при необходимост да се разбие на 3 отделни branch реда
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'tu-sofia'),
    'tehnicheski-kolezh-sofia',
    'Технически колеж — София при Технически университет — София',
    'София', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Технически университет — Варна
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'tu-varna'),
    'dobrudzhanski-tehnologichen-kolezh-dobrich',
    'Добруджански технологичен колеж — Добрич при ТУ — Варна',
    'Добрич', 'ж.к. „Добротица" бл. 12, ет. 4, гр. Добрич', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- Планиран филиал в Добрич (решение юли 2025); не е открит официално към 04.2026 г.
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'tu-varna'),
    'filial-dobrich',
    'Филиал — Добрич на Технически университет — Варна (планиран)',
    'Добрич', NULL, FALSE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Технически университет — Габрово
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'tu-gabrovo'),
    'tehnicheski-kolezh-lovech',
    'Технически колеж — Ловеч при Технически университет — Габрово',
    'Ловеч', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Медицински университет — София
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'mu-sofia'),
    'filial-vratsa',
    'Филиал „Проф. д-р Иван Митев" — Враца при МУ — София',
    'Враца', 'бул. „Втори юни" № 179, ет. 2, гр. Враца', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'mu-sofia'),
    'medicinski-kolezh-yordanka-filaretova-sofia',
    'Медицински колеж „Йорданка Филаретова" — София при МУ — София',
    'София', 'ул. „Йорданка Филаретова" № 3, София', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Медицински университет — Пловдив
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'mu-plovdiv'),
    'medicinski-kolezh-plovdiv',
    'Медицински колеж — Пловдив при МУ — Пловдив',
    'Пловдив', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Медицински университет — Варна
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'mu-varna'),
    'filial-sliven',
    'Филиал — Сливен при МУ — Варна',
    'Сливен', 'ул. „Генерал Столетов" № 30, гр. Сливен', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'mu-varna'),
    'filial-shumen',
    'Филиал — Шумен при МУ — Варна',
    'Шумен', 'ул. „Васил Априлов" № 63, гр. Шумен', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'mu-varna'),
    'filial-veliko-tarnovo',
    'Филиал — Велико Търново при МУ — Варна',
    'Велико Търново', 'ул. „Михаил Кефалов" № 2, гр. Велико Търново', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'mu-varna'),
    'medicinski-kolezh-varna',
    'Медицински колеж — Варна при МУ — Варна',
    'Варна', 'бул. „Цар Освободител" № 84, Варна', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Медицински университет — Плевен
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'mu-pleven'),
    'medicinski-kolezh-pleven',
    'Медицински колеж — Плевен при МУ — Плевен',
    'Плевен', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Национална художествена академия
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'nha-sofia'),
    'filial-burgas',
    'Филиал — Бургас на Националната художествена академия',
    'Бургас', 'Магазия 1, ет. 2, Пристанищен комплекс, гр. Бургас', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- НАТФИЗ „Кръстьо Сарафов" — планиран филиал (уч. 2026/2027)
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'natfiz-sofia'),
    'filial-burgas',
    'Филиал — Бургас на НАТФИЗ „Кръстьо Сарафов" (планиран)',
    'Бургас', NULL, FALSE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Варненски свободен университет „Черноризец Храбър"
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'vfu-varna'),
    'filial-smolyan',
    'Филиал — Смолян на Варненския свободен университет',
    'Смолян', 'ул. „Перелик" № 2, гр. Смолян', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Международно висше бизнес училище (МВБУ)
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'ibs-botevgrad'),
    'ucheben-tsentar-sofia',
    'Учебен център — София на Международното висше бизнес училище',
    'София', 'ул. „Винсент ван Гог" 7, София', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- ВУАРР — Висше училище по агробизнес и развитие на регионите
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'uard-plovdiv'),
    'filial-veliko-tarnovo',
    'Филиал — Велико Търново на ВУАРР',
    'Велико Търново', 'ул. „Никола Габровски" № 90, гр. Велико Търново', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'uard-plovdiv'),
    'filial-ruse',
    'Филиал — Русе на ВУАРР',
    'Русе', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Висше училище по мениджмънт (ВУМ)
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'vum-varna'),
    'kampus-dobrich',
    'Кампус — Добрич на Висшето училище по мениджмънт',
    'Добрич', 'ул. „България" № 3, 9300 Добрич', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'vum-varna'),
    'ucheben-tsentar-sofia',
    'Учебен център — София на Висшето училище по мениджмънт',
    'София', 'бул. „Цариградско шосе" 149 Б, 1784 София', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Национален военен университет „Васил Левски"
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'nvu-vt'),
    'fakultet-artileriya-pvo-i-kis-shumen',
    'Факултет „Артилерия, ПВО и КИС" — Шумен на НВУ „Васил Левски"',
    'Шумен', 'ул. „Карел Шкорпил" 1, 9700 Шумен', TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

-- ══════════════════════════════════════════════════════════════════════════
-- Висше военноморско училище „Никола Й. Вапцаров"
-- ══════════════════════════════════════════════════════════════════════════
INSERT INTO institution_branch (institution_id, slug, name_bg, city, address, is_active)
SELECT (SELECT id FROM institution WHERE slug = 'vvmu-varna'),
    'profesionalen-starshinski-kolezh-varna',
    'Професионален старшински колеж при ВВМУ „Н. Й. Вапцаров"',
    'Варна', NULL, TRUE
ON CONFLICT (institution_id, slug) DO NOTHING;

COMMIT;
