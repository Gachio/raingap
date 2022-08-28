# raingap
the remote backend for this bucket uses server-side encryption
Certain parameters has been omitted from the backend configuration in this terraform code.
Pass it in via -backend-config command-line arguments when calling terraform init
To put all the partial configurations together, run terraform init with the -backend-config argument
