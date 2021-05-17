.class public Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;
.super Ljava/lang/Object;
.source "AuthorizationHelper.java"


# static fields
.field private static final HOST_TYPE:Ljava/lang/String; = "host.type"

.field private static final HTTPS:Ljava/lang/String; = "https"

.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field private mTokenVendor:Lcom/amazon/identity/auth/device/endpoint/TokenVendor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const-class v0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Lcom/amazon/identity/auth/device/endpoint/TokenVendor;

    invoke-direct {v0}, Lcom/amazon/identity/auth/device/endpoint/TokenVendor;-><init>()V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->mTokenVendor:Lcom/amazon/identity/auth/device/endpoint/TokenVendor;

    .line 49
    return-void
.end method

.method static synthetic access$000(Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/UUID;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # [Ljava/lang/String;
    .param p5, "x5"    # Ljava/util/UUID;
    .param p6, "x6"    # Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 41
    invoke-direct/range {p0 .. p6}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->authorizeWithBrowser(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/UUID;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;
    .param p5, "x5"    # [Ljava/lang/String;
    .param p6, "x6"    # Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    .prologue
    .line 41
    invoke-direct/range {p0 .. p6}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->startExchange(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V

    return-void
.end method

.method private authorizeWithBrowser(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/UUID;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "clientId"    # Ljava/lang/String;
    .param p4, "scopes"    # [Ljava/lang/String;
    .param p5, "requestId"    # Ljava/util/UUID;
    .param p6, "listener"    # Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 144
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {p5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;-><init>(Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V

    .line 145
    .local v0, "callbackInfo":Lcom/amazon/identity/auth/device/authorization/CallbackInfo;
    invoke-static {v0}, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;->addCallbackInfo(Lcom/amazon/identity/auth/device/authorization/CallbackInfo;)V

    .line 146
    invoke-virtual {p5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v1 .. v6}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getOAuth2Url(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    .line 147
    .local v7, "oauth2Url":Ljava/lang/String;
    new-instance v8, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v8, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 149
    .local v8, "webBrowserIntent":Landroid/content/Intent;
    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v8, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 150
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Starting External Browser"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    invoke-virtual {p1, v8}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 152
    return-void
.end method

.method private getCommonScopesForAuthorization(Landroid/content/Context;[Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "requestedScopes"    # [Ljava/lang/String;
    .param p4, "appId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "[",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/identity/auth/device/dataobject/RequestedScope;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 165
    .local p3, "cachedScopes":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/identity/auth/device/dataobject/RequestedScope;>;"
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 166
    .local v4, "requestedScopesList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 167
    .local v2, "commonScopes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 169
    if-eqz p3, :cond_1

    .line 171
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;

    .line 173
    .local v0, "cachedScope":Lcom/amazon/identity/auth/device/dataobject/RequestedScope;
    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->getScopeValue()Ljava/lang/String;

    move-result-object v1

    .line 174
    .local v1, "cachedScopeName":Ljava/lang/String;
    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 176
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 180
    .end local v0    # "cachedScope":Lcom/amazon/identity/auth/device/dataobject/RequestedScope;
    .end local v1    # "cachedScopeName":Ljava/lang/String;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_1
    return-object v2
.end method

.method private static getEndPoint()Ljava/lang/String;
    .locals 1

    .prologue
    .line 366
    const-string v0, "/ap/oa"

    return-object v0
.end method

.method private static getHost(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 361
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0, p1}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getHostType(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".amazon.com"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getHostType(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 405
    const-string v2, "www"

    .line 409
    .local v2, "hostType":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v3, p1, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 410
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v3, :cond_0

    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v4, "host.type"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 412
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v4, "host.type"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 413
    sget-object v3, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Host Type"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "hostType="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " package="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 419
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_0
    :goto_0
    return-object v2

    .line 415
    :catch_0
    move-exception v1

    .line 417
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v3, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No host type found in package "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getOAuth2Url(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "clientId"    # Ljava/lang/String;
    .param p3, "scopes"    # [Ljava/lang/String;
    .param p4, "requestId"    # Ljava/lang/String;
    .param p5, "doRememberMe"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 338
    const/4 v3, 0x0

    .line 340
    .local v3, "url":Ljava/net/URL;
    invoke-static {p0, p1}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getHost(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 341
    .local v2, "host":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getEndPoint()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static/range {p0 .. p5}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getQueryString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 344
    .local v1, "endPoint":Ljava/lang/String;
    :try_start_0
    new-instance v3, Ljava/net/URL;

    .end local v3    # "url":Ljava/net/URL;
    const-string v4, "https"

    invoke-direct {v3, v4, v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 348
    .restart local v3    # "url":Ljava/net/URL;
    sget-object v4, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Generating OAUTH2 URL"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "url="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 349
    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 345
    .end local v3    # "url":Ljava/net/URL;
    :catch_0
    move-exception v0

    .line 346
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v4, Lcom/amazon/identity/auth/device/AuthError;

    const-string v5, "MalformedURLException"

    sget-object v6, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_BAD_PARAM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v4, v5, v0, v6}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v4
.end method

.method private static getQueryString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "clientId"    # Ljava/lang/String;
    .param p3, "scopes"    # [Ljava/lang/String;
    .param p4, "requestId"    # Ljava/lang/String;
    .param p5, "doRememberMe"    # Z

    .prologue
    .line 371
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v3, "?"

    invoke-direct {v1, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 372
    .local v1, "sb":Ljava/lang/StringBuffer;
    invoke-static {p1}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getRedirectUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 373
    .local v0, "redirectUri":Ljava/lang/String;
    const-string v3, "response_type"

    const-string v4, "code"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getUrlEncodedQuery(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 374
    const-string v3, "&"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 375
    const-string v3, "redirect_uri"

    invoke-static {v3, v0}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getUrlEncodedQuery(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 376
    const-string v3, "&"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 377
    const-string v3, "client_id"

    invoke-static {v3, p2}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getUrlEncodedQuery(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 378
    const-string v3, "&"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 379
    if-eqz p5, :cond_0

    .line 381
    const-string v3, "amzn_respectRmrMeAuthState"

    const-string v4, "1"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getUrlEncodedQuery(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 382
    const-string v3, "&"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 383
    const-string v3, "amzn_showRmrMe"

    const-string v4, "1"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getUrlEncodedQuery(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 384
    const-string v3, "&"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 385
    const-string v3, "amzn_rmrMeDefaultSelected"

    const-string v4, "1"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getUrlEncodedQuery(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 386
    const-string v3, "&"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 388
    :cond_0
    const-string v3, "state"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "clientId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "&"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "redirectUri"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "&"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "clientRequestId"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getUrlEncodedQuery(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 389
    const-string v3, "&"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 390
    invoke-static {p3}, Lcom/amazon/identity/auth/device/authorization/ScopesHelper;->getScopesString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 391
    .local v2, "scopeString":Ljava/lang/String;
    const-string v3, "scope"

    invoke-static {v3, v2}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getUrlEncodedQuery(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 392
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static getRedirectUri(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "packageName"    # Ljava/lang/String;

    .prologue
    .line 354
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "amzn://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 355
    .local v0, "rediectUri":Ljava/lang/String;
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Generating Redirect URI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "rediectUri="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    return-object v0
.end method

.method private getResultsFromAuthorizationService(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)Landroid/os/Bundle;
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appId"    # Ljava/lang/String;
    .param p3, "clientId"    # Ljava/lang/String;
    .param p4, "scopes"    # [Ljava/lang/String;
    .param p5, "listener"    # Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 186
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 188
    .local v2, "result":Landroid/os/Bundle;
    :try_start_0
    invoke-static {p1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->getRemoteAndroidService(Landroid/content/Context;)Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;

    move-result-object v3

    .line 189
    .local v3, "service":Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;
    if-eqz v3, :cond_1

    .line 191
    const/4 v1, 0x0

    .line 192
    .local v1, "options":Landroid/os/Bundle;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v1, v4, p4}, Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;->authorize(Landroid/os/Bundle;Ljava/lang/String;[Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    .line 194
    if-nez v2, :cond_0

    .line 196
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 212
    invoke-static {p1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->unbind(Landroid/content/Context;)V

    .line 214
    .end local v1    # "options":Landroid/os/Bundle;
    .end local v3    # "service":Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;
    :goto_0
    return-object v4

    .line 200
    .restart local v1    # "options":Landroid/os/Bundle;
    .restart local v3    # "service":Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 212
    .end local v1    # "options":Landroid/os/Bundle;
    :cond_1
    invoke-static {p1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->unbind(Landroid/content/Context;)V

    .end local v3    # "service":Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;
    :goto_1
    move-object v4, v2

    .line 214
    goto :goto_0

    .line 204
    :catch_0
    move-exception v0

    .line 207
    .local v0, "e":Landroid/os/RemoteException;
    :try_start_2
    invoke-static {p1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->clearCachedService(Landroid/content/Context;)V

    .line 208
    sget-object v4, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "RemoteException on authorize. "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 212
    invoke-static {p1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->unbind(Landroid/content/Context;)V

    goto :goto_1

    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_0
    move-exception v4

    invoke-static {p1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->unbind(Landroid/content/Context;)V

    throw v4
.end method

.method private static getUrlEncodedQuery(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 397
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 398
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    invoke-static {p1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private startExchange(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "clientId"    # Ljava/lang/String;
    .param p3, "redirectUri"    # Ljava/lang/String;
    .param p4, "code"    # Ljava/lang/String;
    .param p5, "scopes"    # [Ljava/lang/String;
    .param p6, "listener"    # Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    .prologue
    .line 314
    invoke-static {}, Lcom/amazon/identity/auth/device/thread/ThreadUtils;->isRunningOnMainThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 316
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->LOG_TAG:Ljava/lang/String;

    const-string v2, "code for token exchange started on main thread"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "authorize started on main thread"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 320
    :cond_0
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Inside getToken AsyncTask - Attempting endpoint"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    new-instance v8, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;

    invoke-direct {v8}, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;-><init>()V

    .line 322
    .local v8, "appIdentifier":Lcom/amazon/identity/auth/device/appid/AppIdentifier;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v8, v1, p1}, Lcom/amazon/identity/auth/device/appid/AppIdentifier;->getAppInfo(Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v9

    .line 323
    .local v9, "appInfo":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    invoke-virtual {v9}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAppFamilyId()Ljava/lang/String;

    move-result-object v4

    .line 326
    .local v4, "appId":Ljava/lang/String;
    :try_start_0
    iget-object v1, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->mTokenVendor:Lcom/amazon/identity/auth/device/endpoint/TokenVendor;

    move-object/from16 v2, p4

    move-object v3, p2

    move-object v5, p3

    move-object/from16 v6, p5

    move-object v7, p1

    invoke-virtual/range {v1 .. v7}, Lcom/amazon/identity/auth/device/endpoint/TokenVendor;->vendNewTokensFromCode(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)Landroid/os/Bundle;

    move-result-object v11

    .line 327
    .local v11, "result":Landroid/os/Bundle;
    move-object/from16 v0, p6

    invoke-interface {v0, v11}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onSuccess(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/amazon/identity/auth/device/AuthError; {:try_start_0 .. :try_end_0} :catch_1

    .line 334
    .end local v11    # "result":Landroid/os/Bundle;
    :goto_0
    return-void

    .line 328
    :catch_0
    move-exception v10

    .line 329
    .local v10, "e":Ljava/io/IOException;
    new-instance v1, Lcom/amazon/identity/auth/device/AuthError;

    const-string v2, "Failed to exchange code for token"

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_IO:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v1, v2, v10, v3}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    move-object/from16 v0, p6

    invoke-interface {v0, v1}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    goto :goto_0

    .line 330
    .end local v10    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v10

    .line 331
    .local v10, "e":Lcom/amazon/identity/auth/device/AuthError;
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed doing code for token exchange "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v10}, Lcom/amazon/identity/auth/device/AuthError;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    move-object/from16 v0, p6

    invoke-interface {v0, v10}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    goto :goto_0
.end method


# virtual methods
.method public authorize(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZLcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V
    .locals 24
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "clientId"    # Ljava/lang/String;
    .param p4, "requestedScopes"    # [Ljava/lang/String;
    .param p5, "isBrowserFlow"    # Z
    .param p6, "listener"    # Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 53
    invoke-static {}, Lcom/amazon/identity/auth/device/thread/ThreadUtils;->isRunningOnMainThread()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 55
    sget-object v4, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->LOG_TAG:Ljava/lang/String;

    const-string v5, "authorize started on main thread"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "authorize started on main thread"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 59
    :cond_0
    new-instance v17, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;

    invoke-direct/range {v17 .. v17}, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;-><init>()V

    .line 60
    .local v17, "appIdentifier":Lcom/amazon/identity/auth/device/appid/AppIdentifier;
    move-object/from16 v0, v17

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-interface {v0, v1, v2}, Lcom/amazon/identity/auth/device/appid/AppIdentifier;->getAppInfo(Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v18

    .line 61
    .local v18, "appInfo":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    invoke-virtual/range {v18 .. v18}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAppFamilyId()Ljava/lang/String;

    move-result-object v6

    .line 63
    .local v6, "appId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->mTokenVendor:Lcom/amazon/identity/auth/device/endpoint/TokenVendor;

    const/4 v5, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v4, v5, v6, v0}, Lcom/amazon/identity/auth/device/endpoint/TokenVendor;->getCachedScopes(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/util/List;

    move-result-object v20

    .line 65
    .local v20, "cachedScopes":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/identity/auth/device/dataobject/RequestedScope;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    move-object/from16 v3, v20

    invoke-direct {v0, v1, v2, v3, v6}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getCommonScopesForAuthorization(Landroid/content/Context;[Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    move-result-object v23

    .line 66
    .local v23, "scopeList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    move-object/from16 v0, v23

    invoke-interface {v0, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    .line 68
    .local v8, "allScopes":[Ljava/lang/String;
    sget-object v22, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    .line 69
    .local v22, "results":Landroid/os/Bundle;
    if-eqz v20, :cond_1

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_2

    :cond_1
    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v7, p3

    move-object/from16 v9, p6

    .line 71
    invoke-direct/range {v4 .. v9}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->getResultsFromAuthorizationService(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)Landroid/os/Bundle;

    move-result-object v22

    .line 75
    :cond_2
    const-string v4, "AUTH_ERROR_EXECEPTION"

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    sget-object v4, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->AUTHORIZE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v4, v4, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    sget-object v4, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->CAUSE_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v4, v4, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 81
    invoke-static/range {p1 .. p1}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;

    move-result-object v4

    invoke-virtual {v4}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->deleteAllRows()I

    .line 82
    new-instance v21, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 83
    .local v21, "myHandler":Landroid/os/Handler;
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v15

    .line 84
    .local v15, "requestId":Ljava/util/UUID;
    sget-object v4, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Created UUID for request"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "uuid="

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v5, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    new-instance v9, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;

    move-object/from16 v10, p0

    move/from16 v11, p5

    move-object/from16 v12, p1

    move-object/from16 v13, p3

    move-object v14, v8

    move-object/from16 v16, p6

    invoke-direct/range {v9 .. v16}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;-><init>(Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;ZLandroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Ljava/util/UUID;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 128
    .end local v15    # "requestId":Ljava/util/UUID;
    .end local v21    # "myHandler":Landroid/os/Handler;
    :goto_0
    return-void

    .line 109
    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 110
    sget-object v4, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->CAUSE_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v4, v4, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 112
    move-object/from16 v0, p6

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onCancel(Landroid/os/Bundle;)V

    goto :goto_0

    .line 114
    :cond_4
    const-string v4, "AUTH_ERROR_EXECEPTION"

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 116
    invoke-static/range {v22 .. v22}, Lcom/amazon/identity/auth/device/AuthError;->extractError(Landroid/os/Bundle;)Lcom/amazon/identity/auth/device/AuthError;

    move-result-object v4

    move-object/from16 v0, p6

    invoke-interface {v0, v4}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    goto :goto_0

    .line 121
    :cond_5
    invoke-static/range {p1 .. p1}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->clearAuthorizationState(Landroid/content/Context;)V

    .line 123
    new-instance v19, Landroid/os/Bundle;

    invoke-direct/range {v19 .. v19}, Landroid/os/Bundle;-><init>()V

    .line 124
    .local v19, "bundle":Landroid/os/Bundle;
    sget-object v4, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->AUTHORIZE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v4, v4, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    const-string v5, "authorized via service"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    move-object/from16 v0, p6

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onSuccess(Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method doExchange(Landroid/content/Context;Landroid/os/Bundle;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "response"    # Landroid/os/Bundle;
    .param p3, "listener"    # Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    .prologue
    .line 282
    sget-object v0, Lcom/amazon/identity/auth/device/thread/ThreadUtils;->THREAD_POOL:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$2;

    invoke-direct {v1, p0, p2, p1, p3}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$2;-><init>(Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;Landroid/os/Bundle;Landroid/content/Context;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 307
    return-void
.end method
