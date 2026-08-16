# AI-Assisted Prompting Log

## AI-Assisted Prompt #1 — Part A SQL

### Role

Act as a SQL tutor and data analyst experienced with SQLite.

### Context

I am completing Part A of a Swiggy Cuisine Performance Diagnostic project. The project uses a deterministic SQLite database named `swiggy_capstone.db` containing `restaurants`, `customers`, `orders`, and `cuisine_targets` tables. I need to write SQL queries for aggregation, joins, date-based reporting, and cuisine revenue analysis. The database uses SQLite syntax.

### Task

Help me draft or debug the monthly-by-cuisine revenue query that calculates monthly delivered-order revenue by cuisine. The result must contain the columns `cuisine`, `month`, `order_count`, `total_revenue`, and `avg_revenue`.

### Constraints

Use SQLite syntax. Only include orders whose status is `Delivered`. Extract the month using `strftime('%Y-%m', order_date)`. Group by cuisine and month, calculate order count, total revenue, and average revenue, and order the result by cuisine and month. Do not change the database data or regenerate it.

### Format

Provide one runnable SQLite SQL query followed by a short explanation of each selected column and the grouping logic.

### Verification

I ran the AI-suggested query against my `swiggy_capstone.db` database and checked the returned results and column structure before using the query for my Part A monthly revenue export.

---

## AI-Assisted Prompt #2 — Part C Tableau Data Story

### Role

Act as a business intelligence analyst helping me interpret a Tableau Public dashboard for a Swiggy category management team.

### Context

I have created a Tableau Public dashboard using the fixed `monthly_cuisine_revenue.csv` generated from my Part A SQL analysis. The dashboard covers January 2026 through June 2026 and compares monthly revenue and cuisine-level revenue performance. Part A and Part B were used to establish and cross-check the revenue figures and cuisine target classifications.

### Task

Help me draft a short, evidence-based data story for the Swiggy category management team. The story should explain which cuisines are above target and which are below target, describe the revenue-versus-target performance, and suggest exactly two concrete recommendations based only on the numbers shown in the project.

### Constraints

Use only the figures and classifications from my SQL results, spreadsheet cross-check, and Tableau dashboard. Do not invent restaurant-level causes, customer behaviour, market conditions, or external business information. Do not make unsupported assumptions. Give exactly two concrete recommendations.

### Format

Provide:

1. A concise overall performance summary.
2. The Above Target or Below Target status of all six cuisines.
3. The revenue-versus-target performance for each cuisine.
4. Exactly two concrete recommendations.
5. A short concluding statement suitable for the project README or data story.

### Verification

I cross-checked the revenue figures, target values, and Above Target/Below Target classifications in the AI-assisted draft against my Part A SQL results, Part B spreadsheet cross-check, and Tableau dashboard before using the information in my final data story.
