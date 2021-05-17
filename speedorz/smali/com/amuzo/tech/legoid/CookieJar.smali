.class public Lcom/amuzo/tech/legoid/CookieJar;
.super Ljava/lang/Object;
.source "CookieJar.java"


# static fields
.field private static instance:Lcom/amuzo/tech/legoid/CookieJar;


# instance fields
.field private mCookieManager:Landroid/webkit/CookieManager;

.field private mCookieSyncManager:Landroid/webkit/CookieSyncManager;

.field private mLoginComplete:Z

.field public mUserQuit:Z

.field private mWebView:Landroid/webkit/WebView;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-boolean v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mLoginComplete:Z

    .line 18
    iput-boolean v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mUserQuit:Z

    .line 70
    invoke-static {p1}, Landroid/webkit/CookieSyncManager;->createInstance(Landroid/content/Context;)Landroid/webkit/CookieSyncManager;

    move-result-object v0

    iput-object v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mCookieSyncManager:Landroid/webkit/CookieSyncManager;

    .line 71
    iget-object v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mCookieSyncManager:Landroid/webkit/CookieSyncManager;

    invoke-virtual {v0}, Landroid/webkit/CookieSyncManager;->startSync()V

    .line 73
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    iput-object v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mCookieManager:Landroid/webkit/CookieManager;

    .line 74
    iget-object v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mCookieManager:Landroid/webkit/CookieManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V

    .line 76
    iget-object v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mCookieManager:Landroid/webkit/CookieManager;

    invoke-virtual {v0}, Landroid/webkit/CookieManager;->removeAllCookie()V

    .line 77
    return-void
.end method

.method public static createInstance(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    sget-object v0, Lcom/amuzo/tech/legoid/CookieJar;->instance:Lcom/amuzo/tech/legoid/CookieJar;

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Lcom/amuzo/tech/legoid/CookieJar;

    invoke-direct {v0, p0}, Lcom/amuzo/tech/legoid/CookieJar;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/amuzo/tech/legoid/CookieJar;->instance:Lcom/amuzo/tech/legoid/CookieJar;

    .line 57
    :cond_0
    return-void
.end method

.method public static getInstance()Lcom/amuzo/tech/legoid/CookieJar;
    .locals 2

    .prologue
    .line 61
    sget-object v0, Lcom/amuzo/tech/legoid/CookieJar;->instance:Lcom/amuzo/tech/legoid/CookieJar;

    if-nez v0, :cond_0

    .line 63
    const-string v0, "4t2"

    const-string v1, "Must create the cookie jar before accessing it"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    :cond_0
    sget-object v0, Lcom/amuzo/tech/legoid/CookieJar;->instance:Lcom/amuzo/tech/legoid/CookieJar;

    return-object v0
.end method


# virtual methods
.method public clearLoginComplete()V
    .locals 1

    .prologue
    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mLoginComplete:Z

    .line 38
    return-void
.end method

.method public createWebView(Landroid/content/Context;)Landroid/webkit/WebView;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mWebView:Landroid/webkit/WebView;

    .line 43
    iget-object v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method public getCookieManager()Landroid/webkit/CookieManager;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mCookieManager:Landroid/webkit/CookieManager;

    return-object v0
.end method

.method public getWebView()Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method public isLoginComplete()Z
    .locals 1

    .prologue
    .line 27
    iget-boolean v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mLoginComplete:Z

    return v0
.end method

.method public setLoginComplete()V
    .locals 1

    .prologue
    .line 32
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/amuzo/tech/legoid/CookieJar;->mLoginComplete:Z

    .line 33
    return-void
.end method
