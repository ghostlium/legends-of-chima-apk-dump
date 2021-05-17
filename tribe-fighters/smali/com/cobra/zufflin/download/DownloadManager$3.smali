.class Lcom/cobra/zufflin/download/DownloadManager$3;
.super Ljava/lang/Object;
.source "DownloadManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/download/DownloadManager;->getData(ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/download/DownloadManager;

.field private final synthetic val$TARGET_URL:Ljava/lang/String;

.field private final synthetic val$id:I

.field private final synthetic val$userAgent:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/download/DownloadManager;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/download/DownloadManager$3;->this$0:Lcom/cobra/zufflin/download/DownloadManager;

    iput-object p2, p0, Lcom/cobra/zufflin/download/DownloadManager$3;->val$userAgent:Ljava/lang/String;

    iput-object p3, p0, Lcom/cobra/zufflin/download/DownloadManager$3;->val$TARGET_URL:Ljava/lang/String;

    iput p4, p0, Lcom/cobra/zufflin/download/DownloadManager$3;->val$id:I

    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    .line 155
    const/4 v7, 0x0

    .line 158
    .local v7, "success":Z
    :try_start_0
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 160
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v8

    const-string v9, "http.useragent"

    iget-object v10, p0, Lcom/cobra/zufflin/download/DownloadManager$3;->val$userAgent:Ljava/lang/String;

    invoke-interface {v8, v9, v10}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 162
    iget-object v3, p0, Lcom/cobra/zufflin/download/DownloadManager$3;->val$TARGET_URL:Ljava/lang/String;

    .line 163
    .local v3, "getURL":Ljava/lang/String;
    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v2, v3}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 164
    .local v2, "get":Lorg/apache/http/client/methods/HttpGet;
    invoke-interface {v0, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 165
    .local v6, "responseGet":Lorg/apache/http/HttpResponse;
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    .line 166
    .local v4, "resEntityGet":Lorg/apache/http/HttpEntity;
    if-eqz v4, :cond_0

    .line 169
    invoke-static {v4}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v5

    .line 172
    .local v5, "response":Ljava/lang/String;
    const/4 v7, 0x1

    .line 173
    iget-object v8, p0, Lcom/cobra/zufflin/download/DownloadManager$3;->this$0:Lcom/cobra/zufflin/download/DownloadManager;

    iget v9, p0, Lcom/cobra/zufflin/download/DownloadManager$3;->val$id:I

    invoke-virtual {v8, v9, v5, v7}, Lcom/cobra/zufflin/download/DownloadManager;->doGetComplete(ILjava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v2    # "get":Lorg/apache/http/client/methods/HttpGet;
    .end local v3    # "getURL":Ljava/lang/String;
    .end local v4    # "resEntityGet":Lorg/apache/http/HttpEntity;
    .end local v5    # "response":Ljava/lang/String;
    .end local v6    # "responseGet":Lorg/apache/http/HttpResponse;
    :cond_0
    :goto_0
    return-void

    .line 177
    :catch_0
    move-exception v1

    .line 179
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 180
    iget-object v8, p0, Lcom/cobra/zufflin/download/DownloadManager$3;->this$0:Lcom/cobra/zufflin/download/DownloadManager;

    iget v9, p0, Lcom/cobra/zufflin/download/DownloadManager$3;->val$id:I

    const-string v10, "GET Failed"

    invoke-virtual {v8, v9, v10, v7}, Lcom/cobra/zufflin/download/DownloadManager;->doGetComplete(ILjava/lang/String;Z)V

    goto :goto_0
.end method
