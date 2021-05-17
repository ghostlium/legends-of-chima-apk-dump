.class Lcom/amazon/insights/delivery/FileEventStore$1;
.super Ljava/lang/Object;
.source "FileEventStore.java"

# interfaces
.implements Lcom/amazon/insights/delivery/EventStore$EventIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/insights/delivery/FileEventStore;->iterator()Lcom/amazon/insights/delivery/EventStore$EventIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field isEndOfFile:Z

.field linesRead:I

.field nextBuffer:Ljava/lang/String;

.field reader:Lcom/amazon/insights/core/io/EncryptedBufferedReader;

.field final synthetic this$0:Lcom/amazon/insights/delivery/FileEventStore;


# direct methods
.method constructor <init>(Lcom/amazon/insights/delivery/FileEventStore;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 262
    iput-object p1, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 263
    iput v0, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->linesRead:I

    .line 264
    iput-object v1, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->nextBuffer:Ljava/lang/String;

    .line 265
    iput-object v1, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->reader:Lcom/amazon/insights/core/io/EncryptedBufferedReader;

    .line 266
    iput-boolean v0, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->isEndOfFile:Z

    return-void
.end method

.method private resetReader()V
    .locals 1

    .prologue
    .line 412
    invoke-direct {p0}, Lcom/amazon/insights/delivery/FileEventStore$1;->tryCloseReader()V

    .line 413
    const/4 v0, 0x0

    iput v0, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->linesRead:I

    .line 414
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->nextBuffer:Ljava/lang/String;

    .line 415
    return-void
.end method

.method private tryCloseReader()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 291
    iget-object v1, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->reader:Lcom/amazon/insights/core/io/EncryptedBufferedReader;

    if-eqz v1, :cond_0

    .line 293
    :try_start_0
    iget-object v1, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->reader:Lcom/amazon/insights/core/io/EncryptedBufferedReader;

    invoke-virtual {v1}, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 297
    iput-object v3, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->reader:Lcom/amazon/insights/core/io/EncryptedBufferedReader;

    .line 300
    :cond_0
    :goto_0
    return-void

    .line 294
    :catch_0
    move-exception v0

    .line 295
    .local v0, "ioe":Ljava/io/IOException;
    :try_start_1
    invoke-static {}, Lcom/amazon/insights/delivery/FileEventStore;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v1

    const-string v2, "Unable to close reader for events file"

    invoke-virtual {v1, v2, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 297
    iput-object v3, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->reader:Lcom/amazon/insights/core/io/EncryptedBufferedReader;

    goto :goto_0

    .end local v0    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    iput-object v3, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->reader:Lcom/amazon/insights/core/io/EncryptedBufferedReader;

    throw v1
.end method

.method private tryOpenReader()Z
    .locals 7

    .prologue
    const/4 v4, 0x1

    .line 269
    iget-object v5, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->reader:Lcom/amazon/insights/core/io/EncryptedBufferedReader;

    if-eqz v5, :cond_0

    .line 287
    :goto_0
    return v4

    .line 273
    :cond_0
    iget-boolean v5, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->isEndOfFile:Z

    if-nez v5, :cond_1

    .line 274
    const/4 v2, 0x0

    .line 276
    .local v2, "streamReader":Ljava/io/InputStreamReader;
    :try_start_0
    new-instance v3, Ljava/io/InputStreamReader;

    iget-object v5, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v5}, Lcom/amazon/insights/delivery/FileEventStore;->access$100(Lcom/amazon/insights/delivery/FileEventStore;)Lcom/amazon/insights/core/InsightsContext;

    move-result-object v5

    invoke-interface {v5}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v5

    invoke-interface {v5}, Lcom/amazon/insights/core/system/System;->getFileManager()Lcom/amazon/insights/core/system/FileManager;

    move-result-object v5

    iget-object v6, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v6}, Lcom/amazon/insights/delivery/FileEventStore;->access$000(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/io/File;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/amazon/insights/core/system/FileManager;->newInputStream(Ljava/io/File;)Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2    # "streamReader":Ljava/io/InputStreamReader;
    .local v3, "streamReader":Ljava/io/InputStreamReader;
    move-object v2, v3

    .line 281
    .end local v3    # "streamReader":Ljava/io/InputStreamReader;
    .restart local v2    # "streamReader":Ljava/io/InputStreamReader;
    :goto_1
    if-eqz v2, :cond_1

    .line 282
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 283
    .local v0, "bufferedReader":Ljava/io/BufferedReader;
    new-instance v5, Lcom/amazon/insights/core/io/EncryptedBufferedReader;

    iget-object v6, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v6}, Lcom/amazon/insights/delivery/FileEventStore;->access$300(Lcom/amazon/insights/delivery/FileEventStore;)Ljavax/crypto/SecretKey;

    move-result-object v6

    invoke-direct {v5, v0, v6}, Lcom/amazon/insights/core/io/EncryptedBufferedReader;-><init>(Ljava/io/BufferedReader;Ljavax/crypto/SecretKey;)V

    iput-object v5, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->reader:Lcom/amazon/insights/core/io/EncryptedBufferedReader;

    goto :goto_0

    .line 277
    .end local v0    # "bufferedReader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v1

    .line 278
    .local v1, "e":Ljava/io/FileNotFoundException;
    invoke-static {}, Lcom/amazon/insights/delivery/FileEventStore;->access$200()Lcom/amazon/insights/core/log/Logger;

    move-result-object v5

    const-string v6, "Could not open the events file"

    invoke-virtual {v5, v6, v1}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 287
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    .end local v2    # "streamReader":Ljava/io/InputStreamReader;
    :cond_1
    const/4 v4, 0x0

    goto :goto_0
.end method


# virtual methods
.method public hasNext()Z
    .locals 6

    .prologue
    .line 304
    const/4 v2, 0x0

    .line 305
    .local v2, "hasNext":Z
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v4}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 308
    :try_start_0
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->nextBuffer:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_0

    .line 309
    const/4 v2, 0x1

    .line 340
    :goto_0
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v4}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    move v3, v2

    .end local v2    # "hasNext":Z
    .local v3, "hasNext":I
    :goto_1
    return v3

    .line 311
    .end local v3    # "hasNext":I
    .restart local v2    # "hasNext":Z
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/amazon/insights/delivery/FileEventStore$1;->tryOpenReader()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    if-nez v4, :cond_1

    .line 340
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v4}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    move v3, v2

    .restart local v3    # "hasNext":I
    goto :goto_1

    .line 315
    .end local v3    # "hasNext":I
    :cond_1
    const/4 v1, 0x0

    .line 316
    .local v1, "found":Z
    :goto_2
    if-nez v1, :cond_2

    .line 318
    :try_start_2
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->reader:Lcom/amazon/insights/core/io/EncryptedBufferedReader;

    invoke-virtual {v4}, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->nextBuffer:Ljava/lang/String;
    :try_end_2
    .catch Lcom/amazon/insights/core/io/DecryptionException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 319
    const/4 v1, 0x1

    goto :goto_2

    .line 320
    :catch_0
    move-exception v0

    .line 322
    .local v0, "e":Lcom/amazon/insights/core/io/DecryptionException;
    :try_start_3
    iget v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->linesRead:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->linesRead:I

    .line 323
    const/4 v1, 0x0

    .line 327
    goto :goto_2

    .line 324
    .end local v0    # "e":Lcom/amazon/insights/core/io/DecryptionException;
    :catch_1
    move-exception v0

    .line 325
    .local v0, "e":Ljava/io/IOException;
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->nextBuffer:Ljava/lang/String;

    .line 326
    const/4 v1, 0x1

    .line 327
    goto :goto_2

    .line 329
    .end local v0    # "e":Ljava/io/IOException;
    :cond_2
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->nextBuffer:Ljava/lang/String;

    if-eqz v4, :cond_3

    .line 331
    const/4 v2, 0x1

    goto :goto_0

    .line 334
    :cond_3
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->isEndOfFile:Z

    .line 335
    invoke-direct {p0}, Lcom/amazon/insights/delivery/FileEventStore$1;->tryCloseReader()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 340
    .end local v1    # "found":Z
    :catchall_0
    move-exception v4

    iget-object v5, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v5}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v4
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 262
    invoke-virtual {p0}, Lcom/amazon/insights/delivery/FileEventStore$1;->next()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/lang/String;
    .locals 6

    .prologue
    .line 346
    const/4 v2, 0x0

    .line 347
    .local v2, "next":Ljava/lang/String;
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v4}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 349
    :try_start_0
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->nextBuffer:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 350
    iget-object v2, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->nextBuffer:Ljava/lang/String;

    .line 351
    iget v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->linesRead:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->linesRead:I

    .line 352
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->nextBuffer:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 380
    :goto_0
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v4}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    move-object v3, v2

    .end local v2    # "next":Ljava/lang/String;
    .local v3, "next":Ljava/lang/String;
    :goto_1
    return-object v3

    .line 354
    .end local v3    # "next":Ljava/lang/String;
    .restart local v2    # "next":Ljava/lang/String;
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/amazon/insights/delivery/FileEventStore$1;->tryOpenReader()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    if-nez v4, :cond_1

    .line 380
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v4}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    move-object v3, v2

    .end local v2    # "next":Ljava/lang/String;
    .restart local v3    # "next":Ljava/lang/String;
    goto :goto_1

    .line 357
    .end local v3    # "next":Ljava/lang/String;
    .restart local v2    # "next":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    .line 358
    .local v1, "found":Z
    :goto_2
    if-nez v1, :cond_2

    .line 360
    :try_start_2
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->reader:Lcom/amazon/insights/core/io/EncryptedBufferedReader;

    invoke-virtual {v4}, Lcom/amazon/insights/core/io/EncryptedBufferedReader;->readLine()Ljava/lang/String;
    :try_end_2
    .catch Lcom/amazon/insights/core/io/DecryptionException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    .line 361
    const/4 v1, 0x1

    goto :goto_2

    .line 362
    :catch_0
    move-exception v0

    .line 364
    .local v0, "e":Lcom/amazon/insights/core/io/DecryptionException;
    :try_start_3
    iget v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->linesRead:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->linesRead:I

    .line 365
    const/4 v1, 0x0

    .line 369
    goto :goto_2

    .line 366
    .end local v0    # "e":Lcom/amazon/insights/core/io/DecryptionException;
    :catch_1
    move-exception v0

    .line 367
    .local v0, "e":Ljava/io/IOException;
    const/4 v2, 0x0

    .line 368
    const/4 v1, 0x1

    .line 369
    goto :goto_2

    .line 371
    .end local v0    # "e":Ljava/io/IOException;
    :cond_2
    if-eqz v2, :cond_3

    .line 372
    iget v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->linesRead:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->linesRead:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 380
    .end local v1    # "found":Z
    :catchall_0
    move-exception v4

    iget-object v5, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v5}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v4

    .line 374
    .restart local v1    # "found":Z
    :cond_3
    const/4 v4, 0x1

    :try_start_4
    iput-boolean v4, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->isEndOfFile:Z

    .line 375
    invoke-direct {p0}, Lcom/amazon/insights/delivery/FileEventStore$1;->tryCloseReader()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0
.end method

.method public peek()Ljava/lang/String;
    .locals 2

    .prologue
    .line 386
    iget-object v0, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v0}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 388
    :try_start_0
    invoke-virtual {p0}, Lcom/amazon/insights/delivery/FileEventStore$1;->hasNext()Z

    .line 389
    iget-object v0, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->nextBuffer:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 391
    iget-object v1, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v1}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v1}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 397
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "The remove() operation is not supported for this iterator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeReadEvents()V
    .locals 2

    .prologue
    .line 402
    iget-object v0, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v0}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 404
    :try_start_0
    iget-object v0, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    iget v1, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->linesRead:I

    invoke-static {v0, v1}, Lcom/amazon/insights/delivery/FileEventStore;->access$500(Lcom/amazon/insights/delivery/FileEventStore;I)Ljava/io/File;

    .line 405
    invoke-direct {p0}, Lcom/amazon/insights/delivery/FileEventStore$1;->resetReader()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 407
    iget-object v0, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v0}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 409
    return-void

    .line 407
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/amazon/insights/delivery/FileEventStore$1;->this$0:Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v1}, Lcom/amazon/insights/delivery/FileEventStore;->access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method
