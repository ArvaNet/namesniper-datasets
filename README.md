# NameSniper open datasets

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22904856.svg)](https://doi.org/10.5281/zenodo.22904856)

First-party data on username scarcity and handle markets, published by [NameSniper](https://namesniper.pro), a name checker and handle monitor. Study pages, methods and the latest figures live at **https://namesniper.pro/research**.

Everything here is free to reuse under [CC BY 4.0](LICENSE): quote it, chart it, republish it, commercially or not. The one condition is a credit to NameSniper with a link to https://namesniper.pro/research or to the study you used.

| Dataset | What it is | Period |
|---|---|---|
| [`telegram/`](telegram) | Telegram username sales, from public TON blockchain records | 2026-07-08 to 2026-09-20 |
| [`kick/`](kick) | Kick username availability study | 2026-09-21 |
| [`roblox/`](roblox) | Roblox username scarcity study | 2026-09-21 |
| [`username-rules/`](username-rules) | Username rules and handle release policies by platform | exported 2026-09-21 |

Last updated: 2026-09-21.

## Telegram username sales

Study: https://namesniper.pro/research#telegram-username-sales

Every Telegram username sale settles on the public TON blockchain. Each record here can be checked against the chain by its transaction hash.

Headline figures for 2026-07-08 to 2026-09-20 (75 days):

- 66,466 sales, 6,576,595 TON in total
- Four-letter names: 0.8% of sales, 51% of all money spent
- Average four-letter price 6,028 TON, average five-letter price 52 TON (116x)
- 77% of names sold for under 10 TON; 28 sales reached 10,000 TON

**Read this before computing averages.** The aggregate files cover only the period in which the market was tracked continuously. Earlier records in the underlying index are large historic sales added afterwards; including them would inflate every average. The top-sales file is a ranking, so it draws on the full index.

| File | Columns |
|---|---|
| `telegram-username-sales-monthly.csv` | `month`, `sales`, `volume_ton`, `top_sale_ton`, `four_letter_sales`, `four_letter_volume_ton` |
| `telegram-username-sales-by-length.csv` | `username_length` (13+ grouped), `sales`, `volume_ton`, `avg_price_ton` |
| `telegram-username-sales-price-bands.csv` | `price_band_ton`, `sales` |
| `telegram-username-top-sales.csv` | `rank`, `username`, `price_ton`, `date` (UTC), `tx_hash` (TON transaction) |

Prices are in TON. No USD conversion is included because the rate moves daily; convert at the rate for the date you need. A small number of usernames are withheld from the top-sales file for content reasons.

## Kick username availability

Study: https://namesniper.pro/research#kick-username-availability

9,191 usernames checked one by one against the official Kick API, in 28 groups by pattern and length. 99% of common English words were taken (2,767 of 2,796).

| File | Columns |
|---|---|
| `kick-username-study-cells.csv` | `class`, `length`, `tested`, `taken`, `taken_pct` |
| `kick-username-study-taken-names.csv` | `name`, `class`, `length`, `checked_at` (UTC) |

Classes: `random-alnum` (random letters and digits), `random-letters`, `pronounceable` (alternating consonant and vowel), `dictionary` and `dictionary2` (two independent samples of common English words), `dictionary-obscure` (real words outside the common 25,000, used as a control).

Names that were free at the time of the check are deliberately not published: listing them would simply get them registered by whoever reads this first. The group file still reports how many were free.

## Roblox username scarcity

Study: https://namesniper.pro/research#roblox-username-scarcity

15,036 usernames, measured 2026-09-21. Short names were sampled across the patterns people actually try (random strings, dictionary words, all-digit names, pronounceable inventions, names with an underscore, repeated characters), followed by a sweep of random names from three to eight characters.

- Four characters: 0 of 7,036 available
- Five letters: 0 of 2,500 available
- Six letters: 60% free, this is where availability begins
- Seven letters: 90% free. Eight letters: 91% free

A name counts as `available` only if Roblox would let someone register it. `blocked` means Roblox itself rejects the name (content filter, reserved or invalid), which is a different thing from `taken`. At eight letters almost nothing is taken (2 of 1,500) but 127 names were blocked.

| File | Columns |
|---|---|
| `roblox-username-study.csv` | `name`, `class`, `length`, `status` (`taken`, `available`, `blocked`), `checked_at` (UTC) |
| `roblox-username-study-classes.csv` | `class`, `label`, `length`, `checked`, `taken`, `available`, `blocked`, `taken_pct` |

The `name` column is empty for `blocked` rows. Names a content filter rejects are mostly slurs and profanity, so they are counted but not listed. The sample is seeded, so the study can be re-run on the same names.

## Username rules and handle release policies

Study: https://namesniper.pro/research#username-rules

`username-rules.json`: per platform, the minimum and maximum username length, the allowed characters, a regular expression, case sensitivity and extra rules, with the source link and the date last verified.

`drop-policies.json`: per platform, what the platform says happens to a handle after deletion, inactivity or a rename, with sources.

Where a platform's documented rule and its real behaviour differ, the file records the behaviour and says so.

## How to cite

> NameSniper Research (2026). [Dataset title]. NameSniper open datasets. https://doi.org/10.5281/zenodo.22904856

The DOI always resolves to the latest release. Each release also has its own DOI on Zenodo.

Need a different cut of the data, or a figure checked before you publish? Write to research@namesniper.pro.
