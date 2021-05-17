.class Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;
.super Lcom/amazon/identity/auth/device/endpoint/AbstractJSONTokenResponse;
.source "OauthTokenResponse.java"


# static fields
.field static final AUTHZ_ACCESS_TOKEN:Ljava/lang/String; = "access_token"

.field static final AUTHZ_ERROR_DESCIRPTION:Ljava/lang/String; = "error_description"

.field static final AUTHZ_INSUFFICIENT_SCOPE:Ljava/lang/String; = "insufficient_scope"

.field static final AUTHZ_INVALID_CLIENT:Ljava/lang/String; = "invalid_client"

.field static final AUTHZ_INVALID_GRANT:Ljava/lang/String; = "invalid_grant"

.field static final AUTHZ_INVALID_REQUEST:Ljava/lang/String; = "invalid_request"

.field static final AUTHZ_INVALID_SCOPE:Ljava/lang/String; = "invalid_scope"

.field static final AUTHZ_INVALID_TOKEN:Ljava/lang/String; = "invalid_token"

.field static final AUTHZ_UNAUTHORIZED_CLIENT:Ljava/lang/String; = "unauthorized_client"

.field static final AUTHZ_UNSUPPORTED_GRANT_TYPE:Ljava/lang/String; = "unsupported_grant_type"

.field private static final LOG_TAG:Ljava/lang/String;

.field private static final REQUEST_ID_HEADER:Ljava/lang/String; = "x-amzn-RequestId"


# instance fields
.field protected mAccessToken:Lcom/amazon/identity/auth/device/token/AccessAtzToken;

.field private final mAppFamilyId:Ljava/lang/String;

.field private mRefreshToken:Lcom/amazon/identity/auth/device/token/RefreshAtzToken;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lorg/apache/http/HttpResponse;Ljava/lang/String;)V
    .locals 1
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "appFamilyId"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/amazon/identity/auth/device/endpoint/AbstractJSONTokenResponse;-><init>(Lorg/apache/http/HttpResponse;)V

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->mRefreshToken:Lcom/amazon/identity/auth/device/token/RefreshAtzToken;

    .line 60
    iput-object p2, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->mAppFamilyId:Ljava/lang/String;

    .line 61
    return-void
.end method


# virtual methods
.method public createPrimaryToken(Ljava/lang/String;J)Lcom/amazon/identity/auth/device/token/Token;
    .locals 7
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "expiresIn"    # J

    .prologue
    const/4 v2, 0x0

    .line 78
    new-instance v0, Lcom/amazon/identity/auth/device/token/AccessAtzToken;

    iget-object v1, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->mAppFamilyId:Ljava/lang/String;

    move-object v3, p1

    move-wide v4, p2

    move-object v6, v2

    invoke-direct/range {v0 .. v6}, Lcom/amazon/identity/auth/device/token/AccessAtzToken;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J[B)V

    return-object v0
.end method

.method protected doParse(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "jResponse"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 72
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->extractAccessAtzToken(Lorg/json/JSONObject;)Lcom/amazon/identity/auth/device/token/AccessAtzToken;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->mAccessToken:Lcom/amazon/identity/auth/device/token/AccessAtzToken;

    .line 73
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->extractRefreshAtzToken(Lorg/json/JSONObject;)Lcom/amazon/identity/auth/device/token/RefreshAtzToken;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->mRefreshToken:Lcom/amazon/identity/auth/device/token/RefreshAtzToken;

    .line 74
    return-void
.end method

.method public extractAccessAtzToken(Lorg/json/JSONObject;)Lcom/amazon/identity/auth/device/token/AccessAtzToken;
    .locals 7
    .param p1, "jResponse"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 86
    :try_start_0
    const-string v4, "access_token"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 87
    const-string v4, "access_token"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 99
    .local v3, "tokenVal":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->getExpiresIn(Lorg/json/JSONObject;)J

    move-result-wide v1

    .line 100
    .local v1, "expiresIn":J
    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/token/AbstractToken;->secsToMillis(J)J

    move-result-wide v4

    invoke-virtual {p0, v3, v4, v5}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->createPrimaryToken(Ljava/lang/String;J)Lcom/amazon/identity/auth/device/token/Token;

    move-result-object v4

    check-cast v4, Lcom/amazon/identity/auth/device/token/AccessAtzToken;

    return-object v4

    .line 91
    .end local v1    # "expiresIn":J
    .end local v3    # "tokenVal":Ljava/lang/String;
    :cond_0
    :try_start_1
    sget-object v4, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Unable to find AccessAtzToken in JSON response, throwing AuthError"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    new-instance v4, Lcom/amazon/identity/auth/device/AuthError;

    const-string v5, "JSON response did not contain an AccessAtzToken"

    sget-object v6, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_JSON:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v4, v5, v6}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v4
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 94
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Lorg/json/JSONException;
    sget-object v4, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Error reading JSON response, throwing AuthError"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    new-instance v4, Lcom/amazon/identity/auth/device/AuthError;

    const-string v5, "Error reading JSON response"

    sget-object v6, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_JSON:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v4, v5, v6}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v4
.end method

.method public extractRefreshAtzToken(Lorg/json/JSONObject;)Lcom/amazon/identity/auth/device/token/RefreshAtzToken;
    .locals 6
    .param p1, "jResponse"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 105
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Extracting RefreshToken"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    :try_start_0
    const-string v3, "refresh_token"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 108
    const-string v2, "refresh_token"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 109
    .local v1, "tokenVal":Ljava/lang/String;
    new-instance v2, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->getAppFamilyId()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v1, v5}, Lcom/amazon/identity/auth/device/token/RefreshAtzToken;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)V

    .line 114
    .end local v1    # "tokenVal":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 113
    :cond_0
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Unable to find RefreshAtzToken in JSON response"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 116
    :catch_0
    move-exception v0

    .line 118
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Error reading JSON response, throwing AuthError"

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    new-instance v2, Lcom/amazon/identity/auth/device/AuthError;

    const-string v3, "Error reading JSON response"

    sget-object v4, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_JSON:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v2, v3, v4}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v2
.end method

.method protected extractResponseJSONObject(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 3
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 157
    :try_start_0
    invoke-super {p0, p1}, Lcom/amazon/identity/auth/device/endpoint/AbstractJSONTokenResponse;->extractResponseJSONObject(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    .line 163
    .end local p1    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    return-object p1

    .line 159
    .restart local p1    # "jsonObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 161
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    const-string v2, "No Response type in the response"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getAccessAtzToken()Lcom/amazon/identity/auth/device/token/AccessAtzToken;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->mAccessToken:Lcom/amazon/identity/auth/device/token/AccessAtzToken;

    return-object v0
.end method

.method public getAppFamilyId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->mAppFamilyId:Ljava/lang/String;

    return-object v0
.end method

.method public getAtzTokens()[Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    .locals 3

    .prologue
    .line 143
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->mAccessToken:Lcom/amazon/identity/auth/device/token/AccessAtzToken;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->mRefreshToken:Lcom/amazon/identity/auth/device/token/RefreshAtzToken;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getRefreshAtzToken()Lcom/amazon/identity/auth/device/token/RefreshAtzToken;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->mRefreshToken:Lcom/amazon/identity/auth/device/token/RefreshAtzToken;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 277
    const-string v0, "1.0.0"

    return-object v0
.end method

.method handleInvalidToken(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "jResponse"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/InvalidTokenAuthError;
        }
    .end annotation

    .prologue
    .line 270
    const-string v0, "Invalid Token in exchange."

    .line 271
    .local v0, "msg":Ljava/lang/String;
    sget-object v1, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "info="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    new-instance v1, Lcom/amazon/identity/auth/device/InvalidTokenAuthError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/amazon/identity/auth/device/InvalidTokenAuthError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected handleJSONError(Lorg/json/JSONObject;)V
    .locals 7
    .param p1, "jResponse"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 168
    const/4 v2, 0x0

    .line 170
    .local v2, "error":Ljava/lang/String;
    :try_start_0
    const-string v4, "error"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 171
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 172
    const-string v4, "error_description"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 174
    .local v0, "description":Ljava/lang/String;
    invoke-virtual {p0, v2, v0}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->isInvalidGrant(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 176
    const-string v3, "Invalid source authorization in exchange."

    .line 177
    .local v3, "msg":Ljava/lang/String;
    sget-object v4, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "info="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v3, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    new-instance v4, Lcom/amazon/identity/auth/device/InvalidGrantAuthError;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/amazon/identity/auth/device/InvalidGrantAuthError;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 209
    .end local v0    # "description":Ljava/lang/String;
    .end local v3    # "msg":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 210
    .local v1, "e":Lorg/json/JSONException;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 211
    new-instance v4, Lcom/amazon/identity/auth/device/AuthError;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Server Error : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_SERVER_REPSONSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v4, v5, v6}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v4

    .line 180
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v0    # "description":Ljava/lang/String;
    :cond_0
    :try_start_1
    invoke-virtual {p0, v2, v0}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->isInvalidToken(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 182
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->handleInvalidToken(Lorg/json/JSONObject;)V

    .line 214
    .end local v0    # "description":Ljava/lang/String;
    :cond_1
    return-void

    .line 184
    .restart local v0    # "description":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0, v2, v0}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->isInvalidClient(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 186
    const-string v3, "Invalid Client. ApiKey is invalid "

    .line 187
    .restart local v3    # "msg":Ljava/lang/String;
    sget-object v4, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "info="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v3, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    new-instance v4, Lcom/amazon/identity/auth/device/AuthError;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_CLIENT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v4, v5, v6}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v4

    .line 190
    .end local v3    # "msg":Ljava/lang/String;
    :cond_3
    invoke-virtual {p0, v2, v0}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->isInvalidScope(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    invoke-virtual {p0, v2, v0}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->isInsufficientScope(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 192
    :cond_4
    const-string v3, "Invalid Scope. Authorization not valid for the requested scopes "

    .line 193
    .restart local v3    # "msg":Ljava/lang/String;
    sget-object v4, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "info="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v3, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    new-instance v4, Lcom/amazon/identity/auth/device/AuthError;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_SCOPE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v4, v5, v6}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v4

    .line 196
    .end local v3    # "msg":Ljava/lang/String;
    :cond_5
    invoke-virtual {p0, v2, v0}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->isUnauthorizedClient(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 198
    const-string v3, "Unauthorizaied Client.  The authenticated client is not authorized to use this authorization grant type. "

    .line 199
    .restart local v3    # "msg":Ljava/lang/String;
    sget-object v4, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "info="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v3, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    new-instance v4, Lcom/amazon/identity/auth/device/AuthError;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_UNAUTHORIZED_CLIENT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v4, v5, v6}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v4

    .line 204
    .end local v3    # "msg":Ljava/lang/String;
    :cond_6
    const-string v3, "Server error doing authorization exchange. "

    .line 205
    .restart local v3    # "msg":Ljava/lang/String;
    sget-object v4, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "info="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v3, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    new-instance v4, Lcom/amazon/identity/auth/device/AuthError;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_SERVER_REPSONSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v4, v5, v6}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v4
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
.end method

.method isInsufficientScope(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 238
    const-string v0, "insufficient_scope"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method isInvalidClient(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 228
    const-string v0, "invalid_client"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method isInvalidGrant(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 233
    const-string v0, "invalid_grant"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "unsupported_grant_type"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isInvalidScope(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 223
    const-string v0, "invalid_scope"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method isInvalidToken(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 243
    const-string v0, "invalid_token"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "invalid_request"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "access_token"

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isUnauthorizedClient(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 218
    const-string v0, "unauthorized_client"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected logRequestId(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "jHttpResponse"    # Lorg/json/JSONObject;

    .prologue
    .line 254
    invoke-super {p0, p1}, Lcom/amazon/identity/auth/device/endpoint/AbstractJSONTokenResponse;->logRequestId(Lorg/json/JSONObject;)V

    .line 255
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->getResponse()Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 257
    .local v1, "response":Lorg/apache/http/HttpResponse;
    const-string v2, "x-amzn-RequestId"

    invoke-interface {v1, v2}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 258
    .local v0, "header":Lorg/apache/http/Header;
    if-eqz v0, :cond_0

    .line 260
    sget-object v2, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    const-string v3, "ExchangeRepsonse"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "requestId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    :goto_0
    return-void

    .line 264
    :cond_0
    sget-object v2, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->LOG_TAG:Ljava/lang/String;

    const-string v3, "No RequestId in headers"

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public testParse(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "jResponse"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 66
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->doParse(Lorg/json/JSONObject;)V

    .line 67
    return-void
.end method
