# Dynamic Authentication Setup

This Jekyll site implements a **dynamic token-based authentication system** that automatically detects any number of `APP_KEY_*` tokens.

## ✨ Dynamic Token Detection

The system automatically discovers all environment variables that start with `APP_KEY_*` - no need to hardcode token names!

### Local Development

1. **Create `.env` file** with any number of `APP_KEY_*` tokens:
   ```env
   # Site authentication tokens - ADD AS MANY AS YOU WANT!
   # Do not commit this file to Git
   APP_KEY_A=token1
   APP_KEY_B=token2
   APP_KEY_C=token3
   APP_KEY_D=token4
   APP_KEY_E=token5
   APP_KEY_ADMIN=admin123
   APP_KEY_GUEST=guest456
   APP_KEY_USER=user789
   APP_KEY_TEST=test000
   # Add more APP_KEY_* variables as needed!
   ```

2. **Automatic injection** happens via the `scripts/load-env.rb` script:
   - **Dynamically finds** all `APP_KEY_*` variables in `.env`
   - Creates `_config_secrets.yml` with Jekyll-compatible format
   - Maps environment variables to Jekyll config variables
   - **Reports how many tokens were found**

3. **Run locally**:
   ```bash
   ./serve.sh
   ```
   This automatically:
   - Runs `ruby scripts/load-env.rb` to detect and load ALL `APP_KEY_*` variables
   - Starts Jekyll with both config files: `_config.yml,_config_secrets.yml`

### Production (GitHub Actions)

1. **GitHub Secrets**: Add any `APP_KEY_*` secrets in your repository settings:
   - `APP_KEY_A` = your first token
   - `APP_KEY_B` = your second token
   - `APP_KEY_ADMIN` = admin token
   - `APP_KEY_GUEST` = guest token
   - **Add as many as you need!**

2. **Update GitHub Actions workflow** (`.github/workflows/pages.yml`):
   - The workflow uses `scripts/create-secrets-config.sh` to dynamically detect tokens
   - **You only need to add new secrets to the `env:` section of the workflow**
   - The script automatically finds and processes all `APP_KEY_*` environment variables

## File Structure

```
├── .env                    # Local environment variables (not committed)
├── _config.yml            # Main Jekyll config (empty auth keys)
├── _config_secrets.yml    # Generated secrets config (not committed)
├── scripts/load-env.rb    # Script to load .env into Jekyll format
├── serve.sh               # Local development script
└── login.html             # Authentication page
```

## 🚀 How The Dynamic System Works

1. **Token Discovery**: Scripts automatically scan for `APP_KEY_*` patterns
2. **Dynamic Injection**: All found tokens are injected into Jekyll at build time
3. **Client-side Detection**: The login page dynamically collects all available tokens
4. **Scalable Authentication**: Add new tokens without changing code - just environment variables!

### Adding New Tokens

**Local Development:**
```bash
# Just add to .env file - NO CODE CHANGES NEEDED!
echo "APP_KEY_NEWUSER=newtoken123" >> .env
./serve.sh  # Automatically detected and available for login!
```

**Production:**
1. Add `APP_KEY_NEWUSER` secret in GitHub repository settings
2. Add `APP_KEY_NEWUSER: ${{ secrets.APP_KEY_NEWUSER }}` to the workflow's `env:` section
3. Deploy - token is automatically available!

**✨ The Magic**: The system uses a single `auth_tokens` variable that contains all tokens comma-separated, eliminating the need to manually update `login.html` for each new token!

### Current System Status

✅ **6 tokens detected** in current `.env`:
- `APP_KEY_CTO=cto_secure_token`
- `APP_KEY_GEST=gest_secure_token`
- `APP_KEY_QAA=qaa_secure_token`
- `APP_KEY_QAM=qam_secure_token`
- `APP_KEY_NEWUSER=newuser_token_123`
- `APP_KEY_MARKETING=marketing_super_secret`

🚀 **FULLY DYNAMIC**: The `login.html` file automatically detects ALL tokens without manual updates!

## Security Notes

- Tokens are injected at build time, not runtime
- `.env` and `_config_secrets.yml` are both gitignored
- GitHub Secrets are encrypted and only accessible during build
- System automatically scales without code changes
- Client-side validation is for convenience - real security should implement server-side validation 