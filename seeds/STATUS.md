# Seed status — program_offering coverage

Last updated: 2026-04-25

## Legend
- ✅ Complete (or near-complete)
- ⚠️ Partial
- ❌ Not started

---

## Медицински университет – София (`mu-sofia`) ✅ ~100%

**Seeded in:** `programs_batch1.sql`

| Faculty / Unit | Programs | Status |
|---|---|---|
| Медицински факултет | Медицина (master, 12 sem) | ✅ |
| Факултет по дентална медицина | Дентална медицина (master, 12 sem) | ✅ |
| Фармацевтичен факултет | Фармация (master, 10 sem) | ✅ |
| ФОЗ – бакалавър | Обществено здраве, Управление на зд. грижи, Кинезитерапия, Мед. сестра, Акушерка, Лекарски асистент | ✅ |
| МК „Й. Филаретова" | Мед. лаборант, Рентгенов лаборант, Зъботехник, Пом.-фармацевт, Рехабилитатор, Инспектор ОЗ, Мед. козметика, Масажист, Медико-соц. грижи, Парамедик | ✅ |
| Филиал – Враца | Мед. сестра, Акушерка, Лекарски асистент | ❌ Needs branch_id; skip until institution_branch seeded |
| Магистри след бакалавър (ФОЗ) | ~10 магистратури | ❌ Not seeded |
| Докторски програми | — | ❌ Not seeded |

**Fees seeded:** state quota 1 200 лв./г. for Медицина/Дентална/Фармация (Ректорска заповед 2025/2026).

---

## Технически университет – София (`tu-sofia`) ⚠️ ~60%

**Seeded in:** `programs_batch1.sql` — 25 of ~45 bachelor/prof-bachelor programs.

### Seeded
4.6: Информатика и софтуерни науки, Компютърно и софтуерно инженерство, Компютърни науки и инженерство (EN), Интелигентни системи и ИИ
5.3: Киберсигурност, Телекомуникации, Информационни технологии в индустрията, Електронни информационни системи
5.4: Топлоенергетика и Ядрена енергетика (0 лв., защитено), Възобновяеми енергийни технологии
5.1: Машиностроене, Мехатроника, Топлинни и хладилни технологии
5.2: Електротехника, Електроенергетика, Автоматика, Автомобилна електроника
5.5: Транспортна техника и технологии, Авиационна техника
5.13: Технология и управление на транспорта, Индустриален мениджмънт
3.7: Бизнес управление
4.5: Приложна математика и информатика
1.3: Педагогика на обучението по математика, физика и информатика

### Missing (need canonical specialty mapping)
- Анализ на данни (4.6 — maps to `informatika` but conflicts; needs new canonical slug `analiz-na-danni`)
- Дигитални индустриални технологии (5.13 — conflicts with `industrialen-menidzhmunt`)
- Дизайн и технологии за облекло и текстил (5.13)
- Проектиране и технологии за облекло и текстил (5.6)
- Инженерен дизайн (5.13)
- Инженерна логистика (5.13)
- Интелигентни системи в индустрията, града и дома (5.1 — conflicts with `mehatronika`)
- Компютърно проектиране и технологии в машиностроенето (5.1 — conflicts with `mashinno-inzhenerstvo`)
- Мениджмънт и бизнес информационни системи (5.13)
- Приложна физика и компютърно моделиране (4.1)
- French/English/German language faculty specialties (ФФОЕ, ФАИ, ФаГИОПМ)
- Технически колеж – София: 4 prof-bachelor programs (Енергетика, Електроенергетика, Приложна електронна и компютърна техника, Технология на машиностроенето) — needs college branch seeded first

**To fix:** add canonical specialty slugs for the conflicting programs (e.g. `analiz-na-danni`, `inzheneren-dizain`, `inzhenerna-logistika`) then insert the remaining rows.
**Fees seeded:** state quota per ПН from Заповед № 1797/12.06.2025.

---

## Университет за национално и световно стопанство (`unss-sofia`) ⚠️ ~30%

**Seeded in:** `programs_batch1.sql` — 16 of ~55 programs.

### Seeded
3.8: Финанси, Икономика, Счетоводство, Маркетинг, МИО, Икономика на туризма, Статистика и иконометрика
3.7: Бизнес администрация, Публична администрация, Стопанско управление
3.5: Медии и журналистика, Връзки с обществеността
3.3: Политология, Международни отношения
3.1: Социология
3.6: Право (master, 11 sem)

### Missing (~38 bachelor specialties)
Source: [priem.unwe.bg/Uploads/Priem/Specialnosti UNWE 2025.pdf](https://priem.unwe.bg/Uploads/Priem/Specialnosti%20UNWE%202025.pdf)

3.8 variants not yet seeded: Дигитална икономика, Криптоикономика, Макроикономика, Икономика и право, Бизнес информатика, Регионална икономика, Икономика на публичния сектор, Икономика на съобщенията, Икономика на строителството, Икономика на търговията, Международни финанси, Финансов контрол, + ~10 more
3.7: Регионално развитие, + others
3.5: Медия икономика, Библиотечно-информационни дейности
3.3: Европейски политики
Distance learning (РЦДО-Хасково): separate program_offering rows needed (study_form='distance', reduced fees 350 лв./г. state / 950 лв./г. paid)

**Fees seeded:** 700 лв./г. for 3.7/3.8; 900 лв./г. for 3.1/3.3/3.5/3.6.

---

## Пловдивски университет „Паисий Хилендарски" (`pu-plovdiv`) ⚠️ ~27%

**Seeded in:** `programs_batch1.sql` — 22 of ~80 bachelor programs.

### Seeded
4.6: Информатика, Софтуерно инженерство, Изкуствен интелект
4.5: Математика, Приложна математика
4.3: Биология, Екология, Микробиология
4.2: Химия
3.8: Финанси, Счетоводство, Маркетинг
3.7: Публична администрация
3.2: Психология
2.1: Българска филология, Английска филология
2.2: История
1.2: Начална педагогика, Предучилищна педагогика, Специална педагогика
3.4: Социална педагогика
3.6: Право (master, 10 sem)

### Missing (~58 programs)
Source: [uni-plovdiv.bg/pages/index/566/](https://uni-plovdiv.bg/pages/index/566/)

**Физико-технологичен факултет** (entirely missing): Инженерна физика, Технологии в медицината, Технологии в телекомуникациите, Телекомуникационно инженерство, Телекомуникации с мениджмънт, Информационно и компютърно инженерство, Екоенергийни технологии, Обучение по природни науки, Физика и математика
**Смолян филиал** (entirely missing): Компютърно индустриално инженерство, Автомобилна техника, Хардуерни и софтуерни системи, и др.
**Педагогически факултет** (partial): Педагогика, Социални дейности, НУП с чужд език, ПУП с чужд език, Музика, Педагогика на обучението по музика, Джаз и поп изп. изкуство, Графичен дизайн, Актьорство
**Филологически факултет** (partial): Руска, Френска, Славистика, Лингвистика с IT, Лингвистика с маркетинг, Приложна лингвистика, Двойни специалности (БЕ + чужд език × 11), + others
**Философско-исторически факултет** (partial): Археология, Теология, Философия, Социология, Документалистика, Европейски изследвания, и др.
**Химически факултет** (partial): Медицинска химия, Криминалистична химия, Химия с маркетинг, Химичен анализ
**ФИСН** (partial): Бизнес мениджмънт, Икономика и бизнес, МИО, Политология, Национална сигурност
**Кърджали филиал** (entirely missing): 6 специалности — needs branch seeded

**Fees seeded:** 700 лв./г. across all (approximate — exact per-program fees at [uni-plovdiv.bg/pages/index/62/](https://uni-plovdiv.bg/pages/index/62/)).

---

## Софийски университет „Св. Климент Охридски" (`su-sofia`) ⚠️ ~11%

**Seeded in:** `programs_batch1.sql` — 14 of 126 bachelor + 3 master programs.

### Seeded
7.1: Медицина (master, 12 sem)
7.3: Фармация (master, 10 sem)
3.6: Право (master, 10 sem)
4.6: Информатика, Компютърни науки
4.5: Математика
4.1: Физика
4.2: Химия
4.3: Биология
3.2: Психология
2.2: История
2.3: Философия
2.1: Българска филология
3.5: Журналистика
2.4: Теология

### Missing (~112 programs)
Source: per-faculty pages at [uni-sofia.bg/index.php/bul/obrazovanie/bakalav_rski_programi](https://www.uni-sofia.bg/index.php/bul/obrazovanie/bakalav_rski_programi) — 16 faculties × ~8 programs each

**Биологически факултет**: Молекулярна биология, Биохимия, Биотехнологии, и др.
**ГГФ**: Геология, География, Картография, Геоинформатика
**ФМИ**: Приложна математика, Статистика, + педагогически варианти (Математика и информатика, Физика и математика — ПН 1.3)
**Физически факултет**: Метеорология, Геофизика, Астрофизика
**Химически факултет**: Химия и информатика, Медицинска химия
**Медицински факултет**: Дентална медицина (to verify)
**Факултет по педагогика**: Предучилищна педагогика, Специална педагогика, Логопедия, Социална педагогика
**ФНОИ**: Педагогика на обучението по изобразително изкуство, Музика, Физическо възпитание
**Богословски факултет**: Религия, Класически езици
**Стопански факултет**: Икономика, Стопанско управление, Счетоводство
**Юридически**: only Право (already seeded as master)
**ФКНФ**: Английска, Немска, Френска, Руска, Испанска, Италианска, Новогръцка, Турска, Китайска, Японска, Корейска, Унгарска, Румънска, Арабска, Индология, Иранистика, Класическа филология
**ФСФ**: Славистика, Руска, Полска, Чешка, Сръбска, Украинска филологии
**ФЖМК**: Книгоиздаване, Библиотечно-информационни дейности, Кино и телевизия, PR
**Бургаски филиал**: 3 нови езикови специалности (2025/2026)

**Fees:** Not seeded for most СУ programs — exact per-program fees are in Заповед № РД-19-448/24.07.2025 at [uni-sofia.bg/index.php/bul/studenti/taksi_i_studentsko_kreditirane/godishni_taksi_za_uchebnata_2025_2026_g](https://www.uni-sofia.bg/index.php/bul/studenti/taksi_i_studentsko_kreditirane/godishni_taksi_za_uchebnata_2025_2026_g).

---

## How to backfill

1. **Quick wins** — add missing canonical specialty slugs in `seeds/specialties.sql` for conflicting ТУ-С programs, then append rows to `programs_batch1.sql` (or create `programs_batch2.sql`)
2. **ПУ / СУ full coverage** — fetch the faculty specialty pages listed above and extract program names; the URL structure is stable
3. **УНСС full list** — parse [priem.unwe.bg/Uploads/Priem/Specialnosti UNWE 2025.pdf](https://priem.unwe.bg/Uploads/Priem/Specialnosti%20UNWE%202025.pdf)
4. **Branches** (Враца, ТКС, Смолян, Кърджали) — seed `institution_branch` rows first, then link programs via `branch_id`
5. **Fees** — СУ full fee table is a single PDF/page; once fetched, add `tuition_bgn_per_year` via UPDATE
6. **Remaining HEIs** (ВТУ, ШУ, РУ, БДУ, ТрУ, ИУ-В, НБУ, and the other 44 institutions) — not started; NACID RVU API at [rvu.nacid.bg/specialities](https://rvu.nacid.bg/specialities) is the canonical source for a bulk scrape
