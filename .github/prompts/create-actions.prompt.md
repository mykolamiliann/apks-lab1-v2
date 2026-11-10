---
description: "Створити GitHub Actions CI за skill github-actions для Linux, Windows і macOS."
agent: build-engineer
---

# create-actions

## Передумови

- `ci.sh` і `ci.bat` уже існують і проходять локальну перевірку.
- Проєкт створює папку `build` після складання.
- Доступний skill `github-actions`.

## Дії

1. Застосувати skill `github-actions`.
2. Створити або доповнити `.github/workflows/ci.yml`.
3. Налаштувати запуск на `push` і `pull_request`.
4. Додати matrix з `ubuntu-latest`, `windows-latest`, `macos-latest` і `fail-fast: false`.
5. Додати checkout, setup-node, запуск лише `./ci.sh` на Linux/macOS і `ci.bat` із `shell: cmd` на Windows.
6. Додати upload-artifact для папки `build`.

Повторний запуск не створює дублікати jobs або кроків і не перезаписує інші workflow без потреби.

## Які файли з'являться

- `.github/workflows/ci.yml`.

## Як перевірити

- Перевірити YAML і наявність подій `push` та `pull_request`.
- Перевірити всі три ОС і `fail-fast: false`.
- Перевірити платформний вибір: `ci.sh` для Linux/macOS, `ci.bat` з `shell: cmd` для Windows.
- Перевірити крок завантаження папки `build`.

## Що писати при помилці

Написати: `Крок create-actions не виконано: <причина>. Workflow <файл або крок> потребує виправлення. Перевірки CI не вважаються завершеними.`
