;; SPDX-License-Identifier: AGPL-3.0-or-later
;; META.scm - Project metadata and architectural decisions

(define project-meta
  `((version . "1.0.0")
    (architecture-decisions
      ((adr-001
         ((status . "accepted")
          (date . "2026-01-24")
          (context . "Vexometer satellite system requires coordination mechanism for 12+ independent repos. Options: monorepo vs umbrella documentation hub vs distributed wiki.")
          (decision . "Create umbrella documentation repository (vexometer-satellites) as single source of truth for integration protocols, satellite registry, and development coordination.")
          (consequences . "Pros: Clear ownership, version-controlled protocols, easy linking from satellites. Cons: Requires maintenance, could become stale if not updated. Mitigation: Automate satellite discovery via GitHub API.")))
       (adr-002
         ((status . "accepted")
          (date . "2026-01-24")
          (context . "Satellites need standardized way to prove efficacy. Options: ad-hoc claims, vexometer native integration, external protocol.")
          (decision . "Define vexometer-trace-v1 and vexometer-efficacy-v1 JSON protocols for before/after validation and statistical reporting.")
          (consequences . "Pros: Language-agnostic, machine-readable, independently verifiable. Cons: Requires vexometer support for validation. Mitigation: Implement validation tooling in vexometer.")))
       (adr-003
         ((status . "accepted")
          (date . "2026-01-24")
          (context . "Satellite development order needs prioritization. All 12 satellites equally important, but limited capacity.")
          (decision . "Prioritize vex-lazy-eliminator first (CII reduction) as proof of concept. Objective metric, high user impact, clear success criteria.")
          (consequences . "Pros: Demonstrates pattern for other satellites, validates integration protocol. Cons: Other metrics remain unaddressed initially. Mitigation: Document roadmap clearly.")))))
    (development-practices
      ((code-style . "per-satellite (Rust: rustfmt, Ada: GNAT style, Haskell: hlint)")
       (security . "openssf-scorecard")
       (testing . "unit (80%+ coverage) + integration (vexometer traces) + statistical (p<0.05)")
       (versioning . "semver")
       (documentation . "asciidoc")
       (branching . "trunk-based")
       (license . "AGPL-3.0-or-later (umbrella), satellites may vary")))
    (design-rationale
      ((why-separate-repos
         . "Each satellite is independently deployable, has different language/runtime requirements, and targets different user needs. Monorepo would couple unrelated concerns.")
       (why-json-protocols
         . "Language-agnostic, widely supported, human-readable, machine-parseable. Enables polyglot satellite ecosystem.")
       (why-statistical-validation
         . "Efficacy claims must be reproducible and scientifically rigorous. Statistical significance (p<0.05) ensures interventions actually work.")
       (why-vexometer-validates
         . "Satellites are untrusted. Independent validation by vexometer prevents gaming metrics or false efficacy claims.")))))
