---
name: build-and-test
description: Налаштовує складання і тестування TypeScript-проєкту через npm, TypeScript і Vitest, а також створює кросплатформні CI-скрипти.
---

# Skill build-and-test

## Коли застосовувати

Застосовувати після створення вихідних TypeScript-файлів, коли проєкту потрібні npm scripts, компіляція в папку `build`, тест Vitest і локальні скрипти CI для Windows та Unix-подібних систем.

## Вхід

- коренева папка TypeScript-проєкту;
- вихідні файли в `src/`, зокрема `hello.ts` і `math.ts`;
- npm та Node.js, доступні в середовищі виконання.

## Що створює

- `package.json` зі scripts:
  - `build`: `tsc`;
  - `test`: `vitest run`;
  - `start`: `node build/hello.js`;
- `tsconfig.json` з `rootDir: "src"`, `outDir: "build"`, `module: "Node16"` і `moduleResolution: "Node16"`;
- `tests/math.test.ts` з тестом `BasicAddition`, який перевіряє `add(2, 3) = 5`;
- `ci.bat`, який послідовно запускає `npm install`, `npm run build`, `npm test` і зупиняється на першій помилці;
- `ci.sh` з тією самою послідовністю та режимом завершення при першій помилці.

## Як перевірити

1. Виконати `npm install`.
2. Виконати `npm run build` і переконатися, що TypeScript створює `build`.
3. Виконати `npm test` і перевірити проходження `BasicAddition`.
4. Виконати `npm start` та перевірити виведення Hello World.
5. Запустити `ci.bat` у Windows або `./ci.sh` у Linux/macOS.
6. Перевірити, що кожен CI-скрипт завершується одразу після команди з ненульовим кодом.

## Що робити при помилці

Зупинити послідовність команд на першій помилці та зберегти її код завершення й повідомлення. Перевірити конфігурацію TypeScript, залежності та шляхи до файлів, виправити локальну причину й повторити `build` та `test`. Не переходити до наступних кроків і не маскувати ненульовий код завершення.

## Приклад

Запит: `Налаштуй build і test для TypeScript та додай CI-скрипти.`

Очікуваний результат: `npm run build` компілює `src` у `build`, `npm test` проходить тест `BasicAddition`, а `ci.bat` і `ci.sh` виконують `npm install`, build і test у заданому порядку.
