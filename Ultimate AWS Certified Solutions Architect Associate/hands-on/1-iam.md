Login to console with email + password

Go to IAM console - https://console.aws.amazon.com/iam/hom

Thinks we need to do to make our account secure:

1. Delete your root access keys
    
    Delete your AWS root account access keys, because they provide unrestricted access to your AWS resources. 
    
    Instead, use IAM user access keys or temporary security credentials.
    
    1. Go to Security Credentials - https://console.aws.amazon.com/iam/home?#/security_credentials
        
        Here we will see all the credentials for our AWS account:
        - Password
        - MFA
        - Access keys
        - CloudFront key pairs
        - X.509 certificate
        - Account identifiers
    
    2. Under Access keys, select the ones created, and click `Delete`
    
2. Activate MFA on your root account
    
    Activate multi-factor authentication (MFA) on your AWS root account to add another layer of protection to help keep your account secure.

    1. Go to Security Credentials, under Multi-factor authentication (MFA)
        
        Use MFA to increase the security of your AWS environments. Signing in to MFA-protected accounts requires a user name, password, and an authentication code from an MFA device.

    2. Click `Activate MFA`
    3. Set up a Virtual Device Authenticator, we will use LastPass Authenticator
    4. `The MFA was successfully authenticated` - Now our root account is protected by a multi-factor authentication.
    
3. Create individual IAM users

    Create IAM users and give them only the permissions they need. Do not use your AWS root account for day-to-day interaction with AWS, because the root account provides unrestricted access to your AWS resources.
    
    1. Go to Manage Users - https://console.aws.amazon.com/iam/home?#/users
    2. Click on `Create new user`
    3. Give a name to your super user
    4. Give Programmatic and Management console access to your user.
    5. Under `Set permissions`, attach `AdministratorAccess` Policy.
    
        - Attached policy AdministratorAccess to user florencia
        - Attached policy IAMUserChangePassword to user florencia
        - Created access key for user florencia
        - Created login profile for user florencia

4. Use groups to assign permissions

    Use IAM groups to assign permissions to your IAM users to simplify managing and auditing permissions in your account.

    1. Go to Groups - https://console.aws.amazon.com/iam/home?#/groups
    2. `Create new group`
    3. Group Name: `admin`
    4. Attach policies: `AdministratorAcces`
    5. Create Group
    6. Go to the recently created `admin` Group
    7. `Add users to Group` and add user `florencia`
   
        Now Florencia is part of the admin group, and will inherit the permissions of this group.

    8. Go to `florencia` user and detach associated policies
        
        This way, policies are more manageable. Now the `AdministratorAccess` has been provided through the group.
    
5. Apply an IAM password policy
    
    Use a password policy to require your IAM users to create strong passwords and to rotate their passwords regularly.
    
    1. Go to Account setting - https://console.aws.amazon.com/iam/home?#/account_settings
    2. Find Password policy, and click on `Set password policy`
    3. Here we can: 
        - Enforce minimum password length
        - Require special characters (nums, upper lowe letters, non-alphanumeric characters)
        - Enable password expiration
        - Allow users to change their own password
        - Prevent password reuse
        
**Now we are good to go!**

6. Create an account alias:
    1. In the IAM Console, click on `customize`
    2. Select the name of your account
    
7. Log in with the newly created user `florencia`
8. Change the password
