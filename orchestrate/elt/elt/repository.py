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

# from dagster_airbyte import airbyte_resource
# from dagster_dbt import dbt_cli_resource

# from dagster import (
#     ScheduleDefinition,
#     define_asset_job,
#     load_assets_from_package_module,
#     repository,
#     with_resources,
# )

# from . import assets
# from .utils.constants import AIRBYTE_CONFIG, DBT_CONFIG

# from dagster import graph, job, op, get_dagster_logger
# from dagster_airbyte import airbyte_resource, airbyte_sync_op
# from dagster_dbt import dbt_run_op, dbt_cli_resource

# @job(resource_defs={
#         # "airbyte": airbyte_resource,
#         "dbt": dbt_cli_resource.configured(DBT_CONFIG)
#     })
# def elt_job():
#     # sync_dvd_rental()
#     dbt_run_op()


