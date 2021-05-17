.class public Lcom/amuzo/tech/legoid/LoginActivity;
.super Landroid/app/Activity;
.source "LoginActivity.java"


# static fields
.field public static LEGO_DOMAIN_URL:Ljava/lang/String; = null

.field public static TIME_OUT_CONNECTION:I = 0x0

.field public static TIME_OUT_SOCKET:I = 0x0

.field public static final WEBVIEW_GAMEOBJECT:Ljava/lang/String; = "com.amuzo.tech.legoid.login.WEBVIEW_GAMEOBJECT"

.field public static final WEBVIEW_URL:Ljava/lang/String; = "com.amuzo.tech.legoid.login.WEBVIEW_URL"


# instance fields
.field private layout:Landroid/widget/RelativeLayout;

.field private mBackButton:Landroid/widget/Button;

.field private mGameObject:Ljava/lang/String;

.field private mUrl:Ljava/lang/String;

.field private mWebView:Landroid/webkit/WebView;

.field private wl:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const v0, 0xea60

    .line 45
    sput v0, Lcom/amuzo/tech/legoid/LoginActivity;->TIME_OUT_CONNECTION:I

    .line 46
    sput v0, Lcom/amuzo/tech/legoid/LoginActivity;->TIME_OUT_SOCKET:I

    .line 47
    const-string v0, "http://lego.com"

    sput-object v0, Lcom/amuzo/tech/legoid/LoginActivity;->LEGO_DOMAIN_URL:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amuzo/tech/legoid/LoginActivity;->layout:Landroid/widget/RelativeLayout;

    .line 37
    return-void
.end method

.method static synthetic access$0(Lcom/amuzo/tech/legoid/LoginActivity;Landroid/widget/RelativeLayout;)V
    .locals 0

    .prologue
    .line 38
    iput-object p1, p0, Lcom/amuzo/tech/legoid/LoginActivity;->layout:Landroid/widget/RelativeLayout;

    return-void
.end method

.method static synthetic access$1(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/widget/RelativeLayout;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LoginActivity;->layout:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$2(Lcom/amuzo/tech/legoid/LoginActivity;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 43
    iput-object p1, p0, Lcom/amuzo/tech/legoid/LoginActivity;->mBackButton:Landroid/widget/Button;

    return-void
.end method

.method static synthetic access$3(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/widget/Button;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LoginActivity;->mBackButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$4(Lcom/amuzo/tech/legoid/LoginActivity;Landroid/webkit/WebView;)V
    .locals 0

    .prologue
    .line 42
    iput-object p1, p0, Lcom/amuzo/tech/legoid/LoginActivity;->mWebView:Landroid/webkit/WebView;

    return-void
.end method

.method static synthetic access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LoginActivity;->mWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$6(Lcom/amuzo/tech/legoid/LoginActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LoginActivity;->mUrl:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public onAttachedToWindow()V
    .locals 2

    .prologue
    .line 195
    invoke-virtual {p0}, Lcom/amuzo/tech/legoid/LoginActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 197
    .local v0, "window":Landroid/view/Window;
    const v1, 0x680080

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 201
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 214
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LoginActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 215
    invoke-static {}, Lcom/amuzo/tech/legoid/CookieJar;->getInstance()Lcom/amuzo/tech/legoid/CookieJar;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/amuzo/tech/legoid/CookieJar;->mUserQuit:Z

    .line 216
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/16 v3, 0x400

    .line 55
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 56
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/amuzo/tech/legoid/LoginActivity;->requestWindowFeature(I)Z

    .line 57
    invoke-virtual {p0}, Lcom/amuzo/tech/legoid/LoginActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v3, v3}, Landroid/view/Window;->setFlags(II)V

    .line 64
    move-object v0, p0

    .line 65
    .local v0, "a":Landroid/app/Activity;
    invoke-virtual {p0}, Lcom/amuzo/tech/legoid/LoginActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 66
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "com.amuzo.tech.legoid.login.WEBVIEW_URL"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/amuzo/tech/legoid/LoginActivity;->mUrl:Ljava/lang/String;

    .line 67
    const-string v2, "com.amuzo.tech.legoid.login.WEBVIEW_GAMEOBJECT"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/amuzo/tech/legoid/LoginActivity;->mGameObject:Ljava/lang/String;

    .line 69
    new-instance v2, Lcom/amuzo/tech/legoid/LoginActivity$1;

    invoke-direct {v2, p0, v0}, Lcom/amuzo/tech/legoid/LoginActivity$1;-><init>(Lcom/amuzo/tech/legoid/LoginActivity;Landroid/app/Activity;)V

    invoke-virtual {p0, v2}, Lcom/amuzo/tech/legoid/LoginActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 169
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 209
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 190
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 191
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 173
    move-object v0, p0

    .line 175
    .local v0, "a":Landroid/app/Activity;
    new-instance v1, Lcom/amuzo/tech/legoid/LoginActivity$2;

    invoke-direct {v1, p0}, Lcom/amuzo/tech/legoid/LoginActivity$2;-><init>(Lcom/amuzo/tech/legoid/LoginActivity;)V

    invoke-virtual {p0, v1}, Lcom/amuzo/tech/legoid/LoginActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 184
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 185
    return-void
.end method
