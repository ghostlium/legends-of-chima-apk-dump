.class public Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;
.super Lcom/amazon/ags/html5/javascript/CallHandlerBase;
.source "NativeAuthCallHandler.java"


# static fields
.field private static final supportedCalls:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final authManager:Lcom/amazon/ags/auth/AuthManager;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 26
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "getLoggedInStatus"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "doLogin"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "doLogout"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->supportedCalls:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;Lcom/amazon/ags/auth/AuthManager;)V
    .locals 1
    .param p1, "uiThreadHandler"    # Landroid/os/Handler;
    .param p2, "authManager"    # Lcom/amazon/ags/auth/AuthManager;

    .prologue
    .line 33
    sget-object v0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->supportedCalls:Ljava/util/Set;

    invoke-direct {p0, p1, v0}, Lcom/amazon/ags/html5/javascript/CallHandlerBase;-><init>(Landroid/os/Handler;Ljava/util/Set;)V

    .line 34
    iput-object p2, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->authManager:Lcom/amazon/ags/auth/AuthManager;

    .line 35
    return-void
.end method

.method private doLogin(Ljava/lang/String;)V
    .locals 2
    .param p1, "rid"    # Ljava/lang/String;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->authManager:Lcom/amazon/ags/auth/AuthManager;

    new-instance v1, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler$1;

    invoke-direct {v1, p0, p1}, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler$1;-><init>(Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/amazon/ags/auth/AuthManager;->tryLogin(Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V

    .line 81
    return-void
.end method

.method private doLogout(Ljava/lang/String;)V
    .locals 3
    .param p1, "rid"    # Ljava/lang/String;

    .prologue
    .line 85
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->authManager:Lcom/amazon/ags/auth/AuthManager;

    invoke-virtual {v1}, Lcom/amazon/ags/auth/AuthManager;->logout()V

    .line 86
    const-string v1, "{}"

    const-string v2, "SUCCESS"

    invoke-virtual {p0, p1, v1, v2}, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/amazon/identity/auth/device/AuthError; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    :goto_0
    return-void

    .line 87
    :catch_0
    move-exception v0

    .line 88
    .local v0, "e":Lcom/amazon/identity/auth/device/AuthError;
    iget-object v1, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->TAG:Ljava/lang/String;

    const-string v2, "Failed to log out"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    const-string v1, "{}"

    const-string v2, "ERROR"

    invoke-virtual {p0, p1, v1, v2}, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getLoggedInStatus(Ljava/lang/String;)V
    .locals 6
    .param p1, "rid"    # Ljava/lang/String;

    .prologue
    .line 54
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 56
    .local v2, "reply":Lorg/json/JSONObject;
    :try_start_0
    iget-object v3, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->authManager:Lcom/amazon/ags/auth/AuthManager;

    invoke-virtual {v3}, Lcom/amazon/ags/auth/AuthManager;->isLoggedIn()Z

    move-result v1

    .line 57
    .local v1, "isLoggedIn":Z
    iget-object v3, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Logged in: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    const-string v3, "loggedInStatus"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .end local v1    # "isLoggedIn":Z
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "SUCCESS"

    invoke-virtual {p0, p1, v3, v4}, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    return-void

    .line 59
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Lorg/json/JSONException;
    iget-object v3, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->TAG:Ljava/lang/String;

    const-string v4, "Error building GET_LOGGED_IN_STATUS response"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method protected handleMessage(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 2
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "nativeCallType"    # Ljava/lang/String;
    .param p3, "request"    # Lorg/json/JSONObject;

    .prologue
    const/4 v0, 0x1

    .line 39
    const-string v1, "getLoggedInStatus"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 40
    invoke-direct {p0, p1}, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->getLoggedInStatus(Ljava/lang/String;)V

    .line 50
    :goto_0
    return v0

    .line 42
    :cond_0
    const-string v1, "doLogin"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 43
    invoke-direct {p0, p1}, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->doLogin(Ljava/lang/String;)V

    goto :goto_0

    .line 45
    :cond_1
    const-string v1, "doLogout"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 46
    invoke-direct {p0, p1}, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->doLogout(Ljava/lang/String;)V

    goto :goto_0

    .line 50
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method
