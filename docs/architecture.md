# Архітектура агента build-engineer

## Призначення

Агент `build-engineer` автоматизує початкове створення TypeScript-проєкту. У межах цього завдання він створює Hello World, додає npm scripts, тест Vitest і GitHub Actions CI, а потім перевіряє, що проєкт встановлюється, збирається та проходить тести.

## Skills

| Skill | Призначення |
| --- | --- |
| `project-scaffold` | Створює `src/hello.ts`, `src/math.ts` і базовий `.gitignore`. |
| `build-and-test` | Налаштовує складання і Vitest та запускає локальні перевірки. |
| `github-actions` | Створює workflow CI для перевірки проєкту в GitHub Actions. |

## Commands

| Command | Призначення |
| --- | --- |
| `git-init` | Ініціалізує Git-репозиторій, якщо його ще немає. |
| `create-project` | Створює базовий TypeScript-проєкт і npm scripts. |
| `create-build` | Додає конфігурацію складання та тест Vitest. |
| `create-actions` | Додає workflow GitHub Actions для CI. |
| `check` | Встановлює залежності, запускає складання і тести. |
| `init` | Послідовно виконує повний сценарій ініціалізації. |

## Поведінка команди `init`

Команда `init` виконує кроки послідовно: аналізує стан репозиторію, за потреби виконує `git-init`, створює проєкт, налаштовує складання й тести, додає CI та запускає `check`.

Якщо крок завершується помилкою, агент:

1. зупиняє подальші кроки, щоб не створювати неповну або суперечливу конфігурацію;
2. зберігає текст помилки та визначає файл або команду, що спричинили проблему;
3. виправляє проблему лише в межах поточного завдання, якщо це безпечно;
4. повторює невдалу перевірку;
5. повідомляє про невирішену помилку, якщо автоматичне виправлення неможливе.

Агент не обходить помилки приховуванням результату та не використовує секрети для продовження роботи.

## Файли та їхні ролі

| Файл | Роль |
| --- | --- |
| `README.md` | Опис лабораторної роботи, дані студента, варіант і спосіб запуску. |
| `.github/agents/build-engineer.agent.md` | Інструкції, відповідальність, skills, commands і правила агента. |
| `docs/architecture.md` | Архітектура агента, опис команд, обробка помилок і карта файлів. |
| `package.json` | Метадані проєкту та npm scripts. |
| `tsconfig.json` | Правила компіляції TypeScript. |
| `src/hello.ts` | Реалізація Hello World. |
| `src/math.ts` | Функція `add` для додавання двох чисел. |
| `tests/math.test.ts` | Тест `BasicAddition` для функції `add`. |
| `ci.bat` | Windows-послідовність `npm install`, build і test. |
| `ci.sh` | Unix-послідовність `npm install`, build і test. У workflow запускається через `sh ./ci.sh`. |
| `.github/workflows/ci.yml` | CI на Ubuntu, Windows і macOS з upload artifact для `build`. |

## Компіляція і виконання

`tsconfig.json` використовує `src` як `rootDir`, `build` як `outDir`, а `module` і `moduleResolution` мають значення `Node16`. Scripts у `package.json` запускають `tsc`, `vitest run` і `node build/hello.js` відповідно.