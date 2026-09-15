# AI-Assisted Prompting Log

## Prompt 1 — SQL diagnostic (RCTCF)

**Role:** Act as a careful SQLite analyst helping me complete a BigBasket category-performance diagnostic.

**Context:** I have a deterministic SQLite database with `orders`, `products`, and `category_targets`. Delivered revenue must be compared with category targets. The database is SQLite, so date handling should use `strftime()`.

**Task:** Draft a category-level SQL query that calculates delivered revenue, joins the category targets, computes variance and percentage variance, and labels each category as `Above Target`, `Below Target - Watch`, or `Below Target - Critical`.

**Constraints:** Use SQLite-compatible syntax. Avoid integer-division errors in the percentage variance calculation. Use the three-tier rule exactly: above target; otherwise Watch when the shortfall is within 15%; otherwise Critical.

**Format:** Return one runnable SQL query with readable aliases and a clear `CASE` expression.

**Concrete verification performed:** I ran the generated query against the deterministic `bigbasket_capstone.db` and checked the category results against the expected clean SQL totals; the six category totals reconciled, including Household Essentials at ₹21,715 and Fruits & Vegetables at ₹9,790.

## Prompt 2 — Pandas cleaning (RCTCF)

**Role:** Act as a Python/Pandas data-cleaning reviewer.

**Context:** `orders_raw.csv` intentionally contains duplicate order IDs, mixed casing/whitespace, missing `amount_inr` values, and inflated outliers. Revenue analysis should use Delivered orders, exclude missing revenue, and cap high-side outliers with the IQR upper fence.

**Task:** Provide Pandas code that calculates Q1 and Q3 on Delivered non-null revenue, computes the IQR upper fence, and caps values above that fence with `.clip(upper=...)`.

**Constraints:** Do not fill missing revenue with zero or a mean. Do not drop the outliers. Keep the raw rating nulls for Cancelled/Pending orders unchanged.

**Format:** Give a compact code block plus one sentence explaining the cap.

**Concrete verification performed:** I ran the Pandas cleaning pipeline on the generated raw export, computed Q1=90.00, Q3=275.00, and upper fence=552.50, then verified that all capped Delivered revenue values are at or below the upper fence and that 16 rows were capped.
