---
description: "Налаштувати складання, Vitest і кросплатформні CI-скрипти за skill build-and-test."
agent: build-engineer
---

# create-build

## Передумови

- `src/hello.ts` і `src/math.ts` створені та доступні для компіляції.
- Доступний skill `build-and-test`.
- У робочій папці можна створювати npm-конфігурацію і тести.

## Дії

1. Застосувати skill `build-and-test`.
2. Створити або доповнити `package.json` scripts: `build: tsc`, `test: vitest run`, `start: node build/hello.js`.
3. Створити або перевірити `tsconfig.json` з `rootDir: src`, `outDir: build`, `module: Node16` і `moduleResolution: Node16`.
4. Створити `tests/math.test.ts` з тестом `BasicAddition`, що перевіряє `add(2, 3) = 5`.
5. Створити `ci.bat` і `ci.sh` з послідовністю `npm install`, `npm run build`, `npm test` та зупинкою на першій помилці.

Повторний запуск оновлює лише відсутні або некоректні частини, не дублює scripts і тести та не стирає користувацькі налаштування без потреби.

## Які файли з'являться

- `package.json`;
- `tsconfig.json`;
- `tests/math.test.ts`;
- `ci.bat`;
- `ci.sh`.

## Як перевірити

- Перевірити три npm scripts і параметри TypeScript.
- Запустити `npm run build`.
- Запустити `npm test` і перевірити `BasicAddition`.
- Перевірити порядок і stop-on-first-error у `ci.bat` та `ci.sh`.

## Що писати при помилці

Написати: `Крок create-build не виконано: <причина>. Проблемний файл або команда: <значення>. Складання і тести не вважаються налаштованими.`
