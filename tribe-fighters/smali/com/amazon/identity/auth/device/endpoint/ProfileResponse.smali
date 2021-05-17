.class public Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;
.super Lcom/amazon/identity/auth/device/endpoint/AbstractJSONTokenResponse;
.source "ProfileResponse.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field private profileResponse:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/HttpResponse;)V
    .locals 0
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/amazon/identity/auth/device/endpoint/AbstractJSONTokenResponse;-><init>(Lorg/apache/http/HttpResponse;)V

    .line 33
    return-void
.end method

.method private isInsufficientScope(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 91
    const-string v0, "insufficient_scope"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isInvalidToken(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 96
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


# virtual methods
.method public createPrimaryToken(Ljava/lang/String;J)Lcom/amazon/identity/auth/device/token/Token;
    .locals 1
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "expiresIn"    # J

    .prologue
    .line 45
    const/4 v0, 0x0

    return-object v0
.end method

.method protected doParse(Lorg/json/JSONObject;)V
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
    .line 38
    iput-object p1, p0, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;->profileResponse:Lorg/json/JSONObject;

    .line 40
    return-void
.end method

.method protected extractResponseJSONObject(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 0
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 27
    return-object p1
.end method

.method public getProfileResponse()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;->profileResponse:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    const-string v0, "1.0.0"

    return-object v0
.end method

.method protected handleJSONError(Lorg/json/JSONObject;)V
    .locals 7
    .param p1, "jResponse"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 55
    const/4 v2, 0x0

    .line 58
    .local v2, "error":Ljava/lang/String;
    :try_start_0
    const-string v3, "error"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 59
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 61
    const-string v3, "error_description"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "description":Ljava/lang/String;
    invoke-direct {p0, v2, v0}, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;->isInsufficientScope(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 65
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Insufficient scope in token in exchange."

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "info="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    new-instance v3, Lcom/amazon/identity/auth/device/AuthError;

    const-string v4, "Insufficient Scope. Authorization not valid for the requested scopes"

    sget-object v5, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_SCOPE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v3, v4, v5}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .end local v0    # "description":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 82
    .local v1, "e":Lorg/json/JSONException;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 84
    new-instance v3, Lcom/amazon/identity/auth/device/AuthError;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Server Error : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_SERVER_REPSONSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v3, v4, v5}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v3

    .line 68
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v0    # "description":Ljava/lang/String;
    :cond_0
    :try_start_1
    invoke-direct {p0, v2, v0}, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;->isInvalidToken(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 70
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Invalid Token in exchange."

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "info="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    new-instance v3, Lcom/amazon/identity/auth/device/InvalidTokenAuthError;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid Token in exchange. "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/amazon/identity/auth/device/InvalidTokenAuthError;-><init>(Ljava/lang/String;)V

    throw v3

    .line 75
    :cond_1
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Server error doing authorization exchange."

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "info="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    new-instance v3, Lcom/amazon/identity/auth/device/AuthError;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Server error doing authorization exchange. "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_SERVER_REPSONSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v3, v4, v5}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v3
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 87
    .end local v0    # "description":Ljava/lang/String;
    :cond_2
    return-void
.end method
