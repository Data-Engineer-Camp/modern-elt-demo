from setuptools import find_packages, setup

if __name__ == "__main__":
    setup(
        name="elt",
        packages=find_packages(exclude=["elt_tests"]),
        package_data={"elt": ["dw/*"]},
        install_requires=[
            "dagster",
            "dagster-airbyte",
            "dagster-dbt",
            "dbt-core",
        ],
        extras_require={"dev": ["dagit", "pytest"]},
    )
