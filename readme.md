# TF DEPLOY
The purpose of this repo is to create a PoC of two potential semi self serve strategies for resources in dbt cloud. 
The final outcome should be similar: a project created in dbtcloud with name XXX and environment YYY.

Approaches:
1. Branch:
   1. Create a branch.
   2. Add a config file to the branch (prerelease__project_name__env).
   3. Push the changes.
   4. GH action will trigger and will:
      1. Create a new branch from main with the name of the project and environment (release__project_name__env).
      2. Start a pull request from prerelease into release.
      3. Trigger an action on PR to validate the TF file.
      4. Next add a TF plan that is saved as an artifact and exposed in the PR comment.
      5. Upon approval, retrieve the artifact and run a new TF to apply that plan.
      6. Comment on the PR with the outcome and close the PR.
2. Issues:
   1. Create an issue that has the config as a yaml block.
   2. Upon appropriate labelling: GH action to Plan and comment the issue.
   3. Upon review and label change, GH action to Apply the configuration.
   4. Upon adding Destroy label, GH action to destroy the configuration.