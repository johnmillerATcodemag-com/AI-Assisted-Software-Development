---
marp: true
theme: default
paginate: true
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-18"
operator: "johnmillerATcodemag-com"
chat_id: "merge-marp-decks-20260318"
prompt: |
  Extract Module 3 (Dependency Management Policy) from the combined deck at
  Slides/ai-assisted-dev-overview.md into a standalone Marp slide file.
started: "2026-03-18T23:25:18Z"
ended: "2026-03-18T23:55:00Z"
total_duration: "00:30:00"
ai_log: "ai-logs/2026/03/18/merge-marp-decks-20260318/conversation.md"
source: "Slides/ai-assisted-dev-overview.md"
---
# Dependency Management Policy

## Secure, Compliant, and Maintainable Dependencies

*AI-Assisted Software Development*

::: notes
Welcome to the Dependency Management Policy module. This session covers how to select, approve, monitor, and maintain software dependencies in a secure and compliant way.

**Timing**: 1 minute for title slide

**Key Points**:
- Dependencies are a major attack surface — supply chain attacks are increasing
- Policy-driven dependency management balances velocity with security
- The right tooling automates most compliance checks

**Delivery**: Start with a question: "How many of you have shipped a dependency vulnerability to production?" This grounds the conversation in real risk.

**Transition**: "Let's look at how we classify dependencies by risk level."
:::

---

## Dependency Classification

| Category | Risk | Examples |
|----------|------|----------|
| **Production** | Highest | Runtime libs, frameworks, DB drivers |
| **Development** | Medium | Build tools, test frameworks, linters |
| **AI/ML** | Special | Model packages, inference engines |
| **Infrastructure** | System Critical | Container images, cloud SDKs |

**Risk Matrix**:
- **Critical** → Architecture + Security + Legal review
- **High** → Technical + Security scan + License check
- **Medium** → Technical review + Automated scanning
- **Low** → Automated approval with post-review

::: notes
Not all dependencies are equal — risk-based classification drives the right level of review.

**Timing**: 3 minutes

**Key Points**:
- Production dependencies have the highest impact if compromised
- AI/ML dependencies are a special category with unique considerations (model files, GPU compatibility)
- Infrastructure dependencies affect the entire system lifecycle
- The risk matrix determines how much review a dependency needs before adoption

**Real-World Context**: The Log4Shell vulnerability in 2021 affected millions of applications. Most teams didn't know they had it because it was a transitive dependency. Risk classification helps identify which transitive dependencies need the most scrutiny.

**Transition**: "How do we actually decide whether to adopt a new dependency?"
:::

---

## Selection Criteria

**Must requirements** (all must pass):
- ✅ Active maintenance (commits within 6 months)
- ✅ Responsive issues (avg response < 2 weeks)
- ✅ Compatible license
- ✅ No known critical vulnerabilities
- ✅ Supports current target platforms

**Should requirements** (weighted scoring):
- Large community or corporate backing (weight: 3)
- Regular release cadence (weight: 2)
- Test coverage > 80% (weight: 2)
- Backward compatibility guarantees (weight: 1)

::: notes
Selection criteria create a consistent, objective evaluation process for new dependencies.

**Timing**: 3 minutes

**Key Points**:
- All "must" requirements are binary gates — failing any one disqualifies the package
- "Should" requirements create a weighted score that guides decisions
- Corporate backing (e.g., Meta, Google, Microsoft) provides support longevity signal
- License compatibility is often overlooked — GPL code in a commercial product is a legal issue

**Red Flags**: No commits in 12+ months, open critical security issues, unclear ownership, recent ownership transfer (common in supply chain attacks).

**Practical Tip**: Use tools like `deps.dev` or `socket.dev` to automate the initial evaluation.

**Transition**: "What does the approval workflow look like?"
:::

---

## Approval Workflow

```
New Dependency Request
         │
         ▼
  Automated Pre-checks
         │
    ┌────┴────┐
    │         │
   Low      Medium/High/Critical
    │         │
  Auto      Technical Review
 Approve         │
                 ▼
          Security Scan
                 │
                 ▼
          License Review
                 │
                 ▼
            Approve / Reject
                 │
                 ▼
      Update Dependency Registry
```

::: notes
The approval workflow scales review effort to the risk level of the dependency.

**Timing**: 2 minutes

**Walk Through the Flow**:
1. Developer submits a dependency request (via PR or ticket)
2. Automated pre-checks run immediately (vulnerability scan, license detection)
3. Risk level is assessed (Low = auto-approve; Medium+ = human review)
4. Technical review evaluates integration complexity and alternatives
5. Security scan checks for CVEs and supply chain risks
6. License review confirms compatibility with the project's license
7. Approved dependencies are added to the registry

**Key Point**: Low-risk development dependencies (like a test utility) can be auto-approved to avoid slowing down teams. Critical production dependencies always need human review.

**Transition**: "How do we manage versions and updates?"
:::

---

## Version Management

| Update Type | Auto-Update | Review Required | Approval |
|------------|-------------|-----------------|----------|
| Patch (Security) | ✅ Yes | Post-deployment | Automated |
| Patch (Bug Fix) | ✅ Yes | Pre-deployment | Tech Lead |
| Minor (Feature) | ❌ No | Pre-deployment | Tech Lead + QA |
| Major (Breaking) | ❌ No | Architecture Review | Architecture Board |

**Pinning Strategy**:
```yaml
production: "exact"        # react: 18.2.0
development: "patch"       # eslint: ^8.45.0
ai_ml: "minor-locked"      # tensorflow: ~2.13.0
```

::: notes
Version management policy defines when updates happen automatically vs. when they require review.

**Timing**: 2 minutes

**Key Points**:
- Security patches should auto-deploy after testing — the risk of not patching exceeds the risk of the update
- Major version updates nearly always have breaking changes and require architecture review
- Pinning exact versions for production dependencies ensures reproducible builds
- AI/ML packages need minor-locked pinning because model compatibility often requires specific framework versions

**Tool**: Configure Dependabot or Renovate to implement these rules automatically.

**Emergency Rule**: Critical security patches (CVSS 9.0+) must be deployed within 24 hours regardless of the normal schedule.

**Transition**: "How do we monitor for new vulnerabilities?"
:::

---

## Security Vulnerability Monitoring

**Monitoring Stack**:
- GitHub Dependabot alerts (real-time)
- Snyk or OWASP Dependency-Check (CI/CD)
- National Vulnerability Database (NVD) feeds

**Response Time SLAs**:

| Severity | CVSS Score | Response Time | Patch Time |
|----------|-----------|---------------|------------|
| Critical | 9.0–10.0 | 4 hours | 24 hours |
| High | 7.0–8.9 | 24 hours | 72 hours |
| Medium | 4.0–6.9 | 72 hours | 1 week |
| Low | 0.1–3.9 | 1 week | Next release |

::: notes
Proactive monitoring with defined SLAs ensures vulnerabilities are addressed before they become incidents.

**Timing**: 2 minutes

**Key Points**:
- Multiple monitoring tools provide defense in depth — no single tool catches everything
- SLAs create accountability and predictability for security response
- Critical vulnerabilities (CVSS 9+) need immediate escalation — page the on-call if needed
- "Response time" means acknowledging and assessing the issue; "patch time" means deploying the fix

**Operational Note**: Set up Slack/Teams alerts for new critical/high CVEs affecting your dependency tree. Waiting for a weekly email is too slow.

**Transition**: "Let's talk about license compliance — often overlooked but legally important."
:::

---

## License Compliance

**Approved Licenses** (auto-accept):
- MIT, Apache 2.0, BSD 2/3-Clause, ISC, Unlicense

**Requires Review**:
- GNU LGPL 2.1/3.0, Mozilla Public License 2.0

**Prohibited** (without legal approval):
- GNU GPL 2.0/3.0 in proprietary software
- GNU AGPL 3.0 (network copyleft)
- Custom/modified licenses

**Compatibility Matrix** (MIT project):
| Target License | Compatible? | Notes |
|---------------|-------------|-------|
| MIT | ✅ Yes | Perfect |
| Apache 2.0 | ✅ Yes | Can combine |
| GPL 3.0 | ❌ No | Would require GPL |

::: notes
License compliance protects the organization from legal liability.

**Timing**: 2 minutes

**Key Points**:
- Copyleft licenses (GPL, AGPL) require derivative works to be released under the same license — a problem for proprietary software
- AGPL extends GPL to cover network use — especially dangerous for SaaS products
- Apache 2.0 provides explicit patent protection that MIT does not
- Always check transitive dependencies for license changes

**Real-World Risk**: In 2022, several companies received legal notices for embedding GPL-licensed libraries in commercial products without proper compliance. Automated license scanning in CI prevents this.

**Tool Recommendation**: FOSSA or WhiteSource (Mend) for automated license compliance in CI/CD.

**Transition**: "What about supply chain security — protecting against malicious packages?"
:::

---

## Supply Chain Security

**Verification Practices**:
- ✅ Checksum verification for all packages
- ✅ Digital signature validation (where available)
- ✅ Official registry sources only (npm, PyPI, Maven Central)
- ✅ Maintainer reputation and 2FA requirements

**SLSA Framework** (Supply-chain Levels for Software Artifacts):
```
Level 1: Build process documented
Level 2: Tamper-evident build artifacts  ← Target minimum
Level 3: Source verified, build isolated
Level 4: Two-party review, hermetic build
```

**Internal Registry**: Scan all packages before ingestion, quarantine suspicious packages

::: notes
Supply chain attacks are now one of the top threat vectors — SolarWinds, XZ Utils, and dozens of npm package attacks have shown this is real.

**Timing**: 2 minutes

**Key Points**:
- Never install packages from unofficial registries or direct git URLs
- The SLSA framework (from Google) provides a security maturity model for build systems
- An internal registry proxy adds a layer of scanning before packages reach developers
- Package name typosquatting (e.g., `coloers` instead of `colors`) is a common attack vector

**Alarming Statistic**: The XZ Utils backdoor was nearly undetected despite being committed to a widely-used open source library by a sophisticated attacker who spent two years building trust.

**Practical Action**: Enable npm audit / pip audit in your CI pipeline as a basic first step.

**Transition**: "Let's look at automation for dependency updates."
:::

---

## Automated Dependency Updates

**Dependabot Configuration**:
```yaml
# .github/dependabot.yml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
    open-pull-requests-limit: 5
    reviewers: ["tech-leads"]
    assignees: ["security-team"]
    commit-message:
      prefix: "deps"
```

**Testing Before Auto-merge**:
- Unit tests must pass
- Security scan must pass
- No new license violations

::: notes
Automation removes the burden of manually tracking dependency updates.

**Timing**: 2 minutes

**Key Points**:
- Dependabot creates PRs automatically — your CI pipeline validates them
- Batching updates (weekly rather than immediate) reduces PR noise
- Auto-merge for patch updates with clean test suites is a productivity win
- Set `open-pull-requests-limit` to prevent overwhelming the team with update PRs

**Advanced Setup**: Use Renovate Bot for more sophisticated grouping rules (e.g., group all `@types/*` packages into one PR).

**Transition**: "What's the process when emergencies happen?"
:::

---

## Emergency Patching

**Critical Vulnerability Response (0–4 hours)**:
1. Verify vulnerability and assess impact
2. Notify security incident response team
3. Evaluate available patches or workarounds
4. Deploy to staging, run accelerated test suite
5. Deploy to production with monitoring
6. Document and schedule post-incident review

**Emergency Approval**:
- Critical (CVSS 9.0+): CISO or Security Lead approval sufficient
- High (CVSS 7.0–8.9): Security Lead + Engineering Manager

::: notes
Emergency patching bypasses normal approval gates — but must be documented.

**Timing**: 2 minutes

**Key Points**:
- Speed matters in critical vulnerabilities — reduce approval friction without eliminating oversight
- A CISO-level approval is sufficient for emergency patches — don't require full board review
- Always create a post-incident ticket to follow up with proper testing
- The rollback plan must be prepared before deploying the emergency patch

**Preparation Tip**: Pre-define your emergency escalation contacts and document them in a runbook. Don't figure out who to call when a critical CVE drops at 11pm on a Friday.

**Transition**: "Let's close with key takeaways."
:::

---

## Key Takeaways

- **Classify** dependencies by risk — apply proportional review
- **Automate** vulnerability scanning in CI/CD pipeline
- **Pin** production versions, allow patch auto-updates
- **Monitor** with SLAs — critical CVEs need 24-hour response
- **License** check every dependency, including transitive ones
- **Supply chain** — use official registries and verify checksums

### Quick Wins
1. Enable Dependabot alerts (free, 5 minutes to set up)
2. Add `npm audit --audit-level=high` to CI
3. Run FOSSA or similar for license scanning

::: notes
Close with actionable steps the audience can take immediately.

**Timing**: 2 minutes

**Summary**:
- Risk-based classification prevents over-engineering low-risk decisions
- Automation handles routine updates — humans focus on high-risk changes
- License compliance protects the organization legally
- Supply chain security requires verifying the entire dependency tree
- Emergency procedures must be pre-defined and practiced

**Call to Action**: This week — enable Dependabot alerts on your repository and review the existing open alerts. Most teams have dozens of unaddressed vulnerability alerts.

**Q&A**: Open the floor for questions about specific tooling, policy exceptions, or governance challenges.
:::

---

