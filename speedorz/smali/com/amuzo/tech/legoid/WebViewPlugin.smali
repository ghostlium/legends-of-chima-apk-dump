.class public Lcom/amuzo/tech/legoid/WebViewPlugin;
.super Ljava/lang/Object;
.source "WebViewPlugin.java"

# interfaces
.implements Lcom/amuzo/tech/legoid/IAsyncCaller;


# static fields
.field public static LEGO_DOMAIN_URL:Ljava/lang/String;

.field public static TIME_OUT_CONNECTION:I

.field public static TIME_OUT_SOCKET:I


# instance fields
.field private mGameObject:Ljava/lang/String;

.field private mLegoHTTPGetHandler:Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;

.field private mLegoHTTPPostHandler:Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;

.field private mUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const v0, 0xea60

    .line 41
    sput v0, Lcom/amuzo/tech/legoid/WebViewPlugin;->TIME_OUT_CONNECTION:I

    .line 42
    sput v0, Lcom/amuzo/tech/legoid/WebViewPlugin;->TIME_OUT_SOCKET:I

    .line 43
    const-string v0, "http://lego.com"

    sput-object v0, Lcom/amuzo/tech/legoid/WebViewPlugin;->LEGO_DOMAIN_URL:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mUrl:Ljava/lang/String;

    .line 48
    return-void
.end method

.method private UnitySendMessage(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 119
    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mGameObject:Ljava/lang/String;

    const-string v1, "CallFromJS"

    invoke-static {v0, v1, p1}, Lcom/unity3d/player/UnityPlayer;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    return-void
.end method

.method static synthetic access$0(Lcom/amuzo/tech/legoid/WebViewPlugin;Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;)V
    .locals 0

    .prologue
    .line 36
    iput-object p1, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mLegoHTTPGetHandler:Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;

    return-void
.end method

.method static synthetic access$1(Lcom/amuzo/tech/legoid/WebViewPlugin;)Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mLegoHTTPGetHandler:Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;

    return-object v0
.end method

.method static synthetic access$2(Lcom/amuzo/tech/legoid/WebViewPlugin;Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;)V
    .locals 0

    .prologue
    .line 37
    iput-object p1, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mLegoHTTPPostHandler:Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;

    return-void
.end method

.method static synthetic access$3(Lcom/amuzo/tech/legoid/WebViewPlugin;)Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mLegoHTTPPostHandler:Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;

    return-object v0
.end method


# virtual methods
.method public Destroy()V
    .locals 0

    .prologue
    .line 68
    return-void
.end method

.method public EvaluateJS(Ljava/lang/String;)V
    .locals 0
    .param p1, "js"    # Ljava/lang/String;

    .prologue
    .line 162
    return-void
.end method

.method public HttpGet(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 124
    sget-object v0, Lcom/unity3d/player/UnityPlayer;->currentActivity:Landroid/app/Activity;

    .line 125
    .local v0, "a":Landroid/app/Activity;
    move-object v1, p0

    .line 126
    .local v1, "asyncCaller":Lcom/amuzo/tech/legoid/IAsyncCaller;
    new-instance v2, Lcom/amuzo/tech/legoid/WebViewPlugin$1;

    invoke-direct {v2, p0, p1, v1, v0}, Lcom/amuzo/tech/legoid/WebViewPlugin$1;-><init>(Lcom/amuzo/tech/legoid/WebViewPlugin;Ljava/lang/String;Lcom/amuzo/tech/legoid/IAsyncCaller;Landroid/app/Activity;)V

    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 136
    return-void
.end method

.method public HttpPost(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 6
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/String;

    .prologue
    .line 140
    sget-object v5, Lcom/unity3d/player/UnityPlayer;->currentActivity:Landroid/app/Activity;

    .line 141
    .local v5, "a":Landroid/app/Activity;
    move-object v4, p0

    .line 142
    .local v4, "asyncCaller":Lcom/amuzo/tech/legoid/IAsyncCaller;
    new-instance v0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/amuzo/tech/legoid/WebViewPlugin$2;-><init>(Lcom/amuzo/tech/legoid/WebViewPlugin;Ljava/lang/String;[Ljava/lang/String;Lcom/amuzo/tech/legoid/IAsyncCaller;Landroid/app/Activity;)V

    invoke-virtual {v5, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 158
    return-void
.end method

.method public Init(Ljava/lang/String;)V
    .locals 1
    .param p1, "gameObject"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mGameObject:Ljava/lang/String;

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mUrl:Ljava/lang/String;

    .line 54
    sget-object v0, Lcom/unity3d/player/UnityPlayer;->currentActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/amuzo/tech/legoid/CookieJar;->createInstance(Landroid/content/Context;)V

    .line 55
    return-void
.end method

.method public LoadURL(Ljava/lang/String;)V
    .locals 5
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 72
    iget-object v2, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mUrl:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 74
    const-string v2, "4t2"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "not loading "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", still handling "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    :goto_0
    return-void

    .line 78
    :cond_0
    iput-object p1, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mUrl:Ljava/lang/String;

    .line 79
    invoke-static {}, Lcom/amuzo/tech/legoid/CookieJar;->getInstance()Lcom/amuzo/tech/legoid/CookieJar;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amuzo/tech/legoid/CookieJar;->clearLoginComplete()V

    .line 81
    const-string v2, "4t2"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Starting activity with "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " and "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mGameObject:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    sget-object v0, Lcom/unity3d/player/UnityPlayer;->currentActivity:Landroid/app/Activity;

    .line 85
    .local v0, "a":Landroid/app/Activity;
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 86
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "com.amuzo.tech.legoid.login.WEBVIEW_URL"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 87
    const-string v2, "com.amuzo.tech.legoid.login.WEBVIEW_GAMEOBJECT"

    iget-object v3, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mGameObject:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 88
    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public NotifyResume()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 93
    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mUrl:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 115
    :cond_0
    :goto_0
    return-void

    .line 98
    :cond_1
    const-string v0, "4t2"

    const-string v1, "Notify Resume"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    invoke-static {}, Lcom/amuzo/tech/legoid/CookieJar;->getInstance()Lcom/amuzo/tech/legoid/CookieJar;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/amuzo/tech/legoid/CookieJar;->getInstance()Lcom/amuzo/tech/legoid/CookieJar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amuzo/tech/legoid/CookieJar;->isLoginComplete()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 101
    const-string v0, "4t2"

    const-string v1, "Login is complete!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    const-string v0, "loginComplete"

    invoke-direct {p0, v0}, Lcom/amuzo/tech/legoid/WebViewPlugin;->UnitySendMessage(Ljava/lang/String;)V

    .line 103
    iput-object v2, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mUrl:Ljava/lang/String;

    goto :goto_0

    .line 107
    :cond_2
    const-string v0, "4t2"

    const-string v1, "Login is NOT complete!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    invoke-static {}, Lcom/amuzo/tech/legoid/CookieJar;->getInstance()Lcom/amuzo/tech/legoid/CookieJar;

    move-result-object v0

    iget-boolean v0, v0, Lcom/amuzo/tech/legoid/CookieJar;->mUserQuit:Z

    if-eqz v0, :cond_0

    .line 110
    invoke-static {}, Lcom/amuzo/tech/legoid/CookieJar;->getInstance()Lcom/amuzo/tech/legoid/CookieJar;

    move-result-object v0

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/amuzo/tech/legoid/CookieJar;->mUserQuit:Z

    .line 111
    const-string v0, "loginQuit"

    invoke-direct {p0, v0}, Lcom/amuzo/tech/legoid/WebViewPlugin;->UnitySendMessage(Ljava/lang/String;)V

    .line 112
    iput-object v2, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mUrl:Ljava/lang/String;

    goto :goto_0
.end method

.method public SetMargins(IIII)V
    .locals 0
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 166
    return-void
.end method

.method public SetVisibility(Z)V
    .locals 0
    .param p1, "visibility"    # Z

    .prologue
    .line 170
    return-void
.end method

.method public cancelRequest()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 192
    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mLegoHTTPGetHandler:Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mLegoHTTPGetHandler:Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;

    invoke-virtual {v0}, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->RUNNING:Landroid/os/AsyncTask$Status;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mLegoHTTPGetHandler:Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;

    invoke-virtual {v0}, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->PENDING:Landroid/os/AsyncTask$Status;

    if-ne v0, v1, :cond_1

    .line 193
    :cond_0
    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mLegoHTTPGetHandler:Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;

    invoke-virtual {v0, v2}, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->cancel(Z)Z

    .line 194
    :cond_1
    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mLegoHTTPPostHandler:Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mLegoHTTPPostHandler:Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;

    invoke-virtual {v0}, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->RUNNING:Landroid/os/AsyncTask$Status;

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mLegoHTTPPostHandler:Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;

    invoke-virtual {v0}, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->PENDING:Landroid/os/AsyncTask$Status;

    if-ne v0, v1, :cond_3

    .line 195
    :cond_2
    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin;->mLegoHTTPPostHandler:Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;

    invoke-virtual {v0, v2}, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->cancel(Z)Z

    .line 196
    :cond_3
    return-void
.end method

.method public executeRequest()V
    .locals 0

    .prologue
    .line 201
    return-void
.end method

.method public notifyCallerOnConnectionFailure(Lcom/amuzo/tech/legoid/ConnectionErrors;Ljava/lang/String;)V
    .locals 2
    .param p1, "paramConnectionErrors"    # Lcom/amuzo/tech/legoid/ConnectionErrors;
    .param p2, "paramString"    # Ljava/lang/String;

    .prologue
    .line 180
    const-string v0, "responseFail"

    invoke-direct {p0, v0}, Lcom/amuzo/tech/legoid/WebViewPlugin;->UnitySendMessage(Ljava/lang/String;)V

    .line 181
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "connection failure: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amuzo/tech/legoid/WebViewPlugin;->UnitySendMessage(Ljava/lang/String;)V

    .line 182
    return-void
.end method

.method public notifyCallerOnPostExecute(Ljava/lang/String;)V
    .locals 1
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 174
    const-string v0, "responseSuccess"

    invoke-direct {p0, v0}, Lcom/amuzo/tech/legoid/WebViewPlugin;->UnitySendMessage(Ljava/lang/String;)V

    .line 175
    invoke-direct {p0, p1}, Lcom/amuzo/tech/legoid/WebViewPlugin;->UnitySendMessage(Ljava/lang/String;)V

    .line 176
    return-void
.end method

.method public notifyCallerOnRequestCancelled()V
    .locals 1

    .prologue
    .line 186
    const-string v0, "responsresponseFaileSuccess"

    invoke-direct {p0, v0}, Lcom/amuzo/tech/legoid/WebViewPlugin;->UnitySendMessage(Ljava/lang/String;)V

    .line 187
    const-string v0, "request cancelled"

    invoke-direct {p0, v0}, Lcom/amuzo/tech/legoid/WebViewPlugin;->UnitySendMessage(Ljava/lang/String;)V

    .line 188
    return-void
.end method
