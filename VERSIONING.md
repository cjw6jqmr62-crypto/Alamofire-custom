# Версионирование в Git/GitHub

## Создание версионного релиза

### 1. Создание тега (tag)

```bash
# Перейди в директорию репозитория
cd /Users/flammeimherzen/Documents/git/Alamofire-custom

# Создай тег для версии (например, 1.0.0)
git tag -a v1.0.0 -m "Release version 1.0.0"

# Или для patch версии (1.0.1)
git tag -a v1.0.1 -m "Release version 1.0.1"

# Или для minor версии (1.1.0)
git tag -a v1.1.0 -m "Release version 1.1.0"

# Или для major версии (2.0.0)
git tag -a v2.0.0 -m "Release version 2.0.0"
```

### 2. Отправка тега на GitHub

```bash
# Отправить один тег
git push origin v1.0.0

# Или отправить все теги
git push origin --tags
```

### 3. Использование версии в Xcode

В Xcode при добавлении пакета через Swift Package Manager:

**Вариант 1: По версии (рекомендуется)**
- URL: `https://github.com/cjw6jqmr62-crypto/Alamofire-custom`
- Version: `Up to Next Major Version` с `1.0.0`
- Или `Exact Version` с `1.0.0`

**Вариант 2: По тегу**
- URL: `https://github.com/cjw6jqmr62-crypto/Alamofire-custom`
- Version: `Branch` → выбери тег `v1.0.0`

### 4. Семантическое версионирование (SemVer)

Формат: `MAJOR.MINOR.PATCH`

- **MAJOR** (2.0.0) - несовместимые изменения API
- **MINOR** (1.1.0) - новая функциональность, обратно совместимая
- **PATCH** (1.0.1) - исправления багов, обратно совместимые

### 5. Полный процесс релиза

```bash
# 1. Убедись, что все изменения закоммичены
git status

# 2. Закоммить изменения (если есть)
git add .
git commit -m "Add Logic module to Alamofire"

# 3. Создать тег
git tag -a v1.0.0 -m "Release 1.0.0: Add Logic module"

# 4. Отправить коммиты и теги
git push origin master
git push origin v1.0.0

# Или одной командой
git push origin master --tags
```

### 6. Создание Release на GitHub (опционально)

1. Перейди на GitHub: `https://github.com/cjw6jqmr62-crypto/Alamofire-custom/releases`
2. Нажми "Create a new release"
3. Выбери тег `v1.0.0`
4. Заполни описание релиза
5. Нажми "Publish release"

### 7. Обновление версии в Package.swift (опционально)

Можно добавить версию в Package.swift, но это не обязательно для Swift Package Manager:

```swift
let package = Package(
    name: "Alamofire",
    platforms: [...],
    products: [...],
    // version не указывается в Package.swift
)
```

Версия определяется по тегам Git автоматически.

