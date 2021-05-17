.class Lcom/cobra/zufflin/download/DownloadManager$2;
.super Ljava/lang/Object;
.source "DownloadManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/download/DownloadManager;->postData(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/download/DownloadManager;

.field private final synthetic val$TARGET_URL:Ljava/lang/String;

.field private final synthetic val$id:I

.field private final synthetic val$postData:Ljava/lang/String;

.field private final synthetic val$userAgent:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/download/DownloadManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->this$0:Lcom/cobra/zufflin/download/DownloadManager;

    iput-object p2, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->val$TARGET_URL:Ljava/lang/String;

    iput-object p3, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->val$userAgent:Ljava/lang/String;

    iput-object p4, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->val$postData:Ljava/lang/String;

    iput p5, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->val$id:I

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 103
    const/4 v5, 0x0

    .line 106
    .local v5, "success":Z
    :try_start_0
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 107
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    iget-object v6, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->val$TARGET_URL:Ljava/lang/String;

    invoke-direct {v2, v6}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 109
    .local v2, "post":Lorg/apache/http/client/methods/HttpPost;
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v6

    const-string v7, "http.useragent"

    iget-object v8, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->val$userAgent:Ljava/lang/String;

    invoke-interface {v6, v7, v8}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 111
    new-instance v6, Lorg/apache/http/entity/StringEntity;

    iget-object v7, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->val$postData:Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 112
    invoke-interface {v0, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 113
    .local v3, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v4

    .line 117
    .local v4, "responseBody":Ljava/lang/String;
    const/4 v5, 0x1

    .line 119
    iget-object v6, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->this$0:Lcom/cobra/zufflin/download/DownloadManager;

    iget v7, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->val$id:I

    invoke-virtual {v6, v7, v4, v5}, Lcom/cobra/zufflin/download/DownloadManager;->doPostComplete(ILjava/lang/String;Z)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 136
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v2    # "post":Lorg/apache/http/client/methods/HttpPost;
    .end local v3    # "response":Lorg/apache/http/HttpResponse;
    .end local v4    # "responseBody":Ljava/lang/String;
    :goto_0
    return-void

    .line 121
    :catch_0
    move-exception v1

    .line 123
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 124
    iget-object v6, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->this$0:Lcom/cobra/zufflin/download/DownloadManager;

    iget v7, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->val$id:I

    const-string v8, "UnsupportedEncodingException"

    invoke-virtual {v6, v7, v8, v9}, Lcom/cobra/zufflin/download/DownloadManager;->doPostComplete(ILjava/lang/String;Z)V

    goto :goto_0

    .line 126
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v1

    .line 128
    .local v1, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v1}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    .line 129
    iget-object v6, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->this$0:Lcom/cobra/zufflin/download/DownloadManager;

    iget v7, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->val$id:I

    const-string v8, "ClientProtocolException"

    invoke-virtual {v6, v7, v8, v9}, Lcom/cobra/zufflin/download/DownloadManager;->doPostComplete(ILjava/lang/String;Z)V

    goto :goto_0

    .line 131
    .end local v1    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_2
    move-exception v1

    .line 133
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 134
    iget-object v6, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->this$0:Lcom/cobra/zufflin/download/DownloadManager;

    iget v7, p0, Lcom/cobra/zufflin/download/DownloadManager$2;->val$id:I

    const-string v8, "IOException"

    invoke-virtual {v6, v7, v8, v9}, Lcom/cobra/zufflin/download/DownloadManager;->doPostComplete(ILjava/lang/String;Z)V

    goto :goto_0
.end method
