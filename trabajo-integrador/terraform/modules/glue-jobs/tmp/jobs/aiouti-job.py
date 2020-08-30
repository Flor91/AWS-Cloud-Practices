import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from awsglue.dynamicframe import DynamicFrame

## @params: [JOB_NAME]
args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

datasource0 = glueContext.create_dynamic_frame.from_catalog(
  database="aiouti-db",
  table_name="raw",
  transformation_ctx="datasource0")

# Convert to a dataframe and partition based on "partition_col"
partitioned_dataframe = datasource0.toDF().repartition(1)
# Convert back to a DynamicFrame for further processing.
partitioned_dynamicframe = DynamicFrame.fromDF(partitioned_dataframe, glueContext, "partitioned_df")

applymapping1 = ApplyMapping.apply(frame=partitioned_dynamicframe, mappings=[
  ("device", "string", "device", "string"),
  ("group", "string", "group", "string"),
  ("devicetype", "string", "devicetype", "string"),
  ("date", "string", "date", "string"),
  ("inputcurrent", "int", "inputcurrent", "int"),
  ("inputcurrentunit", "string", "inputcurrentunit", "string"),
  ("inputvoltage", "int", "inputvoltage", "int"),
  ("inputvoltageunit", "string", "inputvoltageunit", "string"),
  ("temp1", "int", "temp1", "int"),
  ("temp1unit", "string", "temp1unit", "string"),
  ("temp2", "int", "temp2", "int"),
  ("temp2unit", "string", "temp2unit", "string"),
  ("scale1", "int", "scale1", "int"),
  ("scale1unit", "string", "scale1unit", "string"),
  ("scale2", "int", "scale2", "int"),
  ("scale2unit", "string", "scale2unit", "string"),
  ("flow", "int", "flow", "int"), ("flowunit", "string", "flowunit", "string")],
                                   transformation_ctx="applymapping1")

datasink4 = glueContext.write_dynamic_frame.from_options(
  frame=applymapping1,
  connection_type="s3",
  connection_options={
    "path": "s3://aiouti-lf/lakeformation/measurements/processed/mediciones/"
  },
  format="parquet",
  transformation_ctx="datasink4"
)
job.commit()
