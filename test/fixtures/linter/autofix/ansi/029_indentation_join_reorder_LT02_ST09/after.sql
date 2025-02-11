SELECT table_a.*
FROM schema.table_a
  INNER JOIN schema.table_b
    ON
      table_a.col_a = table_b.col_a
      AND table_b.col_b = {{ snapshot_date() }}
