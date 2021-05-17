.class public Lcom/amazon/ags/html5/content/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.java"


# static fields
.field private static final BYTES_PER_KILOBYTE:I = 0x400

.field private static final DOWNLOAD_BUFFER_SIZE_BYTES:I = 0x2000

.field private static final DOWNLOAD_CONNECTION_TIMEOUT_MS:I = 0x7d0

.field private static final DOWNLOAD_READ_TIMEOUT_MS:I = 0x7d0

.field private static final MAX_DOWNLOAD_TIME_MS:I = 0x1388

.field private static final TAG:Ljava/lang/String;

.field private static final ZIP_BUFFER_SIZE:I = 0x800


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/html5/content/FileUtils;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method public static declared-synchronized copyResourceContentIntoDirectory(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "resourceName"    # Ljava/lang/String;
    .param p2, "destinationName"    # Ljava/lang/String;
    .param p3, "destinationDir"    # Ljava/lang/String;

    .prologue
    .line 62
    const-class v10, Lcom/amazon/ags/html5/content/FileUtils;

    monitor-enter v10

    const/4 v2, 0x1

    .line 64
    .local v2, "copySuccessful":Z
    const/4 v5, 0x0

    .line 65
    .local v5, "fileOutputStream":Ljava/io/OutputStream;
    const/4 v7, 0x0

    .line 68
    .local v7, "inputStream":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 69
    .local v8, "res":Landroid/content/res/Resources;
    const-string v9, "raw"

    invoke-static {p0, v9, p1}, Lcom/amazon/ags/html5/util/ResourceUtils;->getIdentifier(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v7

    .line 71
    new-instance v9, Ljava/io/File;

    move-object/from16 v0, p3

    invoke-direct {v9, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v9}, Lcom/amazon/ags/html5/content/FileUtils;->ensureDirectoryExists(Ljava/io/File;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v9

    if-nez v9, :cond_2

    .line 72
    const/4 v9, 0x0

    .line 88
    if-eqz v7, :cond_0

    .line 89
    :try_start_1
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 91
    :cond_0
    if-eqz v5, :cond_1

    .line 92
    invoke-virtual {v5}, Ljava/io/OutputStream;->flush()V

    .line 93
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 101
    .end local v8    # "res":Landroid/content/res/Resources;
    :cond_1
    :goto_0
    monitor-exit v10

    return v9

    .line 95
    .restart local v8    # "res":Landroid/content/res/Resources;
    :catch_0
    move-exception v3

    .line 96
    .local v3, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    .line 97
    :try_start_2
    sget-object v11, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "An error occurred while cleaning up resource copy operation for resource: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 62
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v8    # "res":Landroid/content/res/Resources;
    :catchall_0
    move-exception v9

    :goto_1
    monitor-exit v10

    throw v9

    .line 75
    .restart local v8    # "res":Landroid/content/res/Resources;
    :cond_2
    :try_start_3
    new-instance v6, Ljava/io/FileOutputStream;

    new-instance v9, Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    sget-object v12, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 77
    .end local v5    # "fileOutputStream":Ljava/io/OutputStream;
    .local v6, "fileOutputStream":Ljava/io/OutputStream;
    const/4 v1, 0x0

    .line 78
    .local v1, "bytesRead":I
    const/16 v9, 0x400

    :try_start_4
    new-array v4, v9, [B

    .line 80
    .local v4, "fileBytes":[B
    :goto_2
    invoke-virtual {v7, v4}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v9, -0x1

    if-eq v1, v9, :cond_5

    .line 81
    const/4 v9, 0x0

    invoke-virtual {v6, v4, v9, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_2

    .line 83
    .end local v4    # "fileBytes":[B
    :catch_1
    move-exception v3

    move-object v5, v6

    .line 84
    .end local v1    # "bytesRead":I
    .end local v6    # "fileOutputStream":Ljava/io/OutputStream;
    .end local v8    # "res":Landroid/content/res/Resources;
    .restart local v3    # "e":Ljava/lang/Exception;
    .restart local v5    # "fileOutputStream":Ljava/io/OutputStream;
    :goto_3
    const/4 v2, 0x0

    .line 85
    :try_start_5
    sget-object v9, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "An error occurred while attempting to access resource: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 88
    if-eqz v7, :cond_3

    .line 89
    :try_start_6
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 91
    :cond_3
    if-eqz v5, :cond_4

    .line 92
    invoke-virtual {v5}, Ljava/io/OutputStream;->flush()V

    .line 93
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .end local v3    # "e":Ljava/lang/Exception;
    :cond_4
    :goto_4
    move v9, v2

    .line 101
    goto :goto_0

    .line 88
    .end local v5    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v1    # "bytesRead":I
    .restart local v4    # "fileBytes":[B
    .restart local v6    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v8    # "res":Landroid/content/res/Resources;
    :cond_5
    if-eqz v7, :cond_6

    .line 89
    :try_start_7
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 91
    :cond_6
    if-eqz v6, :cond_7

    .line 92
    invoke-virtual {v6}, Ljava/io/OutputStream;->flush()V

    .line 93
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    :cond_7
    move-object v5, v6

    .line 98
    .end local v6    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v5    # "fileOutputStream":Ljava/io/OutputStream;
    goto :goto_4

    .line 95
    .end local v5    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v6    # "fileOutputStream":Ljava/io/OutputStream;
    :catch_2
    move-exception v3

    .line 96
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    .line 97
    :try_start_8
    sget-object v9, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "An error occurred while cleaning up resource copy operation for resource: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    move-object v5, v6

    .line 99
    .end local v6    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v5    # "fileOutputStream":Ljava/io/OutputStream;
    goto :goto_4

    .line 95
    .end local v1    # "bytesRead":I
    .end local v4    # "fileBytes":[B
    .end local v8    # "res":Landroid/content/res/Resources;
    :catch_3
    move-exception v3

    .line 96
    const/4 v2, 0x0

    .line 97
    :try_start_9
    sget-object v9, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "An error occurred while cleaning up resource copy operation for resource: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_4

    .line 87
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_1
    move-exception v9

    .line 88
    :goto_5
    if-eqz v7, :cond_8

    .line 89
    :try_start_a
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 91
    :cond_8
    if-eqz v5, :cond_9

    .line 92
    invoke-virtual {v5}, Ljava/io/OutputStream;->flush()V

    .line 93
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 98
    :cond_9
    :goto_6
    :try_start_b
    throw v9

    .line 95
    :catch_4
    move-exception v3

    .line 96
    .restart local v3    # "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    .line 97
    sget-object v11, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "An error occurred while cleaning up resource copy operation for resource: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto :goto_6

    .line 87
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v5    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v1    # "bytesRead":I
    .restart local v6    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v8    # "res":Landroid/content/res/Resources;
    :catchall_2
    move-exception v9

    move-object v5, v6

    .end local v6    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v5    # "fileOutputStream":Ljava/io/OutputStream;
    goto :goto_5

    .line 83
    .end local v1    # "bytesRead":I
    .end local v8    # "res":Landroid/content/res/Resources;
    :catch_5
    move-exception v3

    goto/16 :goto_3

    .line 62
    .end local v5    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v1    # "bytesRead":I
    .restart local v4    # "fileBytes":[B
    .restart local v6    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v8    # "res":Landroid/content/res/Resources;
    :catchall_3
    move-exception v9

    move-object v5, v6

    .end local v6    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v5    # "fileOutputStream":Ljava/io/OutputStream;
    goto/16 :goto_1
.end method

.method public static declared-synchronized deleteDirectory(Ljava/io/File;)Z
    .locals 9
    .param p0, "directory"    # Ljava/io/File;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 105
    const-class v7, Lcom/amazon/ags/html5/content/FileUtils;

    monitor-enter v7

    const/4 v1, 0x1

    .line 107
    .local v1, "deletionSuccessful":Z
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    if-nez v8, :cond_0

    .line 136
    :goto_0
    monitor-exit v7

    return v5

    .line 111
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->canWrite()Z

    move-result v5

    if-nez v5, :cond_1

    .line 112
    const/4 v5, 0x1

    invoke-virtual {p0, v5}, Ljava/io/File;->setWritable(Z)Z

    move-result v5

    if-nez v5, :cond_1

    move v5, v6

    .line 113
    goto :goto_0

    .line 116
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 117
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_5

    aget-object v2, v0, v3

    .line 118
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 119
    invoke-static {v2}, Lcom/amazon/ags/html5/content/FileUtils;->deleteDirectory(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_4

    move v5, v6

    .line 120
    goto :goto_0

    .line 123
    :cond_2
    invoke-virtual {v2}, Ljava/io/File;->canWrite()Z

    move-result v5

    if-nez v5, :cond_3

    .line 124
    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Ljava/io/File;->setWritable(Z)Z

    move-result v5

    if-nez v5, :cond_3

    move v5, v6

    .line 125
    goto :goto_0

    .line 128
    :cond_3
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v5

    if-nez v5, :cond_4

    move v5, v6

    .line 129
    goto :goto_0

    .line 117
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 133
    .end local v2    # "file":Ljava/io/File;
    :cond_5
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    .end local v0    # "arr$":[Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_6
    move v5, v1

    .line 136
    goto :goto_0

    .line 105
    :catchall_0
    move-exception v5

    monitor-exit v7

    throw v5
.end method

.method public static declared-synchronized downloadFile(Ljava/lang/String;Ljava/lang/String;J)Z
    .locals 21
    .param p0, "urlString"    # Ljava/lang/String;
    .param p1, "destinationFile"    # Ljava/lang/String;
    .param p2, "timeoutMS"    # J

    .prologue
    .line 219
    const-class v18, Lcom/amazon/ags/html5/content/FileUtils;

    monitor-enter v18

    const/4 v13, 0x0

    .line 221
    .local v13, "isDownloadSuccessful":Z
    const/4 v11, 0x0

    .line 222
    .local v11, "inputStream":Ljava/io/InputStream;
    const/4 v14, 0x0

    .line 225
    .local v14, "outputStream":Ljava/io/OutputStream;
    :try_start_0
    new-instance v8, Ljava/net/URL;

    move-object/from16 v0, p0

    invoke-direct {v8, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 226
    .local v8, "downloadURL":Ljava/net/URL;
    invoke-virtual {v8}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v9

    .line 227
    .local v9, "downloadURLConnection":Ljava/net/URLConnection;
    const/16 v17, 0x7d0

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 228
    const/16 v17, 0x7d0

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 229
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 230
    invoke-virtual {v9}, Ljava/net/URLConnection;->connect()V

    .line 232
    invoke-virtual {v9}, Ljava/net/URLConnection;->getContentLength()I

    move-result v16

    .line 233
    .local v16, "totalFileSize":I
    new-instance v12, Ljava/io/BufferedInputStream;

    invoke-virtual {v8}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v17

    const/16 v19, 0x2000

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-direct {v12, v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 235
    .end local v11    # "inputStream":Ljava/io/InputStream;
    .local v12, "inputStream":Ljava/io/InputStream;
    :try_start_1
    new-instance v15, Ljava/io/FileOutputStream;

    move-object/from16 v0, p1

    invoke-direct {v15, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 236
    .end local v14    # "outputStream":Ljava/io/OutputStream;
    .local v15, "outputStream":Ljava/io/OutputStream;
    const/16 v17, 0x400

    :try_start_2
    move/from16 v0, v17

    new-array v5, v0, [B

    .line 237
    .local v5, "downloadData":[B
    const-wide/16 v3, 0x0

    .line 239
    .local v3, "bytesDownloaded":J
    const/4 v2, 0x0

    .line 241
    .local v2, "byteCount":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 242
    .local v6, "downloadStartTime":J
    :cond_0
    invoke-virtual {v12, v5}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v2, v0, :cond_1

    .line 243
    int-to-long v0, v2

    move-wide/from16 v19, v0

    add-long v3, v3, v19

    .line 244
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v15, v5, v0, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 245
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v19

    sub-long v19, v19, v6

    cmp-long v17, v19, p2

    if-ltz v17, :cond_0

    .line 246
    sget-object v17, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v19, "Maximum time to download file exceeded.  Aborting download."

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 250
    :cond_1
    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v19, v0

    cmp-long v17, v3, v19

    if-nez v17, :cond_2

    .line 251
    const/4 v13, 0x1

    .line 257
    :cond_2
    if-eqz v15, :cond_3

    .line 258
    :try_start_3
    invoke-virtual {v15}, Ljava/io/OutputStream;->flush()V

    .line 259
    invoke-virtual {v15}, Ljava/io/OutputStream;->close()V

    .line 261
    :cond_3
    if-eqz v12, :cond_4

    .line 262
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    :cond_4
    move-object v14, v15

    .end local v15    # "outputStream":Ljava/io/OutputStream;
    .restart local v14    # "outputStream":Ljava/io/OutputStream;
    move-object v11, v12

    .line 269
    .end local v2    # "byteCount":I
    .end local v3    # "bytesDownloaded":J
    .end local v5    # "downloadData":[B
    .end local v6    # "downloadStartTime":J
    .end local v8    # "downloadURL":Ljava/net/URL;
    .end local v9    # "downloadURLConnection":Ljava/net/URLConnection;
    .end local v12    # "inputStream":Ljava/io/InputStream;
    .end local v16    # "totalFileSize":I
    .restart local v11    # "inputStream":Ljava/io/InputStream;
    :cond_5
    :goto_0
    monitor-exit v18

    return v13

    .line 264
    .end local v11    # "inputStream":Ljava/io/InputStream;
    .end local v14    # "outputStream":Ljava/io/OutputStream;
    .restart local v2    # "byteCount":I
    .restart local v3    # "bytesDownloaded":J
    .restart local v5    # "downloadData":[B
    .restart local v6    # "downloadStartTime":J
    .restart local v8    # "downloadURL":Ljava/net/URL;
    .restart local v9    # "downloadURLConnection":Ljava/net/URLConnection;
    .restart local v12    # "inputStream":Ljava/io/InputStream;
    .restart local v15    # "outputStream":Ljava/io/OutputStream;
    .restart local v16    # "totalFileSize":I
    :catch_0
    move-exception v10

    .line 265
    .local v10, "e":Ljava/lang/Exception;
    :try_start_4
    sget-object v17, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v19, "Error encountered during post-download cleanup"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-static {v0, v1, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    move-object v14, v15

    .end local v15    # "outputStream":Ljava/io/OutputStream;
    .restart local v14    # "outputStream":Ljava/io/OutputStream;
    move-object v11, v12

    .line 267
    .end local v12    # "inputStream":Ljava/io/InputStream;
    .restart local v11    # "inputStream":Ljava/io/InputStream;
    goto :goto_0

    .line 253
    .end local v2    # "byteCount":I
    .end local v3    # "bytesDownloaded":J
    .end local v5    # "downloadData":[B
    .end local v6    # "downloadStartTime":J
    .end local v8    # "downloadURL":Ljava/net/URL;
    .end local v9    # "downloadURLConnection":Ljava/net/URLConnection;
    .end local v10    # "e":Ljava/lang/Exception;
    .end local v16    # "totalFileSize":I
    :catch_1
    move-exception v10

    .line 254
    .restart local v10    # "e":Ljava/lang/Exception;
    :goto_1
    :try_start_5
    sget-object v17, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v19, "Error encountered while trying to download file"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-static {v0, v1, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 257
    if-eqz v14, :cond_6

    .line 258
    :try_start_6
    invoke-virtual {v14}, Ljava/io/OutputStream;->flush()V

    .line 259
    invoke-virtual {v14}, Ljava/io/OutputStream;->close()V

    .line 261
    :cond_6
    if-eqz v11, :cond_5

    .line 262
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_0

    .line 264
    :catch_2
    move-exception v10

    .line 265
    :try_start_7
    sget-object v17, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v19, "Error encountered during post-download cleanup"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-static {v0, v1, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_0

    .line 219
    .end local v10    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v17

    :goto_2
    monitor-exit v18

    throw v17

    .line 256
    :catchall_1
    move-exception v17

    .line 257
    :goto_3
    if-eqz v14, :cond_7

    .line 258
    :try_start_8
    invoke-virtual {v14}, Ljava/io/OutputStream;->flush()V

    .line 259
    invoke-virtual {v14}, Ljava/io/OutputStream;->close()V

    .line 261
    :cond_7
    if-eqz v11, :cond_8

    .line 262
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 266
    :cond_8
    :goto_4
    :try_start_9
    throw v17

    .line 264
    :catch_3
    move-exception v10

    .line 265
    .restart local v10    # "e":Ljava/lang/Exception;
    sget-object v19, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v20, "Error encountered during post-download cleanup"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v1, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_4

    .line 256
    .end local v10    # "e":Ljava/lang/Exception;
    .end local v11    # "inputStream":Ljava/io/InputStream;
    .restart local v8    # "downloadURL":Ljava/net/URL;
    .restart local v9    # "downloadURLConnection":Ljava/net/URLConnection;
    .restart local v12    # "inputStream":Ljava/io/InputStream;
    .restart local v16    # "totalFileSize":I
    :catchall_2
    move-exception v17

    move-object v11, v12

    .end local v12    # "inputStream":Ljava/io/InputStream;
    .restart local v11    # "inputStream":Ljava/io/InputStream;
    goto :goto_3

    .end local v11    # "inputStream":Ljava/io/InputStream;
    .end local v14    # "outputStream":Ljava/io/OutputStream;
    .restart local v12    # "inputStream":Ljava/io/InputStream;
    .restart local v15    # "outputStream":Ljava/io/OutputStream;
    :catchall_3
    move-exception v17

    move-object v14, v15

    .end local v15    # "outputStream":Ljava/io/OutputStream;
    .restart local v14    # "outputStream":Ljava/io/OutputStream;
    move-object v11, v12

    .end local v12    # "inputStream":Ljava/io/InputStream;
    .restart local v11    # "inputStream":Ljava/io/InputStream;
    goto :goto_3

    .line 253
    .end local v11    # "inputStream":Ljava/io/InputStream;
    .restart local v12    # "inputStream":Ljava/io/InputStream;
    :catch_4
    move-exception v10

    move-object v11, v12

    .end local v12    # "inputStream":Ljava/io/InputStream;
    .restart local v11    # "inputStream":Ljava/io/InputStream;
    goto :goto_1

    .end local v11    # "inputStream":Ljava/io/InputStream;
    .end local v14    # "outputStream":Ljava/io/OutputStream;
    .restart local v12    # "inputStream":Ljava/io/InputStream;
    .restart local v15    # "outputStream":Ljava/io/OutputStream;
    :catch_5
    move-exception v10

    move-object v14, v15

    .end local v15    # "outputStream":Ljava/io/OutputStream;
    .restart local v14    # "outputStream":Ljava/io/OutputStream;
    move-object v11, v12

    .end local v12    # "inputStream":Ljava/io/InputStream;
    .restart local v11    # "inputStream":Ljava/io/InputStream;
    goto :goto_1

    .line 219
    .end local v11    # "inputStream":Ljava/io/InputStream;
    .end local v14    # "outputStream":Ljava/io/OutputStream;
    .restart local v2    # "byteCount":I
    .restart local v3    # "bytesDownloaded":J
    .restart local v5    # "downloadData":[B
    .restart local v6    # "downloadStartTime":J
    .restart local v12    # "inputStream":Ljava/io/InputStream;
    .restart local v15    # "outputStream":Ljava/io/OutputStream;
    :catchall_4
    move-exception v17

    move-object v14, v15

    .end local v15    # "outputStream":Ljava/io/OutputStream;
    .restart local v14    # "outputStream":Ljava/io/OutputStream;
    move-object v11, v12

    .end local v12    # "inputStream":Ljava/io/InputStream;
    .restart local v11    # "inputStream":Ljava/io/InputStream;
    goto :goto_2
.end method

.method public static declared-synchronized ensureDirectoryExists(Ljava/io/File;)Z
    .locals 3
    .param p0, "dir"    # Ljava/io/File;

    .prologue
    .line 43
    const-class v2, Lcom/amazon/ags/html5/content/FileUtils;

    monitor-enter v2

    if-nez p0, :cond_1

    .line 44
    const/4 v0, 0x0

    .line 58
    :cond_0
    :goto_0
    monitor-exit v2

    return v0

    .line 47
    :cond_1
    const/4 v0, 0x1

    .line 49
    .local v0, "directoryExists":Z
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 50
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 51
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2

    .line 52
    const/4 v0, 0x0

    goto :goto_0

    .line 54
    :cond_2
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/io/File;->setWritable(Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 43
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized extractZipToDirectory(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 21
    .param p0, "zipFileLocation"    # Ljava/lang/String;
    .param p1, "targetDirectory"    # Ljava/lang/String;

    .prologue
    .line 156
    const-class v19, Lcom/amazon/ags/html5/content/FileUtils;

    monitor-enter v19

    :try_start_0
    new-instance v18, Ljava/io/File;

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static/range {v18 .. v18}, Lcom/amazon/ags/html5/content/FileUtils;->ensureDirectoryExists(Ljava/io/File;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v18

    if-nez v18, :cond_1

    .line 157
    const/4 v14, 0x0

    .line 215
    :cond_0
    :goto_0
    monitor-exit v19

    return v14

    .line 162
    :cond_1
    :try_start_1
    new-instance v16, Ljava/util/zip/ZipFile;

    new-instance v18, Ljava/io/File;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 168
    .local v16, "zipFile":Ljava/util/zip/ZipFile;
    const/4 v14, 0x1

    .line 170
    .local v14, "extractionSuccessful":Z
    :try_start_2
    invoke-virtual/range {v16 .. v16}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v17

    .line 171
    .local v17, "zipFileEntries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/util/zip/ZipEntry;>;"
    :cond_2
    :goto_1
    invoke-interface/range {v17 .. v17}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v18

    if-eqz v18, :cond_0

    .line 172
    invoke-interface/range {v17 .. v17}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/zip/ZipEntry;

    .line 173
    .local v8, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v8}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v11

    .line 174
    .local v11, "entryName":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v3, v0, v11}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .local v3, "destFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    .line 176
    .local v4, "destParent":Ljava/io/File;
    invoke-static {v4}, Lcom/amazon/ags/html5/content/FileUtils;->ensureDirectoryExists(Ljava/io/File;)Z

    .line 178
    invoke-virtual {v8}, Ljava/util/zip/ZipEntry;->isDirectory()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v18

    if-nez v18, :cond_2

    .line 179
    const/4 v9, 0x0

    .line 180
    .local v9, "entryInputStream":Ljava/io/BufferedInputStream;
    const/4 v12, 0x0

    .line 181
    .local v12, "entryOutputStream":Ljava/io/FileOutputStream;
    const/4 v5, 0x0

    .line 183
    .local v5, "destinationOutputStream":Ljava/io/BufferedOutputStream;
    :try_start_3
    new-instance v10, Ljava/io/BufferedInputStream;

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v10, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 184
    .end local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    .local v10, "entryInputStream":Ljava/io/BufferedInputStream;
    const/4 v2, 0x0

    .line 185
    .local v2, "bytesRead":I
    const/16 v18, 0x800

    :try_start_4
    move/from16 v0, v18

    new-array v15, v0, [B

    .line 187
    .local v15, "zipData":[B
    new-instance v13, Ljava/io/FileOutputStream;

    invoke-direct {v13, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_6
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 188
    .end local v12    # "entryOutputStream":Ljava/io/FileOutputStream;
    .local v13, "entryOutputStream":Ljava/io/FileOutputStream;
    :try_start_5
    new-instance v6, Ljava/io/BufferedOutputStream;

    const/16 v18, 0x800

    move/from16 v0, v18

    invoke-direct {v6, v13, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_7
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 190
    .end local v5    # "destinationOutputStream":Ljava/io/BufferedOutputStream;
    .local v6, "destinationOutputStream":Ljava/io/BufferedOutputStream;
    :goto_2
    const/16 v18, 0x0

    const/16 v20, 0x800

    :try_start_6
    move/from16 v0, v18

    move/from16 v1, v20

    invoke-virtual {v10, v15, v0, v1}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v2

    const/16 v18, -0x1

    move/from16 v0, v18

    if-eq v2, v0, :cond_4

    .line 191
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v6, v15, v0, v2}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    goto :goto_2

    .line 193
    :catch_0
    move-exception v7

    move-object v5, v6

    .end local v6    # "destinationOutputStream":Ljava/io/BufferedOutputStream;
    .restart local v5    # "destinationOutputStream":Ljava/io/BufferedOutputStream;
    move-object v12, v13

    .end local v13    # "entryOutputStream":Ljava/io/FileOutputStream;
    .restart local v12    # "entryOutputStream":Ljava/io/FileOutputStream;
    move-object v9, v10

    .line 194
    .end local v2    # "bytesRead":I
    .end local v10    # "entryInputStream":Ljava/io/BufferedInputStream;
    .end local v15    # "zipData":[B
    .local v7, "e":Ljava/lang/Exception;
    .restart local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    :goto_3
    const/4 v14, 0x0

    .line 195
    :try_start_7
    sget-object v18, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v20, "An error occurred while performing zip extraction operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 199
    if-eqz v5, :cond_3

    .line 200
    :try_start_8
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->flush()V

    .line 201
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->close()V

    .line 203
    :cond_3
    if-eqz v9, :cond_0

    .line 204
    invoke-virtual {v9}, Ljava/io/BufferedInputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_0

    .line 206
    :catch_1
    move-exception v7

    .line 207
    const/4 v14, 0x0

    .line 208
    :try_start_9
    sget-object v18, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v20, "An error occurred while cleaning up zip extraction operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_0

    .line 156
    .end local v3    # "destFile":Ljava/io/File;
    .end local v4    # "destParent":Ljava/io/File;
    .end local v5    # "destinationOutputStream":Ljava/io/BufferedOutputStream;
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v8    # "entry":Ljava/util/zip/ZipEntry;
    .end local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    .end local v11    # "entryName":Ljava/lang/String;
    .end local v12    # "entryOutputStream":Ljava/io/FileOutputStream;
    .end local v14    # "extractionSuccessful":Z
    .end local v16    # "zipFile":Ljava/util/zip/ZipFile;
    .end local v17    # "zipFileEntries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/util/zip/ZipEntry;>;"
    :catchall_0
    move-exception v18

    monitor-exit v19

    throw v18

    .line 163
    :catch_2
    move-exception v7

    .line 164
    .restart local v7    # "e":Ljava/lang/Exception;
    :try_start_a
    sget-object v18, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v20, "Unable to extract zip file"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 165
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 199
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v2    # "bytesRead":I
    .restart local v3    # "destFile":Ljava/io/File;
    .restart local v4    # "destParent":Ljava/io/File;
    .restart local v6    # "destinationOutputStream":Ljava/io/BufferedOutputStream;
    .restart local v8    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v10    # "entryInputStream":Ljava/io/BufferedInputStream;
    .restart local v11    # "entryName":Ljava/lang/String;
    .restart local v13    # "entryOutputStream":Ljava/io/FileOutputStream;
    .restart local v14    # "extractionSuccessful":Z
    .restart local v15    # "zipData":[B
    .restart local v16    # "zipFile":Ljava/util/zip/ZipFile;
    .restart local v17    # "zipFileEntries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/util/zip/ZipEntry;>;"
    :cond_4
    if-eqz v6, :cond_5

    .line 200
    :try_start_b
    invoke-virtual {v6}, Ljava/io/BufferedOutputStream;->flush()V

    .line 201
    invoke-virtual {v6}, Ljava/io/BufferedOutputStream;->close()V

    .line 203
    :cond_5
    if-eqz v10, :cond_2

    .line 204
    invoke-virtual {v10}, Ljava/io/BufferedInputStream;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_3
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto/16 :goto_1

    .line 206
    :catch_3
    move-exception v7

    .line 207
    .restart local v7    # "e":Ljava/lang/Exception;
    const/4 v14, 0x0

    .line 208
    :try_start_c
    sget-object v18, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v20, "An error occurred while cleaning up zip extraction operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_0

    .line 198
    .end local v2    # "bytesRead":I
    .end local v6    # "destinationOutputStream":Ljava/io/BufferedOutputStream;
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v10    # "entryInputStream":Ljava/io/BufferedInputStream;
    .end local v13    # "entryOutputStream":Ljava/io/FileOutputStream;
    .end local v15    # "zipData":[B
    .restart local v5    # "destinationOutputStream":Ljava/io/BufferedOutputStream;
    .restart local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    .restart local v12    # "entryOutputStream":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v18

    .line 199
    :goto_4
    if-eqz v5, :cond_6

    .line 200
    :try_start_d
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->flush()V

    .line 201
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->close()V

    .line 203
    :cond_6
    if-eqz v9, :cond_7

    .line 204
    invoke-virtual {v9}, Ljava/io/BufferedInputStream;->close()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_4
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 209
    :cond_7
    :try_start_e
    throw v18

    .line 206
    :catch_4
    move-exception v7

    .line 207
    .restart local v7    # "e":Ljava/lang/Exception;
    const/4 v14, 0x0

    .line 208
    sget-object v18, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v20, "An error occurred while cleaning up zip extraction operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto/16 :goto_0

    .line 198
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bytesRead":I
    .restart local v10    # "entryInputStream":Ljava/io/BufferedInputStream;
    :catchall_2
    move-exception v18

    move-object v9, v10

    .end local v10    # "entryInputStream":Ljava/io/BufferedInputStream;
    .restart local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    goto :goto_4

    .end local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    .end local v12    # "entryOutputStream":Ljava/io/FileOutputStream;
    .restart local v10    # "entryInputStream":Ljava/io/BufferedInputStream;
    .restart local v13    # "entryOutputStream":Ljava/io/FileOutputStream;
    .restart local v15    # "zipData":[B
    :catchall_3
    move-exception v18

    move-object v12, v13

    .end local v13    # "entryOutputStream":Ljava/io/FileOutputStream;
    .restart local v12    # "entryOutputStream":Ljava/io/FileOutputStream;
    move-object v9, v10

    .end local v10    # "entryInputStream":Ljava/io/BufferedInputStream;
    .restart local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    goto :goto_4

    .end local v5    # "destinationOutputStream":Ljava/io/BufferedOutputStream;
    .end local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    .end local v12    # "entryOutputStream":Ljava/io/FileOutputStream;
    .restart local v6    # "destinationOutputStream":Ljava/io/BufferedOutputStream;
    .restart local v10    # "entryInputStream":Ljava/io/BufferedInputStream;
    .restart local v13    # "entryOutputStream":Ljava/io/FileOutputStream;
    :catchall_4
    move-exception v18

    move-object v5, v6

    .end local v6    # "destinationOutputStream":Ljava/io/BufferedOutputStream;
    .restart local v5    # "destinationOutputStream":Ljava/io/BufferedOutputStream;
    move-object v12, v13

    .end local v13    # "entryOutputStream":Ljava/io/FileOutputStream;
    .restart local v12    # "entryOutputStream":Ljava/io/FileOutputStream;
    move-object v9, v10

    .end local v10    # "entryInputStream":Ljava/io/BufferedInputStream;
    .restart local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    goto :goto_4

    .line 193
    .end local v2    # "bytesRead":I
    .end local v15    # "zipData":[B
    :catch_5
    move-exception v7

    goto/16 :goto_3

    .end local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bytesRead":I
    .restart local v10    # "entryInputStream":Ljava/io/BufferedInputStream;
    :catch_6
    move-exception v7

    move-object v9, v10

    .end local v10    # "entryInputStream":Ljava/io/BufferedInputStream;
    .restart local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    goto/16 :goto_3

    .end local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    .end local v12    # "entryOutputStream":Ljava/io/FileOutputStream;
    .restart local v10    # "entryInputStream":Ljava/io/BufferedInputStream;
    .restart local v13    # "entryOutputStream":Ljava/io/FileOutputStream;
    .restart local v15    # "zipData":[B
    :catch_7
    move-exception v7

    move-object v12, v13

    .end local v13    # "entryOutputStream":Ljava/io/FileOutputStream;
    .restart local v12    # "entryOutputStream":Ljava/io/FileOutputStream;
    move-object v9, v10

    .end local v10    # "entryInputStream":Ljava/io/BufferedInputStream;
    .restart local v9    # "entryInputStream":Ljava/io/BufferedInputStream;
    goto/16 :goto_3
.end method

.method public static declared-synchronized getDirectorySize(Ljava/io/File;)J
    .locals 10
    .param p0, "directory"    # Ljava/io/File;

    .prologue
    .line 343
    const-class v7, Lcom/amazon/ags/html5/content/FileUtils;

    monitor-enter v7

    const-wide/16 v4, 0x0

    .line 344
    .local v4, "length":J
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "arr$":[Ljava/io/File;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 345
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 346
    invoke-static {v1}, Lcom/amazon/ags/html5/content/FileUtils;->getDirectorySize(Ljava/io/File;)J

    move-result-wide v8

    add-long/2addr v4, v8

    .line 344
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 348
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->length()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v8

    add-long/2addr v4, v8

    goto :goto_1

    .line 351
    .end local v1    # "file":Ljava/io/File;
    :cond_1
    monitor-exit v7

    return-wide v4

    .line 343
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :catchall_0
    move-exception v6

    monitor-exit v7

    throw v6
.end method

.method public static declared-synchronized getMD5ChecksumForFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .param p0, "targetFile"    # Ljava/lang/String;

    .prologue
    .line 307
    const-class v11, Lcom/amazon/ags/html5/content/FileUtils;

    monitor-enter v11

    const/4 v0, 0x0

    .line 308
    .local v0, "checksum":Ljava/lang/String;
    :try_start_0
    invoke-static {p0}, Lcom/amazon/ags/html5/content/FileUtils;->readFileBytes(Ljava/lang/String;)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v5

    .line 309
    .local v5, "fileBytes":[B
    if-nez v5, :cond_0

    move-object v1, v0

    .line 339
    .end local v0    # "checksum":Ljava/lang/String;
    .local v1, "checksum":Ljava/lang/String;
    :goto_0
    monitor-exit v11

    return-object v1

    .line 313
    .end local v1    # "checksum":Ljava/lang/String;
    .restart local v0    # "checksum":Ljava/lang/String;
    :cond_0
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 315
    .local v2, "checksumSb":Ljava/lang/StringBuilder;
    :try_start_2
    const-string v10, "MD5"

    invoke-static {v10}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v8

    .line 316
    .local v8, "messageDigest":Ljava/security/MessageDigest;
    invoke-virtual {v8}, Ljava/security/MessageDigest;->reset()V

    .line 317
    invoke-virtual {v8, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 318
    invoke-virtual {v8}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    .line 319
    .local v3, "digestBytes":[B
    new-instance v10, Ljava/math/BigInteger;

    const/4 v12, 0x1

    invoke-direct {v10, v12, v3}, Ljava/math/BigInteger;-><init>(I[B)V

    const/16 v12, 0x10

    invoke-virtual {v10, v12}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v9

    .line 321
    .local v9, "tmpMD5":Ljava/lang/String;
    if-eqz v9, :cond_2

    .line 322
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    rsub-int/lit8 v7, v10, 0x20

    .line 323
    .local v7, "leadingZeroesMissing":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    if-ge v6, v7, :cond_1

    .line 324
    const/16 v10, 0x30

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 323
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 326
    :cond_1
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    .end local v6    # "i":I
    .end local v7    # "leadingZeroesMissing":I
    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    .line 334
    .end local v3    # "digestBytes":[B
    .end local v8    # "messageDigest":Ljava/security/MessageDigest;
    .end local v9    # "tmpMD5":Ljava/lang/String;
    :goto_2
    if-eqz v0, :cond_3

    :try_start_3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v10

    const/16 v12, 0x20

    if-eq v10, v12, :cond_3

    .line 335
    sget-object v10, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Invalid checksum calculated.  Discarding result: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    const/4 v0, 0x0

    :cond_3
    move-object v1, v0

    .line 339
    .end local v0    # "checksum":Ljava/lang/String;
    .restart local v1    # "checksum":Ljava/lang/String;
    goto :goto_0

    .line 329
    .end local v1    # "checksum":Ljava/lang/String;
    .restart local v0    # "checksum":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 330
    .local v4, "e":Ljava/lang/Exception;
    sget-object v10, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v12, "Error encountered during checksum calculation"

    invoke-static {v10, v12, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 331
    const/4 v0, 0x0

    goto :goto_2

    .line 307
    .end local v2    # "checksumSb":Ljava/lang/StringBuilder;
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v5    # "fileBytes":[B
    :catchall_0
    move-exception v10

    monitor-exit v11

    throw v10
.end method

.method public static declared-synchronized readFileBytes(Ljava/lang/String;)[B
    .locals 13
    .param p0, "fileLocation"    # Ljava/lang/String;

    .prologue
    .line 273
    const-class v10, Lcom/amazon/ags/html5/content/FileUtils;

    monitor-enter v10

    const/4 v4, 0x0

    .line 274
    .local v4, "fileBytes":[B
    :try_start_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 275
    .local v3, "file":Ljava/io/File;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-virtual {v3}, Ljava/io/File;->canRead()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v9

    if-nez v9, :cond_1

    :cond_0
    move-object v5, v4

    .line 303
    .end local v4    # "fileBytes":[B
    .local v5, "fileBytes":[B
    :goto_0
    monitor-exit v10

    return-object v5

    .line 279
    .end local v5    # "fileBytes":[B
    .restart local v4    # "fileBytes":[B
    :cond_1
    const/4 v7, 0x0

    .line 281
    .local v7, "inputStream":Ljava/io/InputStream;
    :try_start_1
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 282
    .end local v7    # "inputStream":Ljava/io/InputStream;
    .local v8, "inputStream":Ljava/io/InputStream;
    :try_start_2
    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v11

    long-to-int v6, v11

    .line 283
    .local v6, "fileSizeBytes":I
    new-array v4, v6, [B

    .line 285
    const/4 v0, 0x0

    .line 286
    .local v0, "byteOffset":I
    :goto_1
    if-ge v0, v6, :cond_2

    .line 287
    sub-int v9, v6, v0

    invoke-virtual {v8, v4, v0, v9}, Ljava/io/InputStream;->read([BII)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result v1

    .line 288
    .local v1, "bytesRead":I
    add-int/2addr v0, v1

    .line 289
    goto :goto_1

    .line 294
    .end local v1    # "bytesRead":I
    :cond_2
    if-eqz v8, :cond_5

    .line 296
    :try_start_3
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v7, v8

    .end local v0    # "byteOffset":I
    .end local v6    # "fileSizeBytes":I
    .end local v8    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    :cond_3
    :goto_2
    move-object v5, v4

    .line 303
    .end local v4    # "fileBytes":[B
    .restart local v5    # "fileBytes":[B
    goto :goto_0

    .line 297
    .end local v5    # "fileBytes":[B
    .end local v7    # "inputStream":Ljava/io/InputStream;
    .restart local v0    # "byteOffset":I
    .restart local v4    # "fileBytes":[B
    .restart local v6    # "fileSizeBytes":I
    .restart local v8    # "inputStream":Ljava/io/InputStream;
    :catch_0
    move-exception v2

    .line 298
    .local v2, "e":Ljava/lang/Exception;
    :try_start_4
    sget-object v9, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v11, "Error encountered during post file-to-byte conversion cleanup"

    invoke-static {v9, v11, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object v7, v8

    .line 299
    .end local v8    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    goto :goto_2

    .line 290
    .end local v0    # "byteOffset":I
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v6    # "fileSizeBytes":I
    :catch_1
    move-exception v2

    .line 291
    .restart local v2    # "e":Ljava/lang/Exception;
    :goto_3
    :try_start_5
    sget-object v9, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v11, "Error encountered when decoding file to bytes"

    invoke-static {v9, v11, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 292
    const/4 v4, 0x0

    .line 294
    if-eqz v7, :cond_3

    .line 296
    :try_start_6
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_2

    .line 297
    :catch_2
    move-exception v2

    .line 298
    :try_start_7
    sget-object v9, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v11, "Error encountered during post file-to-byte conversion cleanup"

    invoke-static {v9, v11, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_2

    .line 273
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "file":Ljava/io/File;
    .end local v7    # "inputStream":Ljava/io/InputStream;
    :catchall_0
    move-exception v9

    monitor-exit v10

    throw v9

    .line 294
    .restart local v3    # "file":Ljava/io/File;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    :catchall_1
    move-exception v9

    :goto_4
    if-eqz v7, :cond_4

    .line 296
    :try_start_8
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 299
    :cond_4
    :goto_5
    :try_start_9
    throw v9

    .line 297
    :catch_3
    move-exception v2

    .line 298
    .restart local v2    # "e":Ljava/lang/Exception;
    sget-object v11, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    const-string v12, "Error encountered during post file-to-byte conversion cleanup"

    invoke-static {v11, v12, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_5

    .line 294
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v7    # "inputStream":Ljava/io/InputStream;
    .restart local v8    # "inputStream":Ljava/io/InputStream;
    :catchall_2
    move-exception v9

    move-object v7, v8

    .end local v8    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    goto :goto_4

    .line 290
    .end local v7    # "inputStream":Ljava/io/InputStream;
    .restart local v8    # "inputStream":Ljava/io/InputStream;
    :catch_4
    move-exception v2

    move-object v7, v8

    .end local v8    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    goto :goto_3

    .end local v7    # "inputStream":Ljava/io/InputStream;
    .restart local v0    # "byteOffset":I
    .restart local v6    # "fileSizeBytes":I
    .restart local v8    # "inputStream":Ljava/io/InputStream;
    :cond_5
    move-object v7, v8

    .end local v8    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "inputStream":Ljava/io/InputStream;
    goto :goto_2
.end method

.method public static declared-synchronized renameDirectory(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8
    .param p0, "directory"    # Ljava/lang/String;
    .param p1, "newDirectory"    # Ljava/lang/String;

    .prologue
    .line 140
    const-class v5, Lcom/amazon/ags/html5/content/FileUtils;

    monitor-enter v5

    const/4 v3, 0x0

    .line 142
    .local v3, "result":Z
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 143
    .local v1, "file":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    .local v2, "file2":Ljava/io/File;
    :try_start_1
    invoke-virtual {v1, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v3

    .line 151
    :goto_0
    monitor-exit v5

    return v3

    .line 147
    :catch_0
    move-exception v0

    .line 148
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v4, Lcom/amazon/ags/html5/content/FileUtils;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error occurred while trying to rename directory ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") to ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 140
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "file2":Ljava/io/File;
    :catchall_0
    move-exception v4

    monitor-exit v5

    throw v4
.end method
