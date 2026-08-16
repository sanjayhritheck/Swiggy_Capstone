# Swiggy Cuisine Performance Diagnostic

## Project Overview

This project builds a deterministic Swiggy-style cuisine performance diagnostic using SQLite, spreadsheet analysis, and Tableau Public. The project uses one fixed dataset generated with `random.seed(42)`, then carries the resulting `monthly_cuisine_revenue.csv` unchanged through SQL, spreadsheet reconciliation, and Tableau analysis. The final dashboard evaluates cuisine revenue against monthly targets and identifies cuisines that are above or below target.

## Repository Structure

```text
swiggy-capstone/
│
├── generate_data.py
├── swiggy_capstone.db
├── verify.sql
├── 01_foundations.sql
├── 02_aggregation_joins.sql
├── 03_reporting.sql
├── monthly_cuisine_revenue.csv
├── Swiggy_Cuisine_Analysis.xlsx
├── DATA_STORY.md
├── ai_log.md
└── README.md
```

## Part A — SQL Diagnostic

### Database Generation

The database is generated using `generate_data.py`.

To regenerate the deterministic database:

```bash
python3 generate_data.py
```

The script uses the required `random.seed(42)` and creates:

* 15 restaurants
* 50 customers
* 420 orders
* 6 cuisine targets

The resulting database is stored in `swiggy_capstone.db`.

### Verification

`verify.sql` contains the required table-count and order-status verification queries.

### SQL Foundations

`01_foundations.sql` contains queries demonstrating:

* `SELECT` and `WHERE`
* `DISTINCT`
* `ORDER BY` and `LIMIT`
* `LIKE` with `%`
* `IN`
* `BETWEEN`
* `NOT BETWEEN`
* `IS NULL`

### Aggregation and Joins

`02_aggregation_joins.sql` contains:

* `INNER JOIN` cuisine-level aggregation
* `GROUP BY`
* `COUNT`
* `SUM`
* `AVG`
* `HAVING`
* `LEFT JOIN` restaurant order counts

### Reporting

`03_reporting.sql` contains:

* Restaurant revenue tiering using `CASE WHEN`
* Monthly revenue by cuisine using SQLite `strftime()`
* Cuisine target variance
* Percentage variance
* Above/Below Target classification

### Fixed CSV Output

`monthly_cuisine_revenue.csv` is the direct export of the Part A monthly-by-cuisine SQL report. This same CSV is used as the fixed input for Parts B and C.

## Part B — Spreadsheet Cross-Check

The spreadsheet workbook is:

**`Swiggy_Cuisine_Analysis.xlsx`**

It contains:

* `Monthly Data`
* `Cuisine Targets`
* Pivot Table
* `Cuisine Summary`

The Pivot Table reproduces cuisine-level revenue totals from the Part A CSV, and the Cuisine Summary uses `VLOOKUP`, variance formulas, percentage variance formulas, and nested `IF` classification.

All six cuisine totals reconcile with the Part A SQL results to the rupee.

## Part C — Tableau Public Dashboard

### Live Dashboard

[Swiggy Cuisine Performance Diagnostic — Tableau Public](https://public.tableau.com/views/SwiggyCuisinePerformanceDiagnostic_17868998389540/SwiggyRevenueDashboard?%3Alanguage=en-US&%3Adisplay_count=n&%3Aorigin=viz_share_link&utm_source=chatgpt.com)

The Tableau dashboard contains:

* Total Revenue KPI
* Total Delivered Orders KPI
* Average Order Value KPI
* Cuisines Meeting Target KPI
* Monthly revenue trend from January to June 2026
* Cuisine revenue comparison
* Above/Below Target classification
* Cross-worksheet filter

## Data Story

The written business interpretation and recommendations are available in:

[`DATA_STORY.md`](DATA_STORY.md)

The analysis identifies three cuisines above target and three cuisines below target and provides two recommendations based only on the project data.

## AI-Assisted Prompting Log

The two RCTCF-structured AI prompts and their concrete verification steps are documented in:

[`ai_log.md`](ai_log.md)

The log contains one prompt used during Part A SQL work and a second prompt used during Part C data-story work.

## Key Results

| Cuisine      |  Revenue |   Target | Status       |
| ------------ | -------: | -------: | ------------ |
| North Indian | ₹216,297 | ₹180,000 | Above Target |
| Chinese      | ₹127,840 | ₹140,000 | Below Target |
| South Indian |  ₹63,417 |  ₹50,000 | Above Target |
| Fast Food    |  ₹55,123 |  ₹60,000 | Below Target |
| Desserts     |  ₹19,694 |  ₹25,000 | Below Target |
| Italian      |  ₹14,735 |  ₹10,000 | Above Target |

**Total Revenue:** ₹497,106

**Cuisines Meeting Target:** 3 of 6

## Tools Used

* SQLite through Python's built-in `sqlite3`
* Google Sheets / spreadsheet workbook
* Tableau Public
* AI chat assistant for the two documented RCTCF prompts

