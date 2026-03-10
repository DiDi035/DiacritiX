# DiacritiX

[![CI](https://github.com/DiDi035/DiacritiX/actions/workflows/ci.yml/badge.svg)](https://github.com/DiDi035/DiacritiX/actions/workflows/ci.yml)
[![Gem Version](https://badge.fury.io/rb/diacriti_x.svg)](https://badge.fury.io/rb/diacriti_x)

A Ruby gem for Vietnamese diacritics. It solves two problems:

1. **Accent placement** — determines which letter in a Vietnamese word should receive the accent mark (e.g., in "ngoay", the accent goes on the "a")
2. **IME input** — transforms numeric-suffixed text into accented Vietnamese using the VNI input method

## Why?

Vietnamese accent placement follows [specific rules](http://just.nicepeople.free.fr/Vietnamese-Typing.htm#PlaceOfAccent) based on vowel combinations and consonant pairs. This gem encodes those rules so you don't have to.

## Installation

```bash
gem install diacriti_x
```

Or add to your Gemfile:

```ruby
gem 'diacriti_x'
```

## Usage

### As a library

```ruby
require 'diacriti_x'

# Find which letter gets the accent
result = DiacritiX::Accentifier.call('ngoay')
result.success? # => true
result.result   # => 3 (index of 'a')

# Transform VNI input into Vietnamese
vni = DiacritiX::IME::VNI.new
vni.call('Viet65 Nam')  # => "Việt Nam"
vni.call('toi1')        # => "tói"
vni.call('di9')         # => "đi"
```

### VNI key mapping

| Key | Diacritic      | Example    |
| --- | -------------- | ---------- |
| 1   | Acute (á)      | `a1` → `á` |
| 2   | Grave (à)      | `a2` → `à` |
| 3   | Hook above (ả) | `a3` → `ả` |
| 4   | Tilde (ã)      | `a4` → `ã` |
| 5   | Dot below (ạ)  | `a5` → `ạ` |
| 6   | Circumflex (â) | `a6` → `â` |
| 7   | Horn (ư, ơ)    | `u7` → `ư` |
| 8   | Breve (ă)      | `a8` → `ă` |
| 9   | Đ stroke       | `d9` → `đ` |

### CLI

```bash
# Highlight which letter receives the accent
accentify "ngoay"
# => ngo[a]y (the 'a' is highlighted in green)

# Transform VNI input into Vietnamese
ruby bin/ime/vni "Vie6t5 Nam"
# => Việt Nam
```

## Accent placement rules

The Accentifier applies rules in priority order — first match wins:

1. **Special Vietnamese vowels** — ơ, ư always take the accent
2. **Vietnamese vowels** — ă, â, ê, ô take priority over plain Latin vowels
3. **Vowel pairs** — in oa, oe, oo, uy, ươ the second vowel gets it
4. **Consonant pairs** — after gi, qu the accent goes on the next vowel
5. **Fallback** — first vowel found

## Development

```bash
git clone https://github.com/DiDi035/DiacritiX.git
cd DiacritiX
bundle install
bundle exec rake test
bundle exec rubocop
```
