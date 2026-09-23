# NameSniper open datasets

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22904856.svg)](https://doi.org/10.5281/zenodo.22904856)

First-party data on username scarcity and handle markets, published by [NameSniper](https://namesniper.pro), a name checker and handle monitor. Study pages, methods and the latest figures live at **https://namesniper.pro/research**.

Everything here is free to reuse under [CC BY 4.0](LICENSE): quote it, chart it, republish it, commercially or not. The one condition is a credit to NameSniper with a link to https://namesniper.pro/research or to the study you used.

| Dataset | What it is | Period |
|---|---|---|
| [`telegram/`](telegram) | Telegram username sales, from public TON blockchain records | full history 2022-10-26 to 2026-09-22 |
| [`kick/`](kick) | Kick username availability study | 2026-09-21 |
| [`roblox/`](roblox) | Roblox username scarcity: full 4-letter census + sample study | 2026-09-21 to 2026-09-23 |
| [`username-rules/`](username-rules) | Username rules and handle release policies by platform | exported 2026-09-21 |

Last updated: 2026-09-24.

## Telegram username sales

Study: https://namesniper.pro/research#telegram-username-sales

Every Telegram username sale settles on the public TON blockchain. Each record here can be checked against the chain by its transaction hash.

**Full history, 2022-10-26 to 2026-09-22.** In September 2026 we imported the complete on-chain history of every username in the collection (651,274 names):

- 748,738 sales, 123,053,795 TON in total, across 642,974 distinct names
- Record sale: @danbao, 1,583,948 TON (2026-02-07)
- By year: 2022 (launch, from 26 Oct) 21,552 sales / 47.8M TON; 2023 107,935 / 12.4M; 2024 104,167 / 10.1M; 2025 228,457 / 21.9M; 2026 to 22 Sep 286,627 / 30.9M
- Four-letter names: 46% of all money ever spent on usernames

**Recent market, 2026-07-08 to 2026-09-22 (77 days):**

- 78,201 sales, 7,618,426 TON in total
- Four-letter names: 0.8% of sales, 48% of all money spent
- Average four-letter price 6,085 TON, average five-letter price 54 TON (112x)
- 76% of names sold for under 10 TON; 41 sales reached 10,000 TON

The recent-market figures are higher than in the first release (66,541 sales to 2026-09-20): the full import surfaced 9,889 sales in that period on names our live tracker had not picked up. The shares and averages above, and the by-length and price-band files, describe the recent market; the yearly and all-time monthly files cover every recorded sale.

| File | Columns |
|---|---|
| `telegram-username-sales-yearly.csv` | `year`, `sales`, `volume_ton`, `top_sale_ton`, `four_letter_sales`, `four_letter_volume_ton` (every recorded sale since 2022-10-26) |
| `telegram-username-sales-monthly-all-time.csv` | `month`, same columns (every recorded sale since 2022-10-26) |
| `telegram-username-sales-monthly.csv` | (recent market) `month`, `sales`, `volume_ton`, `top_sale_ton`, `four_letter_sales`, `four_letter_volume_ton` |
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

**Full census, 2026-09-22/23:** every letters-only four-letter username, all 456,976 from `aaaa` to `zzzz`, was checked the same two ways. None can be registered: 456,903 are taken, 10 are reserved as previous names of renamed accounts, 63 are rejected by Roblox's filter, 0 are available. Published as counts only (`roblox-4letter-census.csv`).

**Sample study:** 15,036 usernames, measured 2026-09-21. Short names were sampled across the patterns people actually try (random strings, dictionary words, all-digit names, pronounceable inventions, names with an underscore, repeated characters), followed by a sweep of random names from three to eight characters.

- Four characters, every pattern incl. digits and underscores: 0 of 7,036 available
- Five letters: 0 of 2,500 available
- Six letters: 60% free, this is where availability begins
- Seven letters: 90% free. Eight letters: 91% free

A name counts as `available` only if Roblox would let someone register it. `blocked` means Roblox itself rejects the name (content filter, reserved or invalid), which is a different thing from `taken`. At eight letters almost nothing is taken (2 of 1,500) but 127 names were blocked.

| File | Columns |
|---|---|
| `roblox-4letter-census.csv` | `keyspace`, `total`, `checked`, `taken`, `reserved`, `blocked`, `available`, `checked_from`, `checked_to` |
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
