# BigBasket Category Performance Diagnostic

# Project Overview

This project analyzes BigBasket category-level revenue performance using SQLite/SQL, Excel, Python/Pandas, and Tableau Public. The goal is to identify which categories are meeting their revenue targets, which categories are underperforming, and what actions the category team should prioritize.

# Business Question

Which BigBasket categories are meeting or missing their revenue targets, and what actions should be taken to improve category performance?

# Key Results

| Category | Revenue (₹) | Target (₹) | Variance (₹) | Target Status |
|---|---:|---:|---:|---|
| Household Essentials | 21,715 | 17,000 | +4,715 | Above Target |
| Personal Care | 16,382 | 15,500 | +882 | Above Target |
| Bakery | 15,410 | 12,000 | +3,410 | Above Target |
| Dairy & Eggs | 14,090 | 16,500 | -2,410 | Below Target - Watch |
| Snacks & Beverages | 10,895 | 13,000 | -2,105 | Below Target - Critical |
| Fruits & Vegetables | 9,790 | 12,000 | -2,210 | Below Target - Critical |

# Overall Performance

- Total delivered revenue: ₹88,282
- Total delivered orders: 434
- Average Order Value: ₹203.41
- Categories meeting target: 3 out of 6
- Categories below target: 3 out of 6

# Data Story

Household Essentials is the strongest category, generating ₹21,715 against a ₹17,000 target, which is ₹4,715 above target.

Personal Care generated ₹16,382 against a ₹15,500 target, finishing ₹882 above target.

Bakery generated ₹15,410 against a ₹12,000 target, finishing ₹3,410 above target.

Dairy & Eggs generated ₹14,090 against a ₹16,500 target, resulting in a ₹2,410 shortfall and a Below Target - Watch status.

Snacks & Beverages generated ₹10,895 against a ₹13,000 target, resulting in a ₹2,105 shortfall and a Below Target - Critical status.

Fruits & Vegetables generated ₹9,790 against a ₹12,000 target, resulting in a ₹2,210 shortfall and a Below Target - Critical status.

# Recommendations

1. **Prioritize recovery efforts in Fruits & Vegetables and Snacks & Beverages.** Both categories are in the Critical tier, so marketing, assortment, pricing, and promotional experiments should be focused there first.

2. **Use the successful categories as benchmarks.** Household Essentials, Personal Care, and Bakery are above target. Their strongest products and successful sales practices should be reviewed and used as references when improving the weaker categories.

# Tableau Public Dashboard

[View the Interactive Tableau Public Dashboard](https://public.tableau.com/views/bigbasket_category_performance_diagnostics/BigBasketCategoryPerformanceDiagnostic)

# Project Files

# Part 1 — SQL and Data Setup

- [`generate_data.py`](generate_data.py) — deterministic dataset generation script
- [`bigbasket_capstone.db`](bigbasket_capstone.db) — SQLite database
- [`orders_raw.csv`](orders_raw.csv) — deliberately messy raw order export
- [`products.csv`](products.csv) — product and supplier data
- [`verify.sql`](verify.sql) — database verification queries
- [`01_foundations.sql`](01_foundations.sql) — WHERE, DISTINCT, ORDER BY, LIMIT, aliases, IN, BETWEEN, NOT BETWEEN, and IS NULL
- [`02_aggregation_joins.sql`](02_aggregation_joins.sql) — aggregation, HAVING, INNER JOIN, and LEFT JOIN queries
- [`03_reporting.sql`](03_reporting.sql) — product tiers, monthly category reporting, and target variance analysis
- [`monthly_category_revenue.csv`](monthly_category_revenue.csv) — fixed 36-row monthly category revenue dataset used in Parts 2 and 3

# Part 2 — Spreadsheet Cross-Check

- [`bigbasket_capstone.xlsx`](bigbasket_capstone.xlsx) — Excel workbook containing Monthly Data, Category Targets, Pivot Table, and Category Summary

# Part 3 — Tableau Dashboard

- [Tableau Public Dashboard](https://public.tableau.com/views/bigbasket_category_performance_diagnostics/BigBasketCategoryPerformanceDiagnostic)

# Part 4 — Python/Pandas

- [`analysis.ipynb`](analysis.ipynb) — data cleaning, outlier treatment, revenue analysis, supplier analysis, cross-validation, and visualizations

# AI Assistance

- [`ai_log.md`](ai_log.md) — RCTCF-structured AI prompts and concrete verification steps

# SQL Workflow

# 01 Foundations

The `01_foundations.sql` file demonstrates:

- WHERE
- DISTINCT
- ORDER BY + LIMIT
- Alias using AS
- IN
- BETWEEN
- NOT BETWEEN
- IS NULL

# 02 Aggregation and Joins

The `02_aggregation_joins.sql` file demonstrates:

- INNER JOIN
- GROUP BY
- COUNT
- SUM
- AVG
- HAVING
- LEFT JOIN
- COUNT(o.order_id) for zero-order products

The LEFT JOIN also preserves `Premium Face Cream 50g` with zero orders.

# 03 Reporting

The `03_reporting.sql` file contains:

- Product revenue tiering with CASE WHEN
- Monthly category revenue reporting
- Category target variance
- Percentage variance
- Above Target / Watch / Critical classification

# Regenerating the Dataset

The dataset is deterministic and uses the required random seed.

To regenerate the database and raw exports:

```bash
python generate_data.py
