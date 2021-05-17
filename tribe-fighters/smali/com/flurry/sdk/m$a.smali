.class final Lcom/flurry/sdk/m$a;
.super Landroid/webkit/WebChromeClient;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/m;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/m;)V
    .locals 0

    .prologue
    .line 143
    iput-object p1, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/m;Lcom/flurry/sdk/m$1;)V
    .locals 0

    .prologue
    .line 143
    invoke-direct {p0, p1}, Lcom/flurry/sdk/m$a;-><init>(Lcom/flurry/sdk/m;)V

    return-void
.end method


# virtual methods
.method public onHideCustomView()V
    .locals 3

    .prologue
    .line 169
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    invoke-static {v1}, Lcom/flurry/sdk/m;->a(Lcom/flurry/sdk/m;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "onHideCustomView()"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 170
    iget-object v0, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    invoke-static {v0}, Lcom/flurry/sdk/m;->e(Lcom/flurry/sdk/m;)Lcom/flurry/sdk/m$d;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    invoke-static {v0}, Lcom/flurry/sdk/m;->e(Lcom/flurry/sdk/m;)Lcom/flurry/sdk/m$d;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    invoke-interface {v0, v1}, Lcom/flurry/sdk/m$d;->a(Lcom/flurry/sdk/m;)V

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flurry/sdk/m;->b(Lcom/flurry/sdk/m;Z)Z

    .line 174
    return-void
.end method

.method public onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 4

    .prologue
    .line 159
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    invoke-static {v1}, Lcom/flurry/sdk/m;->a(Lcom/flurry/sdk/m;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "onShowCustomView(14)"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 160
    iget-object v0, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flurry/sdk/m;->b(Lcom/flurry/sdk/m;Z)Z

    .line 161
    iget-object v0, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    invoke-static {v0}, Lcom/flurry/sdk/m;->e(Lcom/flurry/sdk/m;)Lcom/flurry/sdk/m$d;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    invoke-static {v0}, Lcom/flurry/sdk/m;->e(Lcom/flurry/sdk/m;)Lcom/flurry/sdk/m$d;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    new-instance v2, Lcom/flurry/sdk/m$g;

    iget-object v3, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    invoke-direct {v2, v3, p3}, Lcom/flurry/sdk/m$g;-><init>(Lcom/flurry/sdk/m;Landroid/webkit/WebChromeClient$CustomViewCallback;)V

    invoke-interface {v0, v1, p1, p2, v2}, Lcom/flurry/sdk/m$d;->a(Lcom/flurry/sdk/m;Landroid/view/View;ILcom/flurry/sdk/m$d$a;)V

    .line 165
    :cond_0
    return-void
.end method

.method public onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 4

    .prologue
    .line 147
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    invoke-static {v1}, Lcom/flurry/sdk/m;->a(Lcom/flurry/sdk/m;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "onShowCustomView(7)"

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 148
    iget-object v0, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flurry/sdk/m;->b(Lcom/flurry/sdk/m;Z)Z

    .line 149
    iget-object v0, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    invoke-static {v0}, Lcom/flurry/sdk/m;->e(Lcom/flurry/sdk/m;)Lcom/flurry/sdk/m$d;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    invoke-static {v0}, Lcom/flurry/sdk/m;->e(Lcom/flurry/sdk/m;)Lcom/flurry/sdk/m$d;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    new-instance v2, Lcom/flurry/sdk/m$g;

    iget-object v3, p0, Lcom/flurry/sdk/m$a;->a:Lcom/flurry/sdk/m;

    invoke-direct {v2, v3, p2}, Lcom/flurry/sdk/m$g;-><init>(Lcom/flurry/sdk/m;Landroid/webkit/WebChromeClient$CustomViewCallback;)V

    invoke-interface {v0, v1, p1, v2}, Lcom/flurry/sdk/m$d;->a(Lcom/flurry/sdk/m;Landroid/view/View;Lcom/flurry/sdk/m$d$a;)V

    .line 153
    :cond_0
    return-void
.end method
