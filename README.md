# dbt orders_dq (dbt-duckdb)
SQL transformation layer for the data-quality-monitoring project: staging (typing, flags, dedup) -> marts (star schema + root-cause view), with schema and singular tests.
Data is synthetic. Run: `pip install dbt-duckdb; dbt seed --profiles-dir .; dbt run --profiles-dir .; dbt test --profiles-dir .; dbt docs generate --profiles-dir .`
