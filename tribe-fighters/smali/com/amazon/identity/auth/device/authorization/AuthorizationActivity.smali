.class public Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;
.super Landroid/app/Activity;
.source "AuthorizationActivity.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Registered"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 24
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 25
    sget-object v6, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->LOG_TAG:Ljava/lang/String;

    const-string v7, "onCreate"

    invoke-static {v6, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v5

    .line 27
    .local v5, "uri":Landroid/net/Uri;
    if-nez v5, :cond_0

    .line 29
    sget-object v6, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->LOG_TAG:Ljava/lang/String;

    const-string v7, "uri is null onCreate - closing activity"

    invoke-static {v6, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->finish()V

    .line 84
    :goto_0
    return-void

    .line 33
    :cond_0
    new-instance v3, Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;

    invoke-direct {v3}, Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;-><init>()V

    .line 34
    .local v3, "parser":Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;
    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;->getCallbackInfo(Ljava/lang/String;)Lcom/amazon/identity/auth/device/authorization/CallbackInfo;

    move-result-object v0

    .line 36
    .local v0, "callbackIntentInfo":Lcom/amazon/identity/auth/device/authorization/CallbackInfo;
    if-eqz v5, :cond_1

    if-eqz v0, :cond_1

    .line 38
    sget-object v6, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->LOG_TAG:Ljava/lang/String;

    const-string v7, "Received response from WebBroswer for OAuth2 flow"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "response="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    :try_start_0
    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, v0, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;->mRequestId:Ljava/lang/String;

    iget-object v8, v0, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;->mRequestedScopes:[Ljava/lang/String;

    invoke-virtual {v3, v6, v7, v8}, Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;->extractResultsBundle(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v4

    .line 41
    .local v4, "result":Landroid/os/Bundle;
    sget-object v6, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->CAUSE_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v6, v6, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    invoke-virtual {v4, v6}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 43
    iget-object v6, v0, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;->mlistener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    invoke-interface {v6, v4}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onCancel(Landroid/os/Bundle;)V

    .line 44
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->finish()V
    :try_end_0
    .catch Lcom/amazon/identity/auth/device/AuthError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 76
    .end local v4    # "result":Landroid/os/Bundle;
    :catch_0
    move-exception v1

    .line 77
    .local v1, "e":Lcom/amazon/identity/auth/device/AuthError;
    iget-object v6, v0, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;->mlistener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    if-eqz v6, :cond_1

    .line 79
    iget-object v6, v0, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;->mlistener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    invoke-interface {v6, v1}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    .line 83
    .end local v1    # "e":Lcom/amazon/identity/auth/device/AuthError;
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->finish()V

    goto :goto_0

    .line 47
    .restart local v4    # "result":Landroid/os/Bundle;
    :cond_2
    :try_start_1
    new-instance v2, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;

    invoke-direct {v2}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;-><init>()V

    .line 48
    .local v2, "helper":Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    new-instance v7, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity$1;

    invoke-direct {v7, p0, v0}, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity$1;-><init>(Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;Lcom/amazon/identity/auth/device/authorization/CallbackInfo;)V

    invoke-virtual {v2, v6, v4, v7}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->doExchange(Landroid/content/Context;Landroid/os/Bundle;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V
    :try_end_1
    .catch Lcom/amazon/identity/auth/device/AuthError; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
