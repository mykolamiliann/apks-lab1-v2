# Лабораторна робота №1

## Дані студента

| Поле | Значення |
| --- | --- |
| ПІБ | Мілян Микола Олегович |
| Група | КІ-406 |
| Варіант | 12 (у таблиці 6) |

## Завдання

Агент `build-engineer` створює застосунок **Hello World** на TypeScript, додає npm scripts, тест на базі Vitest і CI для автоматичної перевірки проєкту.

## Технологічний варіант

- Мова: TypeScript
- Пакетний менеджер і команди: npm scripts
- Тестовий фреймворк: Vitest

## Структура проєкту

- `src/hello.ts` — виводить `Hello World`.
- `src/math.ts` — експортує функцію `add`.
- `tests/math.test.ts` — перевіряє `add(2, 3) = 5`.
- `package.json` — містить scripts `build`, `test` і `start`.
- `tsconfig.json` — компілює `src/` у `build/` через Node16.
- `ci.bat` і `ci.sh` — локальні послідовності install, build і test.
- `.github/workflows/ci.yml` — запускає CI на Ubuntu, Windows і macOS та завантажує `build`.

## npm-команди

```text
npm run build  # компіляція TypeScript
npm test       # запуск Vitest
npm start      # запуск build/hello.js
```

## Запуск

1. Відкрити **Copilot Chat**.
2. Обрати рушій **Local**.
3. Обрати агента **build-engineer**.
4. Виконати команду `/init`.

Деталі відповідальності агента, його skills, commands та структури файлів наведено в [docs/architecture.md](docs/architecture.md).
Інструкції для локального запуску наведено в [docs/usage.md](docs/usage.md).