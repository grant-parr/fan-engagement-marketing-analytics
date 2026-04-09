# fan-engagement-marketing-analytics

## Repository Structure

- `fan_base_query.sql` → Builds unified fan dataset from multiple sources  
- `segmentation.sql` → Classifies fans into marketing-relevant segments  
- `conversion_targets.sql` → Identifies high-value audiences for campaign targeting  

Fan Engagement & Marketing Channel Analytics
Overview

This project focuses on building a unified fan-level dataset to analyze how digital engagement channels (mobile app, web, and media consumption) influence ticket purchasing behavior.

The goal was to identify high-value marketing opportunities by understanding which fans are engaged digitally but under-converted in ticketing.


Business Problem

Sports organizations have multiple fan touchpoints (mobile apps, streaming, email, ticketing), but these systems often operate in silos.

This project answers:

Which engagement channels are most predictive of ticket purchases?
Who are the highly engaged fans not yet buying tickets?
How can marketing teams better target conversion opportunities?

Data Sources
Mobile app engagement (YinzCam)
Ticketing transactions
CRM / fan identity (email-level)
Digital engagement signals (web/app usage, media consumption)
Event metadata (game date, opponent, venue)

Feature Engineering

Key features were created to translate raw activity into marketing-relevant signals:

Engagement Recency (last app visit, last digital interaction)
Engagement Frequency (number of interactions over time)
Channel Participation Flags
App user
Streaming user
Email subscriber
Ticket purchaser
Cross-Channel Behavior
Digital-only fans (engaged but not attending)
Multi-channel fans (engaged across multiple touchpoints)

Analytical Approach
Built a fan-level dataset using SQL (BigQuery)
Joined multiple data sources on unique fan identifiers
Created segmentation logic to classify fans by:
Engagement level (low / medium / high)
Purchase behavior (buyer vs non-buyer)

Key Use Case: Conversion Targeting

Identified a high-value segment:

Fans with high digital engagement (e.g., app usage, streaming activity) but no ticket purchase history

This segment represents a strong opportunity for:

Targeted email campaigns
Promotional offers
Retargeting strategies
Impact
Enabled marketing teams to shift from broad campaigns → targeted conversion strategies
Created a scalable dataset for future modeling (LTV, churn, conversion probability)
Established a framework for cross-channel fan analysis
Tools & Technologies
SQL (BigQuery)
Power BI
Python 
CRM / fan data platforms

Future Enhancements
Predictive conversion modeling
Channel attribution modeling
Real-time audience segmentation
