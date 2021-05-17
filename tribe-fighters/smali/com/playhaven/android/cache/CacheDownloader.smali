.class public Lcom/playhaven/android/cache/CacheDownloader;
.super Ljava/lang/Object;
.source "CacheDownloader.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final BLOCK_SIZE:I = 0x1000


# instance fields
.field private file:Ljava/io/File;

.field private handler:Lcom/playhaven/android/cache/CacheResponseHandler;

.field private url:Ljava/net/URL;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/playhaven/android/cache/CacheResponseHandler;Ljava/io/File;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "handler"    # Lcom/playhaven/android/cache/CacheResponseHandler;
    .param p3, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 65
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2, p3}, Lcom/playhaven/android/cache/CacheDownloader;-><init>(Ljava/net/URL;Lcom/playhaven/android/cache/CacheResponseHandler;Ljava/io/File;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Lcom/playhaven/android/cache/CacheResponseHandler;Ljava/io/File;)V
    .locals 0
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "handler"    # Lcom/playhaven/android/cache/CacheResponseHandler;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Lcom/playhaven/android/cache/CacheDownloader;->url:Ljava/net/URL;

    .line 78
    iput-object p2, p0, Lcom/playhaven/android/cache/CacheDownloader;->handler:Lcom/playhaven/android/cache/CacheResponseHandler;

    .line 79
    iput-object p3, p0, Lcom/playhaven/android/cache/CacheDownloader;->file:Ljava/io/File;

    .line 80
    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    .line 87
    :try_start_0
    const-string v8, "Caching %s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/playhaven/android/cache/CacheDownloader;->url:Ljava/net/URL;

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 92
    iget-object v8, p0, Lcom/playhaven/android/cache/CacheDownloader;->file:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v7

    .line 93
    .local v7, "parentFile":Ljava/io/File;
    if-eqz v7, :cond_0

    .line 95
    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    move-result v8

    if-nez v8, :cond_0

    invoke-virtual {v7}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-nez v8, :cond_0

    .line 96
    new-instance v8, Ljava/io/IOException;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Unable to create directory: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_0
    .catch Lcom/playhaven/android/PlayHavenException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 146
    .end local v7    # "parentFile":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 147
    .local v2, "e":Lcom/playhaven/android/PlayHavenException;
    iget-object v8, p0, Lcom/playhaven/android/cache/CacheDownloader;->handler:Lcom/playhaven/android/cache/CacheResponseHandler;

    iget-object v9, p0, Lcom/playhaven/android/cache/CacheDownloader;->url:Ljava/net/URL;

    invoke-interface {v8, v9, v2}, Lcom/playhaven/android/cache/CacheResponseHandler;->cacheFail(Ljava/net/URL;Lcom/playhaven/android/PlayHavenException;)V

    .line 153
    .end local v2    # "e":Lcom/playhaven/android/PlayHavenException;
    :goto_0
    return-void

    .line 99
    .restart local v7    # "parentFile":Ljava/io/File;
    :cond_0
    :try_start_1
    iget-object v8, p0, Lcom/playhaven/android/cache/CacheDownloader;->url:Ljava/net/URL;

    invoke-virtual {v8}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 103
    .local v1, "connection":Ljava/net/HttpURLConnection;
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-static {v8}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/InputStream;)Ljava/nio/channels/ReadableByteChannel;

    move-result-object v5

    .line 104
    .local v5, "in":Ljava/nio/channels/ReadableByteChannel;
    new-instance v8, Ljava/io/FileOutputStream;

    iget-object v9, p0, Lcom/playhaven/android/cache/CacheDownloader;->file:Ljava/io/File;

    invoke-direct {v8, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-static {v8}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v6

    .line 105
    .local v6, "out":Ljava/nio/channels/WritableByteChannel;
    const/16 v8, 0x1000

    invoke-static {v8}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 111
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    :goto_1
    invoke-interface {v5, v0}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_1

    .line 136
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 137
    :goto_2
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v8

    if-nez v8, :cond_2

    .line 143
    invoke-interface {v6}, Ljava/nio/channels/WritableByteChannel;->close()V

    .line 144
    invoke-interface {v5}, Ljava/nio/channels/ReadableByteChannel;->close()V

    .line 145
    iget-object v8, p0, Lcom/playhaven/android/cache/CacheDownloader;->handler:Lcom/playhaven/android/cache/CacheResponseHandler;

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/playhaven/android/cache/CachedInfo;

    const/4 v10, 0x0

    new-instance v11, Lcom/playhaven/android/cache/CachedInfo;

    iget-object v12, p0, Lcom/playhaven/android/cache/CacheDownloader;->url:Ljava/net/URL;

    iget-object v13, p0, Lcom/playhaven/android/cache/CacheDownloader;->file:Ljava/io/File;

    const/4 v14, 0x1

    invoke-direct {v11, v12, v13, v14}, Lcom/playhaven/android/cache/CachedInfo;-><init>(Ljava/net/URL;Ljava/io/File;Z)V

    aput-object v11, v9, v10

    invoke-interface {v8, v9}, Lcom/playhaven/android/cache/CacheResponseHandler;->cacheSuccess([Lcom/playhaven/android/cache/CachedInfo;)V
    :try_end_1
    .catch Lcom/playhaven/android/PlayHavenException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 148
    .end local v0    # "buffer":Ljava/nio/ByteBuffer;
    .end local v1    # "connection":Ljava/net/HttpURLConnection;
    .end local v5    # "in":Ljava/nio/channels/ReadableByteChannel;
    .end local v6    # "out":Ljava/nio/channels/WritableByteChannel;
    .end local v7    # "parentFile":Ljava/io/File;
    :catch_1
    move-exception v3

    .line 149
    .local v3, "e2":Ljava/io/IOException;
    iget-object v8, p0, Lcom/playhaven/android/cache/CacheDownloader;->handler:Lcom/playhaven/android/cache/CacheResponseHandler;

    iget-object v9, p0, Lcom/playhaven/android/cache/CacheDownloader;->url:Ljava/net/URL;

    new-instance v10, Lcom/playhaven/android/PlayHavenException;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Unable to obtain content: "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v12, p0, Lcom/playhaven/android/cache/CacheDownloader;->url:Ljava/net/URL;

    invoke-virtual {v12}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v3}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {v8, v9, v10}, Lcom/playhaven/android/cache/CacheResponseHandler;->cacheFail(Ljava/net/URL;Lcom/playhaven/android/PlayHavenException;)V

    goto :goto_0

    .line 117
    .end local v3    # "e2":Ljava/io/IOException;
    .restart local v0    # "buffer":Ljava/nio/ByteBuffer;
    .restart local v1    # "connection":Ljava/net/HttpURLConnection;
    .restart local v5    # "in":Ljava/nio/channels/ReadableByteChannel;
    .restart local v6    # "out":Ljava/nio/channels/WritableByteChannel;
    .restart local v7    # "parentFile":Ljava/io/File;
    :cond_1
    :try_start_2
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 123
    invoke-interface {v6, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 130
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;
    :try_end_2
    .catch Lcom/playhaven/android/PlayHavenException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 150
    .end local v0    # "buffer":Ljava/nio/ByteBuffer;
    .end local v1    # "connection":Ljava/net/HttpURLConnection;
    .end local v5    # "in":Ljava/nio/channels/ReadableByteChannel;
    .end local v6    # "out":Ljava/nio/channels/WritableByteChannel;
    .end local v7    # "parentFile":Ljava/io/File;
    :catch_2
    move-exception v4

    .line 151
    .local v4, "e3":Ljava/lang/Exception;
    iget-object v8, p0, Lcom/playhaven/android/cache/CacheDownloader;->handler:Lcom/playhaven/android/cache/CacheResponseHandler;

    iget-object v9, p0, Lcom/playhaven/android/cache/CacheDownloader;->url:Ljava/net/URL;

    new-instance v10, Lcom/playhaven/android/PlayHavenException;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Unable to obtain content: "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v12, p0, Lcom/playhaven/android/cache/CacheDownloader;->url:Ljava/net/URL;

    invoke-virtual {v12}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-direct {v10, v11, v12}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {v8, v9, v10}, Lcom/playhaven/android/cache/CacheResponseHandler;->cacheFail(Ljava/net/URL;Lcom/playhaven/android/PlayHavenException;)V

    goto/16 :goto_0

    .line 138
    .end local v4    # "e3":Ljava/lang/Exception;
    .restart local v0    # "buffer":Ljava/nio/ByteBuffer;
    .restart local v1    # "connection":Ljava/net/HttpURLConnection;
    .restart local v5    # "in":Ljava/nio/channels/ReadableByteChannel;
    .restart local v6    # "out":Ljava/nio/channels/WritableByteChannel;
    .restart local v7    # "parentFile":Ljava/io/File;
    :cond_2
    :try_start_3
    invoke-interface {v6, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I
    :try_end_3
    .catch Lcom/playhaven/android/PlayHavenException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_2
.end method
