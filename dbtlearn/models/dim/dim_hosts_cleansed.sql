{{
    config(
        materialized = 'view'
    )
}}

WITH src_hosts as
(
    SELECT * FROM {{ ref('src_hosts') }}
)
SELECT 
    host_id,
	nvl(host_name,'Anonymous') as host_name, 
	is_superhost, 
	created_at,
	updated_at
FROM 
    src_hosts