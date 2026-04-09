-- Portfolio Project: Fan Engagement & Marketing Channel Analytics
-- Description: Example SQL used to segment fans based on digital engagement
-- and ticket purchasing behavior for marketing targeting
-- Note: Data and table names have been anonymized

WITH fan_features AS (
    SELECT
        fan_id,
        email_address,
        city,
        state,
        is_email_subscriber,
        is_app_user,
        is_web_user,
        is_streaming_user,
        is_ticket_buyer,
        active_channel_count,
        overall_engagement_score,
        days_since_app_visit,
        days_since_web_visit,
        days_since_stream_view,
        days_since_ticket_purchase
    FROM analytics.fan_marketing_dataset
),

segmented_fans AS (
    SELECT
        *,

        CASE
            WHEN overall_engagement_score >= 80 THEN 'High Engagement'
            WHEN overall_engagement_score >= 50 THEN 'Medium Engagement'
            ELSE 'Low Engagement'
        END AS engagement_tier,

        CASE
            WHEN is_ticket_buyer = 0
                 AND active_channel_count >= 2
                 AND overall_engagement_score >= 50
            THEN 1
            ELSE 0
        END AS conversion_target_flag,

        CASE
            WHEN is_ticket_buyer = 1 AND active_channel_count >= 3 THEN 'Multi-Channel Buyer'
            WHEN is_ticket_buyer = 1 THEN 'Buyer'
            WHEN is_ticket_buyer = 0
                 AND overall_engagement_score >= 80
            THEN 'High-Potential Non-Buyer'
            WHEN is_ticket_buyer = 0
                 AND overall_engagement_score >= 50
            THEN 'Moderately Engaged Non-Buyer'
            ELSE 'Low-Engagement Non-Buyer'
        END AS marketing_segment

    FROM fan_features
)

SELECT
    fan_id,
    email_address,
    city,
    state,
    is_email_subscriber,
    is_app_user,
    is_web_user,
    is_streaming_user,
    is_ticket_buyer,
    active_channel_count,
    overall_engagement_score,
    engagement_tier,
    conversion_target_flag,
    marketing_segment,
    days_since_app_visit,
    days_since_web_visit,
    days_since_stream_view,
    days_since_ticket_purchase
FROM segmented_fans;
