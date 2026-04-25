-- Seed: Bulgarian canonical specialty taxonomy
-- 144 specialties across all 52 professional fields

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'teoriya-i-upravlenie-na-obrazovanieto', 'Теория и управление на образованието', 'Theory and Management of Education',
       id FROM professional_field WHERE code = '1.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedagogy', 'Педагогика', 'Pedagogy',
       id FROM professional_field WHERE code = '1.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'preduchilishna-pedagogy', 'Предучилищна педагогика', 'Preschool Education',
       id FROM professional_field WHERE code = '1.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'nachalna-uchilishna-pedagogy', 'Начална училищна педагогика', 'Primary School Education',
       id FROM professional_field WHERE code = '1.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'spetsialna-pedagogy', 'Специална педагогика', 'Special Education',
       id FROM professional_field WHERE code = '1.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'logopediya', 'Логопедия', 'Speech Therapy',
       id FROM professional_field WHERE code = '1.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-matematika', 'Педагогика на обучението по математика', 'Mathematics Education',
       id FROM professional_field WHERE code = '1.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-fizika', 'Педагогика на обучението по физика', 'Physics Education',
       id FROM professional_field WHERE code = '1.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-himiya', 'Педагогика на обучението по химия', 'Chemistry Education',
       id FROM professional_field WHERE code = '1.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-biologiya', 'Педагогика на обучението по биология', 'Biology Education',
       id FROM professional_field WHERE code = '1.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-istoriya', 'Педагогика на обучението по история', 'History Education',
       id FROM professional_field WHERE code = '1.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-geografiya', 'Педагогика на обучението по география', 'Geography Education',
       id FROM professional_field WHERE code = '1.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-informatika', 'Педагогика на обучението по информатика', 'Computer Science Education',
       id FROM professional_field WHERE code = '1.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-fizichesko-vazpitanie', 'Педагогика на обучението по физическо възпитание', 'Physical Education',
       id FROM professional_field WHERE code = '1.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-muzika', 'Педагогика на обучението по музика', 'Music Education',
       id FROM professional_field WHERE code = '1.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pedob-izobrazitelno-izkustvo', 'Педагогика на обучението по изобразително изкуство', 'Art Education',
       id FROM professional_field WHERE code = '1.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'balgarska-filologiya', 'Българска филология', 'Bulgarian Philology',
       id FROM professional_field WHERE code = '2.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'angliiska-filologiya', 'Английска филология', 'English Philology',
       id FROM professional_field WHERE code = '2.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'germanska-filologiya', 'Германска филология', 'German Philology',
       id FROM professional_field WHERE code = '2.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'romanska-filologiya', 'Романска филология', 'Romance Philology',
       id FROM professional_field WHERE code = '2.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'ruska-filologiya', 'Руска филология', 'Russian Philology',
       id FROM professional_field WHERE code = '2.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'klasicheska-filologiya', 'Класическа филология', 'Classical Philology',
       id FROM professional_field WHERE code = '2.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'turska-filologiya', 'Турска филология', 'Turkish Philology',
       id FROM professional_field WHERE code = '2.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'prilozhna-lingvistika', 'Приложна лингвистика', 'Applied Linguistics',
       id FROM professional_field WHERE code = '2.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'istoriya', 'История', 'History',
       id FROM professional_field WHERE code = '2.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'arheologiya', 'Археология', 'Archaeology',
       id FROM professional_field WHERE code = '2.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'etnologiya', 'Eтнология', 'Ethnology',
       id FROM professional_field WHERE code = '2.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'filosofiya', 'Философия', 'Philosophy',
       id FROM professional_field WHERE code = '2.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'logika', 'Логика', 'Logic',
       id FROM professional_field WHERE code = '2.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'etika', 'Eтика', 'Ethics',
       id FROM professional_field WHERE code = '2.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'teologiya', 'Теология', 'Theology',
       id FROM professional_field WHERE code = '2.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'sotsiologiya', 'Социология', 'Sociology',
       id FROM professional_field WHERE code = '3.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'antropologiya', 'Антропология', 'Anthropology',
       id FROM professional_field WHERE code = '3.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'kulturologiya', 'Културология', 'Cultural Studies',
       id FROM professional_field WHERE code = '3.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'psihologiya', 'Психология', 'Psychology',
       id FROM professional_field WHERE code = '3.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'politologiya', 'Политология', 'Political Science',
       id FROM professional_field WHERE code = '3.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'mezhdunarodni-otnosheniya', 'Международни отношения', 'International Relations',
       id FROM professional_field WHERE code = '3.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'evropeistika', 'Европеистика', 'European Studies',
       id FROM professional_field WHERE code = '3.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'sotsialna-pedagogika', 'Социална педагогика', 'Social Pedagogy',
       id FROM professional_field WHERE code = '3.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'sotsialna-rabota', 'Социална работа', 'Social Work',
       id FROM professional_field WHERE code = '3.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'zhurnalistika', 'Журналистика', 'Journalism',
       id FROM professional_field WHERE code = '3.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'vrazki-s-obshtestvenostta', 'Връзки с обществеността', 'Public Relations',
       id FROM professional_field WHERE code = '3.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'bibliotekoznanie', 'Библиотечно-информационни дейности', 'Library and Information Science',
       id FROM professional_field WHERE code = '3.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'kino-televiziya', 'Кино и телевизия', 'Film and Television',
       id FROM professional_field WHERE code = '3.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'pravo', 'Право', 'Law',
       id FROM professional_field WHERE code = '3.6'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'publichna-administratsiya', 'Публична администрация', 'Public Administration',
       id FROM professional_field WHERE code = '3.7'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'biznes-administratsiya', 'Бизнес администрация', 'Business Administration',
       id FROM professional_field WHERE code = '3.7'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'stopansko-upravlenie', 'Стопанско управление', 'Business Management',
       id FROM professional_field WHERE code = '3.7'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'ikonomika', 'Икономика', 'Economics',
       id FROM professional_field WHERE code = '3.8'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'finansi', 'Финанси', 'Finance',
       id FROM professional_field WHERE code = '3.8'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'schetovodstvo-i-kontrol', 'Счетоводство и контрол', 'Accounting and Control',
       id FROM professional_field WHERE code = '3.8'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'marketing', 'Маркетинг', 'Marketing',
       id FROM professional_field WHERE code = '3.8'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'mezhdunarodni-ikonomicheski-otnosheniya', 'Международни икономически отношения', 'International Economic Relations',
       id FROM professional_field WHERE code = '3.8'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'zastrahovane-i-sotsialno-delo', 'Застраховане и социално дело', 'Insurance and Social Work',
       id FROM professional_field WHERE code = '3.8'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'statistika-i-ikonomometrika', 'Статистика и иконометрика', 'Statistics and Econometrics',
       id FROM professional_field WHERE code = '3.8'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'ikonomika-na-turizma', 'Икономика на туризма', 'Tourism Economics',
       id FROM professional_field WHERE code = '3.8'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'turizum', 'Туризъм', 'Tourism',
       id FROM professional_field WHERE code = '3.9'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'hotel-menidzhmunt', 'Хотелиерство и ресторантьорство', 'Hospitality Management',
       id FROM professional_field WHERE code = '3.9'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'fizika', 'Физика', 'Physics',
       id FROM professional_field WHERE code = '4.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'astronomiya', 'Астрономия', 'Astronomy',
       id FROM professional_field WHERE code = '4.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'meteorologiya', 'Метеорология', 'Meteorology',
       id FROM professional_field WHERE code = '4.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'geofizika', 'Геофизика', 'Geophysics',
       id FROM professional_field WHERE code = '4.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'himiya', 'Химия', 'Chemistry',
       id FROM professional_field WHERE code = '4.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'biologiya', 'Биология', 'Biology',
       id FROM professional_field WHERE code = '4.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'ekologiya-i-opm', 'Екология и опазване на околната среда', 'Ecology and Environmental Protection',
       id FROM professional_field WHERE code = '4.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'biohimiya', 'Биохимия', 'Biochemistry',
       id FROM professional_field WHERE code = '4.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'mikrobiologiya', 'Микробиология', 'Microbiology',
       id FROM professional_field WHERE code = '4.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'geologiya', 'Геология', 'Geology',
       id FROM professional_field WHERE code = '4.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'geografiya', 'География', 'Geography',
       id FROM professional_field WHERE code = '4.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'kartografiya-i-geoinformatika', 'Картография и геоинформатика', 'Cartography and Geoinformatics',
       id FROM professional_field WHERE code = '4.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'matematika', 'Математика', 'Mathematics',
       id FROM professional_field WHERE code = '4.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'prilozhna-matematika', 'Приложна математика', 'Applied Mathematics',
       id FROM professional_field WHERE code = '4.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'statistika', 'Статистика', 'Statistics',
       id FROM professional_field WHERE code = '4.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'informatika', 'Информатика', 'Informatics',
       id FROM professional_field WHERE code = '4.6'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'kompyutarni-nauki', 'Компютърни науки', 'Computer Science',
       id FROM professional_field WHERE code = '4.6'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'izkustven-intelekt', 'Изкуствен интелект', 'Artificial Intelligence',
       id FROM professional_field WHERE code = '4.6'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'mashinno-inzhenerstvo', 'Машинно инженерство', 'Mechanical Engineering',
       id FROM professional_field WHERE code = '5.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'avtomobilna-tehnika', 'Автомобилна техника', 'Automotive Engineering',
       id FROM professional_field WHERE code = '5.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'toploenenergetika', 'Топлоенергетика', 'Thermal Engineering',
       id FROM professional_field WHERE code = '5.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'mehatronika', 'Мехатроника', 'Mechatronics',
       id FROM professional_field WHERE code = '5.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'elektrotehnika', 'Електротехника', 'Electrical Engineering',
       id FROM professional_field WHERE code = '5.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'elektronika', 'Електроника', 'Electronics',
       id FROM professional_field WHERE code = '5.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'avtomatika', 'Автоматика, информационна и управляваща техника', 'Automation, Information and Control Engineering',
       id FROM professional_field WHERE code = '5.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'sistemi-za-sigurnost', 'Системи за сигурност', 'Security Systems',
       id FROM professional_field WHERE code = '5.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'elektroenergetics', 'Електроенергетика', 'Electric Power Engineering',
       id FROM professional_field WHERE code = '5.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'komunikatsionna-tehnika', 'Комуникационна техника', 'Communication Technology',
       id FROM professional_field WHERE code = '5.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'kompyutarna-tehnika', 'Компютърна техника', 'Computer Engineering',
       id FROM professional_field WHERE code = '5.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'telekomunikatsii', 'Телекомуникации', 'Telecommunications',
       id FROM professional_field WHERE code = '5.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'informatsionni-tehnologii', 'Информационни технологии', 'Information Technology',
       id FROM professional_field WHERE code = '5.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'kibersigurnost', 'Киберсигурност', 'Cybersecurity',
       id FROM professional_field WHERE code = '5.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'energetika', 'Енергетика', 'Energy Engineering',
       id FROM professional_field WHERE code = '5.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'yadrena-energetika', 'Ядрена енергетика', 'Nuclear Energy Engineering',
       id FROM professional_field WHERE code = '5.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'transport', 'Транспорт', 'Transport',
       id FROM professional_field WHERE code = '5.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'morsko-delo', 'Морско дело', 'Navigation',
       id FROM professional_field WHERE code = '5.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'aviotehnika', 'Авиотехника', 'Aeronautical Engineering',
       id FROM professional_field WHERE code = '5.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'materialoznanie', 'Материалознание', 'Materials Science',
       id FROM professional_field WHERE code = '5.6'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'arhitektura', 'Архитектура', 'Architecture',
       id FROM professional_field WHERE code = '5.7'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'stroitelno-inzhenerstvo', 'Строително инженерство', 'Civil Engineering',
       id FROM professional_field WHERE code = '5.7'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'geodeziya', 'Геодезия', 'Geodesy',
       id FROM professional_field WHERE code = '5.7'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'usp', 'Устройство и управление на поземлената собственост', 'Land Management and Real Estate',
       id FROM professional_field WHERE code = '5.7'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'minno-delo', 'Минно дело', 'Mining Engineering',
       id FROM professional_field WHERE code = '5.8'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'markshaidstvo', 'Маркшайдерство и геодезия в минното дело', 'Mine Surveying',
       id FROM professional_field WHERE code = '5.8'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'metalurgiya', 'Металургия', 'Metallurgy',
       id FROM professional_field WHERE code = '5.9'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'himichno-inzhenerstvo', 'Химично инженерство', 'Chemical Engineering',
       id FROM professional_field WHERE code = '5.10'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'himichni-tehnologii', 'Химични технологии', 'Chemical Technologies',
       id FROM professional_field WHERE code = '5.10'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'biotehnologii', 'Биотехнологии', 'Biotechnology',
       id FROM professional_field WHERE code = '5.11'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'farmatsevtichni-biotehnologii', 'Фармацевтични биотехнологии', 'Pharmaceutical Biotechnology',
       id FROM professional_field WHERE code = '5.11'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'hranitelni-tehnologii', 'Хранителни технологии', 'Food Technology',
       id FROM professional_field WHERE code = '5.12'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'hranitelna-himiya', 'Хранителна химия', 'Food Chemistry',
       id FROM professional_field WHERE code = '5.12'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'industrialen-menidzhmunt', 'Индустриален мениджмънт', 'Industrial Management',
       id FROM professional_field WHERE code = '5.13'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'inzhenerstvo-i-menidzhment', 'Инженерство и мениджмънт', 'Engineering and Management',
       id FROM professional_field WHERE code = '5.13'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'agronomstvo', 'Агрономство', 'Agronomy',
       id FROM professional_field WHERE code = '6.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'gradinarstvo', 'Градинарство', 'Horticulture',
       id FROM professional_field WHERE code = '6.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'rastitelna-zashtita', 'Растителна защита', 'Plant Protection',
       id FROM professional_field WHERE code = '6.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'zootehnika', 'Зоотехника', 'Animal Husbandry',
       id FROM professional_field WHERE code = '6.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'veterinarna-meditsina', 'Ветеринарна медицина', 'Veterinary Medicine',
       id FROM professional_field WHERE code = '6.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'meditsina', 'Медицина', 'Medicine',
       id FROM professional_field WHERE code = '7.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'dentalna-meditsina', 'Дентална медицина', 'Dental Medicine',
       id FROM professional_field WHERE code = '7.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'farmatsiya', 'Фармация', 'Pharmacy',
       id FROM professional_field WHERE code = '7.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'obshtestveno-zdrave', 'Обществено здраве', 'Public Health',
       id FROM professional_field WHERE code = '7.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'zdraven-menidzhmunt', 'Здравен мениджмънт', 'Health Management',
       id FROM professional_field WHERE code = '7.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'meditsinskа-sestra', 'Медицинска сестра', 'Nursing',
       id FROM professional_field WHERE code = '7.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'akusherka', 'Акушерка', 'Midwifery',
       id FROM professional_field WHERE code = '7.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'rehabilitator', 'Рехабилитация', 'Rehabilitation',
       id FROM professional_field WHERE code = '7.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'inspektor-po-obshtestveno-zdrave', 'Инспектор по обществено здраве', 'Public Health Inspector',
       id FROM professional_field WHERE code = '7.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'meditsinskа-laboratoriya', 'Медицинска лаборатория', 'Medical Laboratory',
       id FROM professional_field WHERE code = '7.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'optometriya', 'Оптометрия', 'Optometry',
       id FROM professional_field WHERE code = '7.5'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'izobrazitelno-izkustvo', 'Изобразително изкуство', 'Visual Arts',
       id FROM professional_field WHERE code = '8.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'grafika', 'Графика', 'Graphic Arts',
       id FROM professional_field WHERE code = '8.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'skulptura', 'Скулптура', 'Sculpture',
       id FROM professional_field WHERE code = '8.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'fotografiya', 'Фотография', 'Photography',
       id FROM professional_field WHERE code = '8.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'muzika', 'Музика', 'Music',
       id FROM professional_field WHERE code = '8.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'horeografiya', 'Хореография', 'Choreography',
       id FROM professional_field WHERE code = '8.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'tsirkovo-izkustvo', 'Цирково изкуство', 'Circus Arts',
       id FROM professional_field WHERE code = '8.2'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'dizain', 'Дизайн', 'Design',
       id FROM professional_field WHERE code = '8.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'mode-dizain', 'Мода', 'Fashion Design',
       id FROM professional_field WHERE code = '8.3'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'aktуorsko-maistarstvo', 'Актьорско майсторство', 'Acting',
       id FROM professional_field WHERE code = '8.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'rezhisura', 'Режисура', 'Directing',
       id FROM professional_field WHERE code = '8.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'teatarzname-i-teatralna-produktsiya', 'Театрознание и театрална продукция', 'Theatre Studies and Production',
       id FROM professional_field WHERE code = '8.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'kinorezhisura', 'Кинорежисура', 'Film Directing',
       id FROM professional_field WHERE code = '8.4'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'natsionalna-sigurnost', 'Национална сигурност', 'National Security',
       id FROM professional_field WHERE code = '9.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'razuznavane-i-sigurnost', 'Разузнаване и сигурност', 'Intelligence and Security',
       id FROM professional_field WHERE code = '9.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'politsiya', 'Полиция', 'Police',
       id FROM professional_field WHERE code = '9.1'
ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'organizatsiya-i-upravlenie-na-voenni-formirovaniya', 'Организация и управление на военни формирования на тактическо ниво', 'Organisation and Management of Military Units at Tactical Level',
       id FROM professional_field WHERE code = '9.2'
ON CONFLICT (slug) DO NOTHING;

SELECT count(*) AS specialties_total FROM specialty;

-- Corrections: fix arts PF code mismatches (applied 2026-04-25)
-- 8.2 = Изобразително изкуство (fine arts + design)
UPDATE specialty SET professional_field_id = (SELECT id FROM professional_field WHERE code = '8.2')
  WHERE slug IN ('izobrazitelno-izkustvo','grafika','skulptura','fotografiya','dizain','mode-dizain');
-- 8.3 = Музикално и танцово изкуство
UPDATE specialty SET professional_field_id = (SELECT id FROM professional_field WHERE code = '8.3')
  WHERE slug IN ('muzika','horeografiya','tsirkovo-izkustvo');

INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'teoriya-na-izkustvata','Теория на изкуствата','Theory of Arts', id FROM professional_field WHERE code='8.1' ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'izkustvoznanie','Изкуствознание','Art Studies', id FROM professional_field WHERE code='8.1' ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'gorsko-stopanstvo','Горско стопанство','Forestry', id FROM professional_field WHERE code='6.5' ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'fizichesko-vazpitanie-i-sport','Физическо възпитание и спорт','Physical Education and Sport', id FROM professional_field WHERE code='7.6' ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'trenioryorstvo','Треньорство','Coaching', id FROM professional_field WHERE code='7.6' ON CONFLICT (slug) DO NOTHING;
INSERT INTO specialty (slug, canonical_name_bg, canonical_name_en, professional_field_id)
SELECT 'arhitektura-8-5','Архитектура','Architecture', id FROM professional_field WHERE code='8.5' ON CONFLICT (slug) DO NOTHING;
