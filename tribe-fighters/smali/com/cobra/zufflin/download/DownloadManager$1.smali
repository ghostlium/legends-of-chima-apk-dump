.class Lcom/cobra/zufflin/download/DownloadManager$1;
.super Ljava/lang/Object;
.source "DownloadManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/download/DownloadManager;->postData(ILjava/lang/String;Ljava/lang/String;Ljava/util/Vector;Ljava/util/Vector;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/download/DownloadManager;

.field private final synthetic val$TARGET_URL:Ljava/lang/String;

.field private final synthetic val$id:I

.field private final synthetic val$keys:Ljava/util/Vector;

.field private final synthetic val$userAgent:Ljava/lang/String;

.field private final synthetic val$values:Ljava/util/Vector;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/download/DownloadManager;Ljava/lang/String;Ljava/lang/String;Ljava/util/Vector;Ljava/util/Vector;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->this$0:Lcom/cobra/zufflin/download/DownloadManager;

    iput-object p2, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$TARGET_URL:Ljava/lang/String;

    iput-object p3, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$userAgent:Ljava/lang/String;

    iput-object p4, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$keys:Ljava/util/Vector;

    iput-object p5, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$values:Ljava/util/Vector;

    iput p6, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$id:I

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 47
    const/4 v7, 0x0

    .line 50
    .local v7, "success":Z
    :try_start_0
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 51
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    new-instance v4, Lorg/apache/http/client/methods/HttpPost;

    iget-object v8, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$TARGET_URL:Ljava/lang/String;

    invoke-direct {v4, v8}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 53
    .local v4, "post":Lorg/apache/http/client/methods/HttpPost;
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v8

    const-string v9, "http.useragent"

    iget-object v10, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$userAgent:Ljava/lang/String;

    invoke-interface {v8, v9, v10}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 55
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .local v3, "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v8, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$keys:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v8

    if-lt v2, v8, :cond_0

    .line 62
    new-instance v8, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    invoke-direct {v8, v3}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V

    invoke-virtual {v4, v8}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 63
    invoke-interface {v0, v4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 64
    .local v5, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v6

    .line 67
    .local v6, "responseBody":Ljava/lang/String;
    const/4 v7, 0x1

    .line 69
    iget-object v8, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->this$0:Lcom/cobra/zufflin/download/DownloadManager;

    iget v9, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$id:I

    invoke-virtual {v8, v9, v6, v7}, Lcom/cobra/zufflin/download/DownloadManager;->doPostComplete(ILjava/lang/String;Z)V

    .line 86
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v2    # "i":I
    .end local v3    # "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v4    # "post":Lorg/apache/http/client/methods/HttpPost;
    .end local v5    # "response":Lorg/apache/http/HttpResponse;
    .end local v6    # "responseBody":Ljava/lang/String;
    :goto_1
    return-void

    .line 59
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "i":I
    .restart local v3    # "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v4    # "post":Lorg/apache/http/client/methods/HttpPost;
    :cond_0
    new-instance v10, Lorg/apache/http/message/BasicNameValuePair;

    iget-object v8, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$keys:Ljava/util/Vector;

    invoke-virtual {v8, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    iget-object v9, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$values:Ljava/util/Vector;

    invoke-virtual {v9, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-direct {v10, v8, v9}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 57
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 71
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v2    # "i":I
    .end local v3    # "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v4    # "post":Lorg/apache/http/client/methods/HttpPost;
    :catch_0
    move-exception v1

    .line 73
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 74
    iget-object v8, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->this$0:Lcom/cobra/zufflin/download/DownloadManager;

    iget v9, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$id:I

    const-string v10, "UnsupportedEncodingException"

    invoke-virtual {v8, v9, v10, v11}, Lcom/cobra/zufflin/download/DownloadManager;->doPostComplete(ILjava/lang/String;Z)V

    goto :goto_1

    .line 76
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v1

    .line 78
    .local v1, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v1}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    .line 79
    iget-object v8, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->this$0:Lcom/cobra/zufflin/download/DownloadManager;

    iget v9, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$id:I

    const-string v10, "ClientProtocolException"

    invoke-virtual {v8, v9, v10, v11}, Lcom/cobra/zufflin/download/DownloadManager;->doPostComplete(ILjava/lang/String;Z)V

    goto :goto_1

    .line 81
    .end local v1    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_2
    move-exception v1

    .line 83
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 84
    iget-object v8, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->this$0:Lcom/cobra/zufflin/download/DownloadManager;

    iget v9, p0, Lcom/cobra/zufflin/download/DownloadManager$1;->val$id:I

    const-string v10, "IOException"

    invoke-virtual {v8, v9, v10, v11}, Lcom/cobra/zufflin/download/DownloadManager;->doPostComplete(ILjava/lang/String;Z)V

    goto :goto_1
.end method
