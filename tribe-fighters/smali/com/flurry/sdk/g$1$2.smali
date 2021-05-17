.class Lcom/flurry/sdk/g$1$2;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/g$1;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/flurry/sdk/g$1;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/g$1;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1000
    iput-object p1, p0, Lcom/flurry/sdk/g$1$2;->c:Lcom/flurry/sdk/g$1;

    iput-object p2, p0, Lcom/flurry/sdk/g$1$2;->a:Ljava/lang/String;

    iput-object p3, p0, Lcom/flurry/sdk/g$1$2;->b:Ljava/lang/String;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 6

    .prologue
    .line 1004
    iget-object v0, p0, Lcom/flurry/sdk/g$1$2;->c:Lcom/flurry/sdk/g$1;

    iget-object v0, v0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1006
    iget-object v0, p0, Lcom/flurry/sdk/g$1$2;->c:Lcom/flurry/sdk/g$1;

    iget-object v0, v0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->b(Lcom/flurry/sdk/g;)Landroid/webkit/WebView;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/g$1$2;->a:Ljava/lang/String;

    iget-object v2, p0, Lcom/flurry/sdk/g$1$2;->b:Ljava/lang/String;

    const-string v3, "text/html"

    const-string v4, "utf-8"

    iget-object v5, p0, Lcom/flurry/sdk/g$1$2;->a:Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1008
    :cond_0
    return-void
.end method
