# GitHub Secrets Configuration

## 🔑 Configure Production Tokens

To enable authentication in production, add these secrets to your GitHub repository:

### Step 1: Go to Repository Settings
1. Navigate to: `https://github.com/qahivelab/promptlab`
2. Click **Settings** tab
3. Click **Secrets and variables** → **Actions**

### Step 2: Add Repository Secrets
Click **New repository secret** for each of these:

```
Name: APP_KEY_CTO
Value: 17397345DCB2C9D88FEDDAADC131D

Name: APP_KEY_GEST
Value: 78A1F8C2A28FC1AF3CED61DDC1F28

Name: APP_KEY_QAA
Value: C252CE96658ADFCEECB8FBBEC3A5C

Name: APP_KEY_QAM
Value: 3BB33A72CE24F9E4B1CA991D54E6E
```

### Step 3: Trigger Deployment
After adding all secrets:
1. Go to **Actions** tab
2. Click **Deploy Jekyll site to Pages**
3. Click **Run workflow** → **Run workflow**

### Step 4: Test Production
Once deployment completes (2-3 minutes), test at:
`https://qahivelab.github.io/promptlab/`

## ✅ Token Mapping
- **CTO**: `17397345DCB2C9D88FEDDAADC131D`
- **GEST**: `78A1F8C2A28FC1AF3CED61DDC1F28`
- **QAA**: `C252CE96658ADFCEECB8FBBEC3A5C`
- **QAM**: `3BB33A72CE24F9E4B1CA991D54E6E`

## 🔄 Adding More Tokens Later
To add new users, simply:
1. Add new GitHub Secret: `APP_KEY_NEWUSER=your_token_value`
2. Trigger new deployment
3. **No code changes needed!** ✨ 