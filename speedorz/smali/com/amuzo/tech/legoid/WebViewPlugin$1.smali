.class Lcom/amuzo/tech/legoid/WebViewPlugin$1;
.super Ljava/lang/Object;
.source "WebViewPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amuzo/tech/legoid/WebViewPlugin;->HttpGet(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amuzo/tech/legoid/WebViewPlugin;

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$asyncCaller:Lcom/amuzo/tech/legoid/IAsyncCaller;

.field private final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/amuzo/tech/legoid/WebViewPlugin;Ljava/lang/String;Lcom/amuzo/tech/legoid/IAsyncCaller;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$1;->this$0:Lcom/amuzo/tech/legoid/WebViewPlugin;

    iput-object p2, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$1;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$1;->val$asyncCaller:Lcom/amuzo/tech/legoid/IAsyncCaller;

    iput-object p4, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$1;->val$a:Landroid/app/Activity;

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 128
    const-string v0, "4t2"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "HttpGet: url["

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$1;->val$url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$1;->this$0:Lcom/amuzo/tech/legoid/WebViewPlugin;

    new-instance v1, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;

    .line 131
    iget-object v2, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$1;->val$asyncCaller:Lcom/amuzo/tech/legoid/IAsyncCaller;

    iget-object v3, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$1;->val$a:Landroid/app/Activity;

    .line 132
    iget-object v4, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$1;->val$url:Ljava/lang/String;

    .line 133
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;-><init>(Lcom/amuzo/tech/legoid/IAsyncCaller;Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)V

    .line 130
    invoke-static {v0, v1}, Lcom/amuzo/tech/legoid/WebViewPlugin;->access$0(Lcom/amuzo/tech/legoid/WebViewPlugin;Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;)V

    .line 134
    iget-object v0, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$1;->this$0:Lcom/amuzo/tech/legoid/WebViewPlugin;

    invoke-static {v0}, Lcom/amuzo/tech/legoid/WebViewPlugin;->access$1(Lcom/amuzo/tech/legoid/WebViewPlugin;)Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/amuzo/tech/legoid/LegoHTTPGetHandler;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 135
    return-void
.end method
