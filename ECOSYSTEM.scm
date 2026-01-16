; SPDX-License-Identifier: AGPL-3.0-or-later
; FormBD-Analytics Ecosystem Definition
; Media Type: application/vnd.ecosystem+scm

(ecosystem
  (version "1.0.0")
  (name "formbd-analytics")
  (type "projection-service")
  (purpose "OLAP analytics and aggregations over FormBD documents")

  (position-in-ecosystem
    (layer "query-projection")
    (role "Provides columnar storage and analytical queries as a materialized projection over FormBD")
    (data-flow "FormBD → formbd-analytics (read-only projection)")
    (integration-point "HTTP API with DataFrames-based query engine"))

  (related-projects
    (project
      (name "formbd")
      (relationship "upstream-dependency")
      (description "Source of truth for all document data")
      (integration "HTTP API fetch from collections"))

    (project
      (name "formbd-geo")
      (relationship "sibling-service")
      (description "Spatial projection layer - may share data transformations")
      (integration "Both read from FormBD, could share projections"))

    (project
      (name "formbd-studio")
      (relationship "primary-consumer")
      (description "GUI for FormBD - will consume analytics API for dashboards")
      (integration "Calls /analytics/* endpoints for charts and aggregations"))

    (project
      (name "bofig")
      (relationship "potential-consumer")
      (description "Evidence graph with PROMPT scores needing aggregation")
      (integration "Could use analytics for evidence quality metrics"))

    (project
      (name "zotero-formbd")
      (relationship "potential-consumer")
      (description "Reference manager with PROMPT scores")
      (integration "Could use analytics for reference quality dashboards")))

  (what-this-is
    ("Columnar storage using Arrow/Parquet for analytical workloads")
    ("PROMPT score aggregations and distributions")
    ("Time-series analysis of document creation and modifications")
    ("Contributor/provenance analytics")
    ("Materialized projection - FormBD remains source of truth"))

  (what-this-is-not
    ("Not a data warehouse - just an analytical projection")
    ("Not a replacement for FormBD queries - complements them")
    ("Not real-time - batch sync from FormBD")
    ("Not a BI tool - provides APIs for BI tools to consume")
    ("Not responsible for data integrity - FormBD handles that")))
