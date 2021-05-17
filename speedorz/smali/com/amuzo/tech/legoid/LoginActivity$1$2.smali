.class Lcom/amuzo/tech/legoid/LoginActivity$1$2;
.super Landroid/webkit/WebViewClient;
.source "LoginActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amuzo/tech/legoid/LoginActivity$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/amuzo/tech/legoid/LoginActivity$1;

.field private final synthetic val$a:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/amuzo/tech/legoid/LoginActivity$1;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/amuzo/tech/legoid/LoginActivity$1$2;->this$1:Lcom/amuzo/tech/legoid/LoginActivity$1;

    iput-object p2, p0, Lcom/amuzo/tech/legoid/LoginActivity$1$2;->val$a:Landroid/app/Activity;

    .line 117
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 127
    iget-object v1, p0, Lcom/amuzo/tech/legoid/LoginActivity$1$2;->this$1:Lcom/amuzo/tech/legoid/LoginActivity$1;

    invoke-static {v1}, Lcom/amuzo/tech/legoid/LoginActivity$1;->access$0(Lcom/amuzo/tech/legoid/LoginActivity$1;)Lcom/amuzo/tech/legoid/LoginActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/amuzo/tech/legoid/LoginActivity;->access$6(Lcom/amuzo/tech/legoid/LoginActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 128
    const-string v1, "4t2"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Page load start: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    const-string v1, "https://"

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 133
    invoke-static {}, Lcom/amuzo/tech/legoid/CookieJar;->getInstance()Lcom/amuzo/tech/legoid/CookieJar;

    move-result-object v1

    .line 134
    invoke-virtual {v1}, Lcom/amuzo/tech/legoid/CookieJar;->getCookieManager()Landroid/webkit/CookieManager;

    move-result-object v1

    .line 135
    const-string v2, "http://lego.com"

    invoke-virtual {v1, v2}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "cookies":Ljava/lang/String;
    iget-object v1, p0, Lcom/amuzo/tech/legoid/LoginActivity$1$2;->this$1:Lcom/amuzo/tech/legoid/LoginActivity$1;

    invoke-static {v1}, Lcom/amuzo/tech/legoid/LoginActivity$1;->access$0(Lcom/amuzo/tech/legoid/LoginActivity$1;)Lcom/amuzo/tech/legoid/LoginActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->stopLoading()V

    .line 138
    if-eqz v0, :cond_1

    .line 139
    const-string v1, ".ASPXAUTH"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 140
    const-string v1, "L.S"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 142
    :cond_0
    const-string v1, "4t2"

    const-string v2, "Auth cookie found"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    invoke-static {}, Lcom/amuzo/tech/legoid/CookieJar;->getInstance()Lcom/amuzo/tech/legoid/CookieJar;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amuzo/tech/legoid/CookieJar;->setLoginComplete()V

    .line 146
    iget-object v1, p0, Lcom/amuzo/tech/legoid/LoginActivity$1$2;->val$a:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 150
    .end local v0    # "cookies":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 155
    const-string v0, "4t2"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ErrorCode="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 156
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (url ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 155
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    return-void
.end method
