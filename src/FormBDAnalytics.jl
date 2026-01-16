# SPDX-License-Identifier: AGPL-3.0-or-later
"""
FormBD-Analytics: OLAP analytics layer for FormBD

Provides columnar storage and analytical queries over FormBD documents.
"""
module FormBDAnalytics

using Arrow
using CSV
using Dates
using DataFrames
using HTTP
using JSON3
using Oxygen
using Parquet2
using Tables
using TOML
using UUIDs

export Config, load_config
export FormBDClient, fetch_collection, fetch_document
export ColumnarStore, sync!, query, prompt_stats, time_series
export serve

include("config.jl")
include("formbd_client.jl")
include("columnar_store.jl")
include("analytics.jl")
include("api.jl")

end # module
