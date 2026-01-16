; SPDX-License-Identifier: AGPL-3.0-or-later
; FormBD-Analytics Project State
; Reference: hyperpolymath/gitvisor/STATE.scm

(state
  (metadata
    (version "0.1.0")
    (schema-version "1.0")
    (created "2025-01-16")
    (updated "2025-01-16")
    (project "formbd-analytics")
    (repo "https://github.com/hyperpolymath/formbd-analytics"))

  (project-context
    (name "FormBD-Analytics")
    (tagline "OLAP analytics layer for FormBD")
    (tech-stack
      (primary "Julia")
      (frameworks ("Oxygen.jl" "DataFrames.jl" "Arrow.jl"))
      (dependencies ("Parquet2" "JSON3" "HTTP" "TOML"))))

  (current-position
    (phase "initial-implementation")
    (overall-completion 15)
    (components
      (component
        (name "columnar-store")
        (completion 70)
        (status "core-implemented")
        (notes "Parquet persistence, sync from FormBD"))
      (component
        (name "formbd-client")
        (completion 80)
        (status "core-implemented")
        (notes "HTTP client with PROMPT extraction"))
      (component
        (name "analytics-engine")
        (completion 60)
        (status "core-functions")
        (notes "PROMPT stats, time-series, contributors"))
      (component
        (name "http-api")
        (completion 50)
        (status "routes-defined")
        (notes "Oxygen routes, needs testing"))
      (component
        (name "testing")
        (completion 5)
        (status "not-started")
        (notes "Needs unit and integration tests"))
      (component
        (name "documentation")
        (completion 50)
        (status "readme-complete")
        (notes "README done, needs API docs")))
    (working-features
      ("Columnar storage with Parquet")
      ("FormBD document sync")
      ("PROMPT score extraction")
      ("PROMPT aggregations and distributions")
      ("Time-series analysis")
      ("Contributor analytics")))

  (route-to-mvp
    (milestone
      (name "julia-setup")
      (status "pending")
      (items
        ("Verify Project.toml dependencies resolve")
        ("Run with default config")
        ("Test basic module loading")))
    (milestone
      (name "formbd-integration")
      (status "pending")
      (items
        ("Test against real FormBD instance")
        ("Verify document syncing")
        ("Validate PROMPT extraction")))
    (milestone
      (name "api-testing")
      (status "pending")
      (items
        ("Test /analytics/health endpoint")
        ("Test /analytics/sync endpoint")
        ("Test all query endpoints")))
    (milestone
      (name "studio-integration")
      (status "pending")
      (items
        ("Define chart data formats")
        ("Add endpoints for formbd-studio")
        ("Test dashboard integration"))))

  (blockers-and-issues
    (critical ())
    (high
      (issue
        (id "ANA-001")
        (description "Need FormBD instance for integration testing")
        (mitigation "Can use mock data initially")))
    (medium
      (issue
        (id "ANA-002")
        (description "Oxygen.jl query param handling needs verification")
        (mitigation "Test with curl after setup")))
    (low ()))

  (critical-next-actions
    (immediate
      ("Install Julia dependencies")
      ("Create sample config file")
      ("Test module loading"))
    (this-week
      ("Integration tests with FormBD")
      ("Test analytics queries")
      ("Docker deployment"))
    (this-month
      ("Performance benchmarks")
      ("formbd-studio integration")
      ("Dashboard endpoints")))

  (session-history
    (snapshot
      (date "2025-01-16")
      (accomplishments
        ("Created Julia project structure")
        ("Implemented columnar store with Parquet")
        ("Implemented FormBD HTTP client")
        ("Created analytics functions")
        ("Created Oxygen HTTP API")
        ("Created README and ECOSYSTEM files")))))
