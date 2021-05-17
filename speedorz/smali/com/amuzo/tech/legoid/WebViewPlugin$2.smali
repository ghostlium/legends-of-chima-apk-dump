.class Lcom/amuzo/tech/legoid/WebViewPlugin$2;
.super Ljava/lang/Object;
.source "WebViewPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amuzo/tech/legoid/WebViewPlugin;->HttpPost(Ljava/lang/String;[Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amuzo/tech/legoid/WebViewPlugin;

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$args:[Ljava/lang/String;

.field private final synthetic val$asyncCaller:Lcom/amuzo/tech/legoid/IAsyncCaller;

.field private final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/amuzo/tech/legoid/WebViewPlugin;Ljava/lang/String;[Ljava/lang/String;Lcom/amuzo/tech/legoid/IAsyncCaller;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->this$0:Lcom/amuzo/tech/legoid/WebViewPlugin;

    iput-object p2, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->val$args:[Ljava/lang/String;

    iput-object p4, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->val$asyncCaller:Lcom/amuzo/tech/legoid/IAsyncCaller;

    iput-object p5, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->val$a:Landroid/app/Activity;

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 144
    const-string v2, "4t2"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "HttpPost: url["

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->val$url:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] args["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->val$args:[Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 147
    .local v1, "postArgs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->val$args:[Ljava/lang/String;

    array-length v2, v2

    if-lt v0, v2, :cond_0

    .line 152
    iget-object v2, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->this$0:Lcom/amuzo/tech/legoid/WebViewPlugin;

    new-instance v3, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;

    .line 153
    iget-object v4, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->val$asyncCaller:Lcom/amuzo/tech/legoid/IAsyncCaller;

    iget-object v5, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->val$a:Landroid/app/Activity;

    .line 154
    iget-object v6, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->val$url:Ljava/lang/String;

    .line 155
    invoke-direct {v3, v4, v5, v6, v1}, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;-><init>(Lcom/amuzo/tech/legoid/IAsyncCaller;Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)V

    .line 152
    invoke-static {v2, v3}, Lcom/amuzo/tech/legoid/WebViewPlugin;->access$2(Lcom/amuzo/tech/legoid/WebViewPlugin;Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;)V

    .line 156
    iget-object v2, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->this$0:Lcom/amuzo/tech/legoid/WebViewPlugin;

    invoke-static {v2}, Lcom/amuzo/tech/legoid/WebViewPlugin;->access$3(Lcom/amuzo/tech/legoid/WebViewPlugin;)Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/amuzo/tech/legoid/LegoHTTPPostHandler;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 157
    return-void

    .line 149
    :cond_0
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    iget-object v3, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->val$args:[Ljava/lang/String;

    aget-object v3, v3, v0

    iget-object v4, p0, Lcom/amuzo/tech/legoid/WebViewPlugin$2;->val$args:[Ljava/lang/String;

    add-int/lit8 v5, v0, 0x1

    aget-object v4, v4, v5

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    add-int/lit8 v0, v0, 0x2

    goto :goto_0
.end method
