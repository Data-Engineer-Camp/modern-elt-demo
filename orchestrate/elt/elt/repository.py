from dagster import (
    ScheduleDefinition,
    repository, 
    job
)

from dagster_airbyte import airbyte_resource, airbyte_sync_op
from dagster_dbt import dbt_run_op, dbt_cli_resource
from .utils.constants import AIRBYTE_CONNECTION_ID, AIRBYTE_CONFIG, DBT_CONFIG

airbyte_sync = airbyte_sync_op.configured({"connection_id": AIRBYTE_CONNECTION_ID}, name="airbyte_sync")

@job(resource_defs={
        "airbyte": airbyte_resource.configured(AIRBYTE_CONFIG),
        "dbt": dbt_cli_resource.configured(DBT_CONFIG)
    })
def elt_job():
    dbt_run_op(airbyte_sync())

@repository
def elt():
    return [
        # update all assets once a day
        ScheduleDefinition(
            job=elt_job, cron_schedule="@daily"
        )
    ]
