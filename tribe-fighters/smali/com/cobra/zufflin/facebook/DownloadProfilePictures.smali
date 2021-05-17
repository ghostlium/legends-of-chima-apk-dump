.class public Lcom/cobra/zufflin/facebook/DownloadProfilePictures;
.super Landroid/os/AsyncTask;
.source "DownloadProfilePictures.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private TaskCompleted:Z

.field private fileName:Ljava/lang/String;

.field private filePath:Ljava/lang/String;

.field private index:I

.field private listener:Lcom/cobra/zufflin/facebook/OnDownloadImageComplete;

.field private saveDir:Ljava/lang/String;

.field private targetUrl:Ljava/net/URL;

.field private userID:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/cobra/zufflin/facebook/OnDownloadImageComplete;Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/cobra/zufflin/facebook/OnDownloadImageComplete;
    .param p3, "Target"    # Ljava/net/URL;
    .param p4, "SaveDirectory"    # Ljava/lang/String;
    .param p5, "FileName"    # Ljava/lang/String;
    .param p6, "ID"    # Ljava/lang/String;
    .param p7, "Index"    # I

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->TaskCompleted:Z

    .line 42
    iput-object p2, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->listener:Lcom/cobra/zufflin/facebook/OnDownloadImageComplete;

    .line 43
    iput-object p3, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->targetUrl:Ljava/net/URL;

    .line 44
    iput-object p4, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->saveDir:Ljava/lang/String;

    .line 45
    iput-object p5, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->fileName:Ljava/lang/String;

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->filePath:Ljava/lang/String;

    .line 47
    iput p7, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->index:I

    .line 48
    iput-object p6, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->userID:Ljava/lang/String;

    .line 49
    return-void
.end method

.method private fetch(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 7
    .param p1, "address"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v6

    invoke-direct {v2, v6}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/net/URI;)V

    .line 53
    .local v2, "httpRequest":Lorg/apache/http/client/methods/HttpGet;
    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 54
    .local v3, "httpclient":Lorg/apache/http/client/HttpClient;
    invoke-interface {v3, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 55
    .local v5, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 56
    .local v1, "entity":Lorg/apache/http/HttpEntity;
    new-instance v0, Lorg/apache/http/entity/BufferedHttpEntity;

    invoke-direct {v0, v1}, Lorg/apache/http/entity/BufferedHttpEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    .line 57
    .local v0, "bufHttpEntity":Lorg/apache/http/entity/BufferedHttpEntity;
    invoke-virtual {v0}, Lorg/apache/http/entity/BufferedHttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v4

    .line 58
    .local v4, "instream":Ljava/io/InputStream;
    return-object v4
.end method

.method protected static imageByter(Ljava/net/URL;)[B
    .locals 7
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    const/4 v5, 0x0

    .line 146
    :try_start_0
    invoke-virtual {p0}, Ljava/net/URL;->getContent()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/InputStream;

    .line 148
    .local v3, "is":Ljava/io/InputStream;
    const/16 v6, 0x2000

    new-array v0, v6, [B

    .line 150
    .local v0, "buffer":[B
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 153
    .local v4, "output":Ljava/io/ByteArrayOutputStream;
    :goto_0
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "bytesRead":I
    const/4 v6, -0x1

    if-ne v1, v6, :cond_0

    .line 158
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    .line 168
    .end local v0    # "buffer":[B
    .end local v1    # "bytesRead":I
    .end local v3    # "is":Ljava/io/InputStream;
    .end local v4    # "output":Ljava/io/ByteArrayOutputStream;
    :goto_1
    return-object v5

    .line 155
    .restart local v0    # "buffer":[B
    .restart local v1    # "bytesRead":I
    .restart local v3    # "is":Ljava/io/InputStream;
    .restart local v4    # "output":Ljava/io/ByteArrayOutputStream;
    :cond_0
    const/4 v6, 0x0

    invoke-virtual {v4, v0, v6, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 160
    .end local v0    # "buffer":[B
    .end local v1    # "bytesRead":I
    .end local v3    # "is":Ljava/io/InputStream;
    .end local v4    # "output":Ljava/io/ByteArrayOutputStream;
    :catch_0
    move-exception v2

    .line 162
    .local v2, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v2}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_1

    .line 165
    .end local v2    # "e":Ljava/net/MalformedURLException;
    :catch_1
    move-exception v2

    .line 167
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 12
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 62
    const-string v9, "FACEBOOK"

    const-string v10, "doInBackground"

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    const/4 v6, 0x0

    .line 64
    .local v6, "is":Ljava/io/InputStream;
    const/4 v1, 0x0

    .line 67
    .local v1, "bm":Landroid/graphics/Bitmap;
    :try_start_0
    iget-object v9, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->targetUrl:Ljava/net/URL;

    invoke-virtual {v9}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->fetch(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    .line 69
    invoke-static {v6}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 81
    :goto_0
    if-eqz v1, :cond_1

    .line 82
    const-string v9, "FACEBOOK"

    const-string v10, "bitmap obtained"

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    const-string v9, "FACEBOOK"

    const-string v10, "converting to JPG"

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 87
    .local v2, "bos":Ljava/io/ByteArrayOutputStream;
    sget-object v9, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v10, 0x64

    invoke-virtual {v1, v9, v10, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 88
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 91
    .local v0, "bitmapdata":[B
    :try_start_1
    const-string v9, "FACEBOOK"

    const-string v10, "Saving..."

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    new-instance v8, Ljava/io/File;

    iget-object v9, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->saveDir:Ljava/lang/String;

    iget-object v10, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->fileName:Ljava/lang/String;

    invoke-direct {v8, v9, v10}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .local v8, "savedfile":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v7

    .line 96
    .local v7, "parentDir":Ljava/io/File;
    const-string v9, "FACEBOOK"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "File to be saved:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    const-string v9, "FACEBOOK"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Parentdir:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    invoke-virtual {v8}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->mkdirs()Z

    move-result v9

    if-nez v9, :cond_0

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 100
    :cond_0
    invoke-virtual {v8}, Ljava/io/File;->createNewFile()Z

    .line 101
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 103
    .local v5, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {v5, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 104
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V

    .line 105
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 107
    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->filePath:Ljava/lang/String;

    .line 109
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 110
    const-string v9, "FACEBOOK"

    const-string v10, "DownloadProfilePictures(): Saved"

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 125
    .end local v0    # "bitmapdata":[B
    .end local v2    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .end local v7    # "parentDir":Ljava/io/File;
    .end local v8    # "savedfile":Ljava/io/File;
    :cond_1
    :goto_1
    const/4 v9, 0x0

    return-object v9

    .line 71
    :catch_0
    move-exception v4

    .line 74
    .local v4, "e1":Ljava/net/MalformedURLException;
    invoke-virtual {v4}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto/16 :goto_0

    .line 76
    .end local v4    # "e1":Ljava/net/MalformedURLException;
    :catch_1
    move-exception v4

    .line 78
    .local v4, "e1":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 112
    .end local v4    # "e1":Ljava/io/IOException;
    .restart local v0    # "bitmapdata":[B
    .restart local v2    # "bos":Ljava/io/ByteArrayOutputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "parentDir":Ljava/io/File;
    .restart local v8    # "savedfile":Ljava/io/File;
    :cond_2
    :try_start_2
    const-string v9, "FACEBOOK"

    const-string v10, "DownloadProfilePictures(): Not Saved!"

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    goto :goto_1

    .line 117
    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .end local v7    # "parentDir":Ljava/io/File;
    .end local v8    # "savedfile":Ljava/io/File;
    :catch_2
    move-exception v3

    .line 119
    .local v3, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 120
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :catch_3
    move-exception v3

    .line 122
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method public getIsReady()Z
    .locals 1

    .prologue
    .line 175
    iget-boolean v0, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->TaskCompleted:Z

    return v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 4
    .param p1, "result"    # Ljava/lang/Void;

    .prologue
    .line 135
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->TaskCompleted:Z

    .line 136
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->filePath:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 137
    const-string v0, "ERROR"

    iput-object v0, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->filePath:Ljava/lang/String;

    .line 138
    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->listener:Lcom/cobra/zufflin/facebook/OnDownloadImageComplete;

    iget-object v1, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->filePath:Ljava/lang/String;

    iget-object v2, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->userID:Ljava/lang/String;

    iget v3, p0, Lcom/cobra/zufflin/facebook/DownloadProfilePictures;->index:I

    invoke-interface {v0, v1, v2, v3, p0}, Lcom/cobra/zufflin/facebook/OnDownloadImageComplete;->onTaskCompleted(Ljava/lang/String;Ljava/lang/String;ILcom/cobra/zufflin/facebook/DownloadProfilePictures;)V

    .line 139
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 0
    .param p1, "progress"    # [Ljava/lang/Integer;

    .prologue
    .line 130
    return-void
.end method
