# Terraform: Best Practices

*Terraform is tool which allows to manage infrastructure as code. It does not restrict developers from doing things in ways which will be hard to support and integrate with.*

**Best practices for teraform:**

- Decompose Terraform code to maximize reuse.
- Keep environment implementation code and modules separate.
- Use one state per environment.
- Plan outputs before allowing changes to be applied to an environment.
- Have a strict policy of reviewing Terraform validate.
- Use an automated testing framework for unit testing.
- Use a CI or CD to execute Terraform operations from a common location.
- Manipulate state by commands.
- Back up your state files.