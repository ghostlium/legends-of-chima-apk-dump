.class public Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;
.super Ljava/lang/Object;
.source "ServerCommunication.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-class v0, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method public static checkNetwork(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 264
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 265
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    if-nez v1, :cond_0

    .line 266
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Network is not available!"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 268
    :cond_0
    return-void
.end method

.method private static getAppName(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 174
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 177
    .local v2, "pm":Landroid/content/pm/PackageManager;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 182
    .local v0, "ai":Landroid/content/pm/ApplicationInfo;
    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v3

    :goto_1
    check-cast v3, Ljava/lang/String;

    check-cast v3, Ljava/lang/String;

    return-object v3

    .line 179
    .end local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    :catch_0
    move-exception v1

    .line 180
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v0, 0x0

    .restart local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    goto :goto_0

    .line 182
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method

.method private static getVersion(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 165
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    :goto_0
    return-object v1

    .line 166
    :catch_0
    move-exception v0

    .line 167
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v1, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to get verison info from app"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    const-string v1, "N/A"

    goto :goto_0
.end method

.method public static hasScopes(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)Ljava/util/Map;
    .locals 8
    .param p0, "atnToken"    # Ljava/lang/String;
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "scopes"    # [Ljava/lang/String;
    .param p3, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 226
    sget-object v5, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "hasScopes : appId="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", scopes="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    invoke-static {p3}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->checkNetwork(Landroid/content/Context;)V

    .line 232
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 234
    .local v4, "to_return":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Boolean;>;"
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 235
    .local v3, "scope":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 238
    .end local v3    # "scope":Ljava/lang/String;
    :cond_0
    return-object v4
.end method


# virtual methods
.method public authorize(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)V
    .locals 3
    .param p1, "atnToken"    # Ljava/lang/String;
    .param p2, "appId"    # Ljava/lang/String;
    .param p3, "scopes"    # [Ljava/lang/String;
    .param p4, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    sget-object v0, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "authorize : appId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", scopes="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    invoke-static {p4}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->checkNetwork(Landroid/content/Context;)V

    .line 57
    return-void
.end method

.method public deauthorize(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)V
    .locals 3
    .param p1, "atnToken"    # Ljava/lang/String;
    .param p2, "appId"    # Ljava/lang/String;
    .param p3, "scopes"    # [Ljava/lang/String;
    .param p4, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    sget-object v0, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deauthorize : appId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", scopes="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    invoke-static {p4}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->checkNetwork(Landroid/content/Context;)V

    .line 77
    return-void
.end method

.method public getAccessAuthorizationToken(Lcom/amazon/identity/auth/device/token/RefreshAtzToken;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    .locals 12
    .param p1, "refreshAtzToken"    # Lcom/amazon/identity/auth/device/token/RefreshAtzToken;
    .param p2, "directedId"    # Ljava/lang/String;
    .param p3, "appId"    # Ljava/lang/String;
    .param p4, "scopes"    # [Ljava/lang/String;
    .param p5, "clientId"    # Ljava/lang/String;
    .param p6, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 91
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getAccessAuthorizationToken : appId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", scopes="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static/range {p4 .. p4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    invoke-static/range {p6 .. p6}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->checkNetwork(Landroid/content/Context;)V

    .line 96
    invoke-static/range {p6 .. p6}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->getAppName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 97
    .local v1, "appName":Ljava/lang/String;
    invoke-static/range {p6 .. p6}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->getVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 98
    .local v2, "version":Ljava/lang/String;
    new-instance v0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;

    const-string v3, "1.0.0"

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    move-object v5, p3

    move-object/from16 v6, p6

    move-object v7, p1

    move-object/from16 v8, p5

    invoke-direct/range {v0 .. v8}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/Context;Lcom/amazon/identity/auth/device/token/RefreshAtzToken;Ljava/lang/String;)V

    .line 100
    .local v0, "request":Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;
    :try_start_0
    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;->submit()Lcom/amazon/identity/auth/device/endpoint/TokenResponse;

    move-result-object v11

    check-cast v11, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;

    .line 101
    .local v11, "response":Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;
    invoke-virtual {v11}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->parse()V

    .line 102
    invoke-virtual {v11}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->getAccessAtzToken()Lcom/amazon/identity/auth/device/token/AccessAtzToken;
    :try_end_0
    .catch Lcom/amazon/identity/auth/device/InvalidGrantAuthError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 103
    .local v9, "accessAtzToken":Lcom/amazon/identity/auth/device/token/AccessAtzToken;
    return-object v9

    .line 105
    .end local v9    # "accessAtzToken":Lcom/amazon/identity/auth/device/token/AccessAtzToken;
    .end local v11    # "response":Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;
    :catch_0
    move-exception v10

    .line 107
    .local v10, "e":Lcom/amazon/identity/auth/device/InvalidGrantAuthError;
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Invalid grant request given to the server. Cleaning up local state"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    invoke-static/range {p6 .. p6}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->clearAuthorizationState(Landroid/content/Context;)V

    .line 109
    throw v10
.end method

.method public getAuthorizationTokens(Lcom/amazon/identity/auth/device/token/RefreshAtzToken;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)[Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    .locals 11
    .param p1, "refreshAtzToken"    # Lcom/amazon/identity/auth/device/token/RefreshAtzToken;
    .param p2, "directedId"    # Ljava/lang/String;
    .param p3, "appId"    # Ljava/lang/String;
    .param p4, "scopes"    # [Ljava/lang/String;
    .param p5, "clientId"    # Ljava/lang/String;
    .param p6, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 114
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getAccessAuthorizationToken : appId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", scopes="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    invoke-static/range {p6 .. p6}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->checkNetwork(Landroid/content/Context;)V

    .line 119
    invoke-static/range {p6 .. p6}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->getAppName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 120
    .local v1, "appName":Ljava/lang/String;
    invoke-static/range {p6 .. p6}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->getVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 121
    .local v2, "version":Ljava/lang/String;
    new-instance v0, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;

    const-string v3, "1.0.0"

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    move-object v5, p3

    move-object/from16 v6, p6

    move-object v7, p1

    move-object/from16 v8, p5

    invoke-direct/range {v0 .. v8}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/Context;Lcom/amazon/identity/auth/device/token/RefreshAtzToken;Ljava/lang/String;)V

    .line 123
    .local v0, "request":Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;
    :try_start_0
    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenRequest;->submit()Lcom/amazon/identity/auth/device/endpoint/TokenResponse;

    move-result-object v10

    check-cast v10, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;

    .line 124
    .local v10, "response":Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;
    invoke-virtual {v10}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->parse()V

    .line 125
    invoke-virtual {v10}, Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;->getAtzTokens()[Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    :try_end_0
    .catch Lcom/amazon/identity/auth/device/InvalidGrantAuthError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    return-object v3

    .line 127
    .end local v10    # "response":Lcom/amazon/identity/auth/device/endpoint/OauthTokenResponse;
    :catch_0
    move-exception v9

    .line 129
    .local v9, "e":Lcom/amazon/identity/auth/device/InvalidGrantAuthError;
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Invalid grant request given to the server. Cleaning up local state"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    invoke-static/range {p6 .. p6}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->clearAuthorizationState(Landroid/content/Context;)V

    .line 131
    throw v9
.end method

.method public getDeviceId(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 249
    sget-object v0, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getDeviceId : appId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    invoke-static {p2}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->checkNetwork(Landroid/content/Context;)V

    .line 255
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProfile(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "authzToken"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 292
    invoke-static {p1}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->checkNetwork(Landroid/content/Context;)V

    .line 294
    new-instance v0, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;

    invoke-static {p1}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->getAppName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->getVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "1.0.0"

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    move-object v5, p2

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/Context;)V

    .line 295
    .local v0, "request":Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;
    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/endpoint/ProfileRequest;->submit()Lcom/amazon/identity/auth/device/endpoint/TokenResponse;

    move-result-object v7

    check-cast v7, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;

    .line 296
    .local v7, "response":Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;
    invoke-virtual {v7}, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;->parse()V

    .line 297
    invoke-virtual {v7}, Lcom/amazon/identity/auth/device/endpoint/ProfileResponse;->getProfileResponse()Lorg/json/JSONObject;

    move-result-object v1

    return-object v1
.end method

.method public getTokensFromCode(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)[Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    .locals 11
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "clientId"    # Ljava/lang/String;
    .param p3, "redirectUri"    # Ljava/lang/String;
    .param p4, "appId"    # Ljava/lang/String;
    .param p5, "scopes"    # [Ljava/lang/String;
    .param p6, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 148
    sget-object v3, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getAccessAuthorizationToken : appId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", scopes="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static/range {p5 .. p5}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    invoke-static/range {p6 .. p6}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->checkNetwork(Landroid/content/Context;)V

    .line 153
    invoke-static/range {p6 .. p6}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->getAppName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 154
    .local v1, "appName":Ljava/lang/String;
    invoke-static/range {p6 .. p6}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->getVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 155
    .local v2, "version":Ljava/lang/String;
    new-instance v0, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;

    const-string v3, "1.0.0"

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    move-object v5, p1

    move-object v6, p2

    move-object v7, p4

    move-object v8, p3

    move-object/from16 v9, p6

    invoke-direct/range {v0 .. v9}, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 156
    .local v0, "request":Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;
    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenRequest;->submit()Lcom/amazon/identity/auth/device/endpoint/TokenResponse;

    move-result-object v10

    check-cast v10, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenResponse;

    .line 157
    .local v10, "response":Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenResponse;
    invoke-virtual {v10}, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenResponse;->parse()V

    .line 158
    invoke-virtual {v10}, Lcom/amazon/identity/auth/device/endpoint/OauthCodeForTokenResponse;->getAtzTokens()[Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;

    move-result-object v3

    return-object v3
.end method

.method public hasScope(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/Boolean;
    .locals 3
    .param p1, "atnToken"    # Ljava/lang/String;
    .param p2, "appId"    # Ljava/lang/String;
    .param p3, "scope"    # Ljava/lang/String;
    .param p4, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    sget-object v0, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "hasScope : appId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", scope="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    invoke-static {p4}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->checkNetwork(Landroid/content/Context;)V

    .line 206
    const/4 v0, 0x0

    return-object v0
.end method
