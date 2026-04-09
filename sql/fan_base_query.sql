-- Portfolio Project: Fan Engagement & Marketing Channel Analytics
-- Description: Example SQL used to build a fan-level dataset and identify
-- high-value marketing segments (digitally engaged non-buyers)
-- Note: Data and table names have been anonymized

-- conversion_target_segment.sql
-- Example portfolio-safe SQL for identifying digitally engaged fans
-- who have not yet converted to ticket buyers

WITH audience AS (
    SELECT
        fan_id,
        email_address,
        overall_engagement_score,
        is_email_subscriber,
        is_app_user,
        is_web_user,
        is_streaming_user,
        is_ticket_buyer,
        ticket_last_purchase_date
    FROM analytics.fan_marketing_dataset
)

SELECT
    fan_id,
    email_address,
    overall_engagement_score,
    is_email_subscriber,
    is_app_user,
    is_web_user,
    is_streaming_user
FROM audience
WHERE is_ticket_buyer = 0
  AND overall_engagement_score >= 50
  AND (
      is_app_user = 1
      OR is_web_user = 1
      OR is_streaming_user = 1
  )
ORDER BY overall_engagement_score DESC;
