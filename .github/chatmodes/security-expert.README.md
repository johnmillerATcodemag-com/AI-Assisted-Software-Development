# Security Analysis Chat Mode

This document provides comprehensive guidance for using the Security Analyzer chat mode to identify security vulnerabilities in your codebase and automatically create GitHub issues with detailed remediation instructions.

## Overview

The Security Analyzer is a specialized GitHub Copilot chat mode designed to:

- 🔍 **Comprehensive Security Analysis**: OWASP Top 10, CWE classifications, and emerging threats detection
- 🤖 **Automated GitHub Issue Creation**: Detailed vulnerability reports with CVSS scoring
- 📊 **Advanced Risk Assessment**: Business and technical impact analysis with prioritized remediation
- 🔧 **Actionable Remediation Guidance**: Step-by-step fixes with secure code examples
- 🛡️ **Multi-Phase Security Methodology**: Systematic threat modeling, deep analysis, and risk assessment
- 🚀 **CI/CD Integration**: Automated security scanning and continuous monitoring
- 📋 **Compliance Support**: GDPR, CCPA, SOX, HIPAA, and PCI DSS compliance checking

## Quick Start

### Using the Chat Mode

1. **Activate the Security Analyzer:**

   ```
   @SecurityAnalyzer
   ```

2. **Run a comprehensive security scan:**

   ```
   @security-scan
   ```

3. **Focus on specific vulnerability types:**

   ```
   @vulnerability-check
   @owasp-audit
   @auth-review
   @input-validation
   ```

4. **Perform risk assessment:**

   ```
   @risk-assessment
   @compliance-check
   ```

5. **Create GitHub issues automatically:**
   ```
   @create-issues
   ```

### Available Commands

#### Core Security Commands

| Command                | Description                                             | Use Case                       |
| ---------------------- | ------------------------------------------------------- | ------------------------------ |
| `@security-scan`       | Comprehensive security vulnerability assessment         | Complete security audit        |
| `@vulnerability-check` | Target specific vulnerability types                     | Focused vulnerability analysis |
| `@owasp-audit`         | OWASP Top 10 analysis with detailed reporting           | Industry standard compliance   |
| `@dependency-audit`    | Check for vulnerable dependencies and outdated packages | Supply chain security          |
| `@create-issues`       | Generate GitHub issues for identified vulnerabilities   | Issue tracking automation      |
| `@risk-assessment`     | Evaluate and score security risks using CVSS            | Risk prioritization            |
| `@compliance-check`    | Privacy and regulatory compliance review                | GDPR/CCPA compliance           |

#### Specialized Security Analysis

| Command             | Description                                        | Use Case                       |
| ------------------- | -------------------------------------------------- | ------------------------------ |
| `@owasp-check`      | OWASP Top 10 focused analysis                      | Quick compliance check         |
| `@auth-review`      | Authentication and authorization security review   | Access control validation      |
| `@input-validation` | Input validation and injection vulnerability check | Data sanitization review       |
| `@crypto-audit`     | Cryptographic implementation analysis              | Encryption security review     |
| `@dependency-check` | Vulnerable dependency identification               | Package security assessment    |
| `@config-security`  | Security configuration assessment                  | Infrastructure security        |
| `@privacy-audit`    | Data privacy and compliance review                 | Privacy regulation compliance  |
| `@threat-model`     | Create threat model for the application            | Security architecture planning |
| `@security-headers` | HTTP security headers analysis                     | Web security configuration     |
| `@api-security`     | API security assessment                            | API vulnerability testing      |

## Security Analysis Response Format

The Security Analyzer structures all responses with:

1. **🛡️ Security Executive Summary** (Risk level and critical findings overview)
2. **🎯 Critical Vulnerabilities** (Immediate action required)
3. **⚠️ High Priority Issues** (Address within sprint)
4. **📊 Security Metrics** (Overall security posture assessment)
5. **🔧 Remediation Roadmap** (Prioritized action plan with timelines)
6. **📋 GitHub Issues Created** (Links to generated issues and tracking)

This structured approach ensures consistent, actionable security analysis results that development and security teams can immediately act upon.

## Security Analysis Guidelines

### Code Review Focus Areas

- **Input Sanitization**: Check all user inputs for proper validation and sanitization
- **Authentication**: Verify secure authentication implementation and session management
- **Authorization**: Ensure proper access controls and privilege management
- **Session Management**: Review session handling, storage, and lifecycle management
- **Error Handling**: Check for information leakage in error responses
- **Logging**: Verify security event logging and audit trail implementation
- **Cryptography**: Review encryption, hashing, and key management implementations
- **Dependencies**: Check for known vulnerable packages and supply chain risks

### Compliance Considerations

- **GDPR**: Data protection and privacy requirements assessment
- **CCPA**: California privacy regulations compliance
- **SOX**: Financial data controls and audit requirements
- **HIPAA**: Healthcare data protection standards
- **PCI DSS**: Payment card industry security standards

### Security Testing Integration

- **SAST**: Static Application Security Testing recommendations and setup
- **DAST**: Dynamic Application Security Testing configuration
- **SCA**: Software Composition Analysis for dependency vulnerabilities
- **Container Security**: Docker and Kubernetes security scanning integration

## Security Risk Categories

- **Remote Code Execution (RCE)**
- **SQL Injection with admin access**
- **Authentication bypass**
- **Privilege escalation to admin**

**Response Time**: Immediate (within hours)

### 🟠 High (CVSS 7.0-8.9)

- **Cross-Site Scripting (XSS)**
- **Local File Inclusion (LFI)**
- **Sensitive data exposure**
- **Insecure direct object references**

**Response Time**: Within 1-2 days

### 🟡 Medium (CVSS 4.0-6.9)

- **Information disclosure**
- **Cross-Site Request Forgery (CSRF)**
- **Weak cryptographic practices**
- **Missing security headers**

**Response Time**: Within 1 week

### 🟢 Low (CVSS 0.1-3.9)

- **Information leakage**
- **Weak password policies**
- **Missing rate limiting**
- **Insecure cookies**

**Response Time**: Within 2 weeks

## Automated GitHub Issue Creation

When security vulnerabilities are detected, the system automatically creates detailed GitHub issues with:

### Issue Structure

```markdown
## 🔒 Security Vulnerability Report

### Vulnerability Summary

**Severity**: [Critical/High/Medium/Low]
**CVSS Score**: [0.0-10.0]
**CWE ID**: [CWE-XXX]
**Component**: [Affected file/component]

### Description

[Detailed vulnerability description]

### Impact Assessment

[Business and technical impact analysis]

### Proof of Concept

[Code location and exploitation scenario]

### Remediation Steps

[Prioritized action items with timelines]

### Code Examples

[Vulnerable vs. secure implementations]

### Testing Recommendations

[Security testing guidance]

### References

[OWASP, CWE, and best practice links]
```

### Issue Labels

- `security` - All security-related issues
- `vulnerability` - Confirmed security vulnerabilities
- `[severity-level]` - critical, high, medium, low
- `[vulnerability-type]` - injection, xss, cryptography, authentication
- `[component]` - frontend, backend, infrastructure

## CI/CD Integration

### GitHub Actions Workflow

The security analysis system includes a comprehensive GitHub Actions workflow that:

1. **Runs multiple security scanners:**
   - Semgrep for SAST analysis
   - Custom pattern matching
   - Dependency vulnerability checking
   - Bandit for Python security issues

2. **Analyzes results and creates issues:**
   - Processes scan results
   - Deduplicates findings
   - Creates detailed GitHub issues
   - Adds security summary comments to PRs

3. **Provides security metrics:**
   - Vulnerability counts by severity
   - Security trends over time
   - Compliance status reporting

### Workflow Triggers

- **Push to main/develop branches**
- **Pull request creation/updates**
- **Weekly scheduled scans**
- **Manual workflow dispatch**

### Configuration

The workflow can be customized with these parameters:

```yaml
workflow_dispatch:
  inputs:
    scan_type:
      description: "Type of security scan to run"
      options: ["full", "critical-only", "dependencies-only", "owasp-top10"]
    create_issues:
      description: "Create GitHub issues for findings"
      type: boolean
```

## Security Analysis Methodology

The Security Analyzer follows a systematic 3-phase approach:

### Phase 1: Initial Security Scan

1. **Threat Modeling**: Identify attack surface and potential threat actors
2. **Technology Assessment**: Analyze frameworks and libraries for known vulnerabilities
3. **Entry Point Mapping**: Locate user inputs, API endpoints, and data flows
4. **Dependency Audit**: Check for vulnerable dependencies and outdated packages

### Phase 2: Deep Security Analysis

1. **Authentication Review**: Examine authentication mechanisms and session management
2. **Authorization Check**: Analyze access controls and privilege management
3. **Input Validation**: Test for injection vulnerabilities (SQL, XSS, Command, etc.)
4. **Data Protection**: Review encryption, hashing, and sensitive data handling
5. **Configuration Security**: Assess security headers, CORS, and deployment configs

### Phase 3: Risk Assessment & Issue Creation

1. **Severity Classification**: Rate vulnerabilities using CVSS scoring
2. **Impact Analysis**: Assess business and technical impact
3. **Remediation Planning**: Provide step-by-step fix instructions
4. **GitHub Issue Generation**: Create detailed issues with remediation guidance

## Security Patterns Detected

### Core Security Expertise Areas

- **Vulnerability Detection**: OWASP Top 10, CWE classifications, and emerging threats
- **Static Code Analysis**: Pattern recognition for security anti-patterns
- **Dependency Security**: Supply chain analysis and known CVE detection
- **Authentication & Authorization**: Access control and privilege escalation risks
- **Input Validation**: Injection attacks and data sanitization issues
- **Cryptographic Analysis**: Weak encryption and key management flaws
- **Infrastructure Security**: Configuration and deployment vulnerabilities
- **Privacy & Compliance**: GDPR, CCPA, and data protection requirements

## Security Analysis Response Format

The Security Analyzer structures all responses with:

1. **🛡️ Security Executive Summary** (Risk level and critical findings overview)
2. **🎯 Critical Vulnerabilities** (Immediate action required)
3. **⚠️ High Priority Issues** (Address within sprint)
4. **📊 Security Metrics** (Overall security posture assessment)
5. **🔧 Remediation Roadmap** (Prioritized action plan with timelines)
6. **📋 GitHub Issues Created** (Links to generated issues and tracking)

This structured approach ensures consistent, actionable security analysis results that development and security teams can immediately act upon.

## Security Analysis Guidelines

### Code Review Focus Areas

- **Input Sanitization**: Check all user inputs for proper validation and sanitization
- **Authentication**: Verify secure authentication implementation and session management
- **Authorization**: Ensure proper access controls and privilege management
- **Session Management**: Review session handling, storage, and lifecycle management
- **Error Handling**: Check for information leakage in error responses
- **Logging**: Verify security event logging and audit trail implementation
- **Cryptography**: Review encryption, hashing, and key management implementations
- **Dependencies**: Check for known vulnerable packages and supply chain risks

### Compliance Considerations

- **GDPR**: Data protection and privacy requirements assessment
- **CCPA**: California privacy regulations compliance
- **SOX**: Financial data controls and audit requirements
- **HIPAA**: Healthcare data protection standards
- **PCI DSS**: Payment card industry security standards

### Security Testing Integration

- **SAST**: Static Application Security Testing recommendations and setup
- **DAST**: Dynamic Application Security Testing configuration
- **SCA**: Software Composition Analysis for dependency vulnerabilities
- **Container Security**: Docker and Kubernetes security scanning integration

### Authentication & Authorization Patterns

- Hardcoded credentials and secret management
- Weak session management and token handling
- Missing access controls and authorization checks
- JWT vulnerabilities and misconfiguration
- OAuth and SSO implementation flaws

### Input Validation Patterns

- SQL injection vulnerabilities in database queries
- Cross-site scripting (XSS) in user input handling
- Command injection in system calls
- Path traversal and directory traversal attacks
- LDAP injection and NoSQL injection vulnerabilities

### Cryptography Patterns

- Weak encryption algorithms (MD5, SHA1, DES)
- Insecure random number generation for security-critical operations
- Poor key management and hardcoded cryptographic keys
- Hash algorithm vulnerabilities and salt management
- Certificate validation issues and TLS misconfiguration

### Configuration Security Patterns

- Missing security headers (HSTS, CSP, X-Frame-Options)
- Insecure CORS policies and origin validation
- Debug mode enabled in production environments
- Verbose error messages exposing system information
- Default credentials and weak password policies

## Implementation Best Practices

### For Development Teams

1. **Regular Security Analysis:**

   ```bash
   # Weekly comprehensive security review
   @SecurityAnalyzer @security-scan

   # Pre-deployment security check
   @SecurityAnalyzer @owasp-audit

   # Focused vulnerability assessment
   @SecurityAnalyzer @vulnerability-check
   ```

2. **Risk-Based Issue Prioritization:**
   - **Critical (CVSS 9.0-10.0)**: Immediate response (within hours)
   - **High (CVSS 7.0-8.9)**: Within 1-2 days
   - **Medium (CVSS 4.0-6.9)**: Within 1 week
   - **Low (CVSS 0.1-3.9)**: Within 2 weeks

3. **Continuous Security Integration:**
   - Add automated security scans to CI/CD pipelines
   - Implement security testing at multiple stages
   - Regular penetration testing validation
   - Code review with security-focused checklists

4. **Use Specialized Commands for Targeted Analysis:**

   ```bash
   # Authentication security review
   @auth-review

   # Input validation assessment
   @input-validation

   # Cryptography implementation audit
   @crypto-audit

   # Compliance checking
   @compliance-check
   ```

### For Security Teams

1. **Comprehensive Security Monitoring:**
   - Track vulnerability trends and resolution metrics
   - Monitor security issue resolution times and patterns
   - Assess overall security posture improvements over time
   - Generate compliance reports using `@compliance-check`

2. **Advanced Risk Management:**
   - Use `@risk-assessment` for detailed CVSS scoring
   - Customize detection rules and severity classifications
   - Implement organization-specific security patterns
   - Configure compliance checks for regulatory requirements

3. **Security Knowledge Management:**
   - Provide comprehensive remediation guidance
   - Conduct regular security workshops and training
   - Maintain updated security documentation
   - Share threat intelligence and best practices

4. **Strategic Security Operations:**

   ```bash
   # Comprehensive threat modeling
   @threat-model

   # API security assessment
   @api-security

   # Infrastructure security review
   @config-security
   ```

## Troubleshooting

### Common Issues

**Issue**: Chat mode not responding
**Solution**: Ensure you're using the correct command format: `@SecurityAnalyzer @security-scan`

**Issue**: GitHub issues not being created
**Solution**: Check that the `GITHUB_TOKEN` has `issues: write` permissions

**Issue**: False positive detections
**Solution**: Review and customize security patterns in `.github/scripts/security_scanner.py`

**Issue**: Missing dependencies in workflow
**Solution**: Ensure all security tools are properly installed in the CI/CD environment

### Getting Help

- **Documentation**: Check this README and inline code comments
- **Issues**: Create a GitHub issue with the `question` label
- **Security Concerns**: Follow responsible disclosure practices

## Contributing

### Adding New Security Patterns

1. Edit `.github/scripts/security_scanner.py`
2. Add new patterns to the `patterns` dictionary
3. Include severity, CWE ID, and description
4. Test with sample code

### Improving Issue Templates

1. Edit `.github/scripts/create_security_issues.py`
2. Modify the issue body template
3. Add relevant labels and assignees
4. Test issue creation

### Extending Chat Mode Commands

1. Edit `.github/chatmodes/security-expert.chatmode.md`
2. Add new command descriptions
3. Update the command reference table
4. Document usage examples

## Security Considerations

- **Private Repositories**: Ensure sensitive code isn't exposed in issue descriptions
- **Access Control**: Limit security scan results to authorized team members
- **Audit Trail**: Maintain logs of security scans and remediation activities
- **Compliance**: Ensure scanning practices meet regulatory requirements

## License

This security analysis system is provided under the MIT License. Use responsibly and in accordance with your organization's security policies.
