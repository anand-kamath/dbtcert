{{config(
    materialized='incremental',
    unique_key='comment_id',
    incremental_strategy='merge',
    on_schema_change='append_new_columns',
    merge_update_columns=['comment_timestamp', 'member_nickname', 'comment_subject', 'comment_body'],
)}}

with int_airport_comments as (
    select 
      comment_id,
      airport_ident,
      comment_timestamp,
      case when member_nickname is null or member_nickname = '' then '__UNKNOWN__' else member_nickname end as member_nickname,
      comment_subject,
      comment_body,
      current_timestamp() as loaded_at
    from {{ ref('src_airport_comments') }}
    where comment_body is not null and comment_body != ''
)

select * from int_airport_comments
{% if is_incremental() %}
  where comment_id > (select max(comment_id) from {{ this }})
{% endif %}
