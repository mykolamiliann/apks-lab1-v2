---
description: "Перевірити агента, skills, commands, TypeScript-проєкт, CI, build, тести та правила .gitignore без ручних змін."
agent: build-engineer
---

# check

## Передумови

- Репозиторій доступний для читання.
- Агент, skills і prompts уже створені.
- Для запуску перевірок доступні Node.js та npm.

## Дії

1. Нічого не редагувати вручну.
2. Перевірити наявність `.github/agents/build-engineer.agent.md`.
3. Перевірити наявність саме трьох skills: `project-scaffold`, `build-and-test`, `github-actions`.
4. Перевірити наявність саме шести commands: `git-init`, `create-project`, `create-build`, `create-actions`, `check`, `init`.
5. Перевірити файли проєкту: `src/hello.ts`, `src/math.ts`, `package.json`, `tsconfig.json`, `tests/math.test.ts`, `ci.bat`, `ci.sh`, `.github/workflows/ci.yml`.
6. Запустити `ci.bat` на Windows або `ci.sh` на Linux/macOS; зафіксувати результат build і тестів.
7. Перевірити, що `ci.yml` містить три ОС: `ubuntu-latest`, `windows-latest`, `macos-latest`.
8. Перевірити без урахування регістру, що `.gitignore` містить `build/` і `node_modules/`.
9. Вивести таблицю з перевірками та статусом `OK` або `FAIL`.

Команда не змінює вихідний код чи конфігурацію. Згенеровані під час обов'язкового CI `node_modules/` і `build/` вважаються результатами перевірки, а не ручним редагуванням. Повторний запуск не дублює і не перезаписує нічого.

## Які файли з'являться

- Нові файли не створюються навмисно.
- `npm install` і build можуть створити або оновити ігноровані `node_modules/` та `build/` як технічні результати перевірки.

## Як перевірити

Вивести таблицю щонайменше з такими рядками:

| Перевірка | Результат |
| --- | --- |
| Агент | OK/FAIL |
| 3 skills | OK/FAIL |
| 6 commands | OK/FAIL |
| Файли проєкту | OK/FAIL |
| Build | OK/FAIL |
| Тести | OK/FAIL |
| 3 ОС у ci.yml | OK/FAIL |
| build/ і node_modules/ у .gitignore | OK/FAIL |

Завершити команду успішно лише якщо всі рядки мають `OK`.

## Що писати при помилці

Написати: `Перевірка завершилася зі статусом FAIL.` Далі вказати кожен невдалий рядок таблиці, конкретний відсутній файл або команду, текст помилки CI та рекомендацію для виправлення. Не приховувати невдалий build чи тест.
