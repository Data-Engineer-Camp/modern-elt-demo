from dagster._utils import file_relative_path

AIRBYTE_CONNECTION_ID = "3f5c1a1c-6cd8-48da-8770-542bb6b80040"
AIRBYTE_CONFIG = {"host": "localhost", "port": "8000"}
DBT_PROJECT_DIR = file_relative_path(__file__, "../../../../transform/dw")
DBT_PROFILES_DIR = file_relative_path(__file__, "../../../../transform/dw/config")
DBT_CONFIG = {"project_dir": DBT_PROJECT_DIR, "profiles_dir": DBT_PROFILES_DIR}
