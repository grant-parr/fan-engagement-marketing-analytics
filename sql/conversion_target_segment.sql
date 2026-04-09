-- Portfolio Project: Fan Engagement & Marketing Channel Analytics
-- Description: Example SQL used to build a fan-level dataset and identify
-- high-value marketing segments (digitally engaged non-buyers)
-- Note: Data and table names have been anonymized

-- channel_summary.sql
-- Example portfolio-safe SQL to summarize conversion by channel participation

SELECT
    CASE WHEN is_email_subscriber = 1 THEN 'Email Subscriber' ELSE 'Not Email Subscriber' END AS email_group,
    CASE WHEN is_app_user = 1 THEN 'App User' ELSE 'Not App User' END AS app_group,
    CASE WHEN is_streaming_user = 1 THEN 'Streaming User' ELSE 'Not Streaming User' END AS streaming_group,
    COUNT(*) AS fans,
    SUM(CASE WHEN is_ticket_buyer = 1 THEN 1 ELSE 0 END) AS ticket_buyers,
    ROUND(
        SAFE_DIVIDE(SUM(CASE WHEN is_ticket_buyer = 1 THEN 1 ELSE 0 END), COUNT(*)),
        4
    ) AS ticket_buyer_rate
FROM analytics.fan_marketing_dataset
GROUP BY 1, 2, 3
ORDER BY fans DESC;
