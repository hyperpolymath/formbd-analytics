; SPDX-License-Identifier: AGPL-3.0-or-later
; FormBD-Analytics Meta Information
; Media Type: application/meta+scheme

(meta
  (architecture-decisions
    (adr
      (id "adr-001")
      (title "Use Julia for analytics engine")
      (status "accepted")
      (date "2025-01-16")
      (context "Need efficient columnar operations for analytical queries. Hyperpolymath policy bans Python.")
      (decision "Use Julia with DataFrames.jl for columnar analytics")
      (consequences
        ("Native columnar operations with excellent performance")
        ("Strong Arrow/Parquet ecosystem")
        ("Aligns with Hyperpolymath language policy")
        ("JIT compilation approaches native performance")))

    (adr
      (id "adr-002")
      (title "Columnar storage with Parquet persistence")
      (status "accepted")
      (date "2025-01-16")
      (context "Analytics workloads benefit from columnar storage for aggregations and scans")
      (decision "Use DataFrames in memory with Parquet persistence for durability")
      (consequences
        ("Efficient aggregations and analytical queries")
        ("Standard format for data interchange")
        ("Persistence allows restart without full re-sync")))

    (adr
      (id "adr-003")
      (title "Projection architecture - FormBD as source of truth")
      (status "accepted")
      (date "2025-01-16")
      (context "FormBD philosophy prioritizes auditability over performance; analytics needs fast aggregations")
      (decision "formbd-analytics is a materialized projection that syncs from FormBD")
      (consequences
        ("Analytical data can become stale between syncs")
        ("No risk of data divergence - FormBD is authoritative")
        ("Aligns with FormBD's reversibility principle")))

    (adr
      (id "adr-004")
      (title "Focus on PROMPT score analytics")
      (status "accepted")
      (date "2025-01-16")
      (context "FormBD ecosystem uses PROMPT framework for epistemological scoring")
      (decision "Provide specialized analytics for PROMPT scores (aggregations, distributions, correlations)")
      (consequences
        ("Direct support for ecosystem's epistemological framework")
        ("Enables quality dashboards in formbd-studio")
        ("Can track research quality trends over time")))

    (adr
      (id "adr-005")
      (title "HTTP API with Oxygen.jl")
      (status "accepted")
      (date "2025-01-16")
      (context "Need to expose analytics as a service for formbd-studio and other consumers")
      (decision "Use Oxygen.jl for lightweight HTTP API")
      (consequences
        ("Simple, idiomatic Julia web framework")
        ("Easy integration with DataFrames results")
        ("JSON serialization for cross-language consumption"))))

  (development-practices
    (code-style
      (formatter "JuliaFormatter")
      (linter "None standard - use Julia best practices")
      (version "Julia 1.10+"))
    (security
      (dependencies "Check with Pkg.status()")
      (input-validation "Validate all query parameters")
      (rate-limiting "TODO: Add rate limiting for production"))
    (testing
      (unit-tests "test/ directory with Test.jl")
      (integration-tests "test/integration/")
      (coverage-target 70))
    (versioning "Semantic versioning in Project.toml")
    (documentation
      (readme "README.adoc")
      (api-docs "OpenAPI 3.0 (planned)")
      (inline "Docstrings with triple quotes"))
    (branching
      (main "main - stable releases")
      (develop "dev - integration branch")
      (features "feat/* - feature branches")))

  (design-rationale
    (why-julia
      "Julia provides the best combination of performance and ease-of-use for data analytics. DataFrames.jl is excellent for columnar operations, and Julia's JIT compilation gives near-native performance. Per Hyperpolymath policy, Python is banned.")
    (why-separate-repo
      "FormBD's philosophy explicitly deprioritizes performance (Auditability > Performance). OLAP workloads require columnar storage and pre-aggregation. Separation maintains FormBD's principles while enabling fast analytics.")
    (why-parquet
      "Parquet is the standard columnar format with excellent compression and query performance. Arrow provides zero-copy interop. This allows data exchange with other tools if needed.")
    (why-prompt-focus
      "The FormBD ecosystem is built around the PROMPT epistemological framework. Providing first-class analytics for PROMPT scores enables quality tracking and research integrity dashboards.")))
