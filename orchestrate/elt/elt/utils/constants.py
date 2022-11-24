from dagster._utils import file_relative_path

AIRBYTE_CONNECTION_ID = "935e42bc-7851-4a10-856b-6eed632eb8be"
AIRBYTE_CONFIG = {"host": "localhost", "port": "8000"}
DBT_PROJECT_DIR = file_relative_path(__file__, "../../../../transform/dw")
DBT_PROFILES_DIR = file_relative_path(__file__, "../../../../transform/dw")
DBT_CONFIG = {"project_dir": DBT_PROJECT_DIR, "profiles_dir": DBT_PROFILES_DIR}
