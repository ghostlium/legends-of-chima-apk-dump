.class public Lcom/amazon/ags/client/whispersync/storage/DiskStorage;
.super Ljava/lang/Object;
.source "DiskStorage.java"

# interfaces
.implements Lcom/amazon/ags/client/whispersync/storage/LocalStorage;


# static fields
.field public static final AMAZON_GAMES_DIR_NAME:Ljava/lang/String; = ".amazonGamesService"

.field private static final BACKUP_FILE_EXTENSION:Ljava/lang/String; = ".bak"

.field private static final GAME_DATA_FILE:Ljava/lang/String; = "gameData.json"

.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"

.field private static final VERSION_INFO_FILE:Ljava/lang/String; = "latestVersion.txt"


# instance fields
.field private final context:Landroid/content/Context;

.field private hasSuccessfullySynchronized:Z

.field private final marshaller:Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;

.field private stringObfuscator:Lcom/amazon/ags/storage/StringObfuscator;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;Lcom/amazon/ags/storage/StringObfuscator;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "marshaller"    # Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;
    .param p3, "stringObfuscator"    # Lcom/amazon/ags/storage/StringObfuscator;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->context:Landroid/content/Context;

    .line 37
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->marshaller:Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;

    .line 38
    iput-object p3, p0, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->stringObfuscator:Lcom/amazon/ags/storage/StringObfuscator;

    .line 39
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->init()V

    .line 40
    return-void
.end method

.method private getAmazonGamesDir()Ljava/io/File;
    .locals 3

    .prologue
    .line 181
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, ".amazonGamesService"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 182
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 183
    return-object v0
.end method

.method private init()V
    .locals 3

    .prologue
    .line 43
    new-instance v0, Ljava/io/File;

    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->getAmazonGamesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "latestVersion.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 44
    .local v0, "versionInfoFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    iput-boolean v1, p0, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->hasSuccessfullySynchronized:Z

    .line 45
    return-void
.end method

.method private declared-synchronized readFromAmazonGamesDir(Ljava/lang/String;)[B
    .locals 8
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 108
    monitor-enter p0

    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".bak"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 109
    .local v1, "backupFileName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->getAmazonGamesDir()Ljava/io/File;

    move-result-object v5

    invoke-direct {v0, v5, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 110
    .local v0, "backupFile":Ljava/io/File;
    new-instance v4, Ljava/io/File;

    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->getAmazonGamesDir()Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 113
    .local v4, "sourceFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 114
    const-string v5, "GC_Whispersync"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Found backup file ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]. This indicates that saving to ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "] previously failed."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 116
    invoke-virtual {v0, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 117
    const-string v5, "GC_Whispersync"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Couldn\'t rename backup file ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "] to file ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 136
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v3

    .line 122
    :cond_1
    :try_start_1
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 126
    new-instance v2, Ljava/io/RandomAccessFile;

    const-string v5, "r"

    invoke-direct {v2, v4, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 128
    .local v2, "file":Ljava/io/RandomAccessFile;
    :try_start_2
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v5

    long-to-int v5, v5

    new-array v3, v5, [B

    .line 129
    .local v3, "gameData":[B
    invoke-virtual {v2, v3}, Ljava/io/RandomAccessFile;->readFully([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 133
    :try_start_3
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    .line 134
    :catch_0
    move-exception v5

    goto :goto_0

    .line 132
    .end local v3    # "gameData":[B
    :catchall_0
    move-exception v5

    .line 133
    :try_start_4
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 136
    :goto_1
    :try_start_5
    throw v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 108
    .end local v0    # "backupFile":Ljava/io/File;
    .end local v1    # "backupFileName":Ljava/lang/String;
    .end local v2    # "file":Ljava/io/RandomAccessFile;
    .end local v4    # "sourceFile":Ljava/io/File;
    :catchall_1
    move-exception v5

    monitor-exit p0

    throw v5

    .line 134
    .restart local v0    # "backupFile":Ljava/io/File;
    .restart local v1    # "backupFileName":Ljava/lang/String;
    .restart local v2    # "file":Ljava/io/RandomAccessFile;
    .restart local v4    # "sourceFile":Ljava/io/File;
    :catch_1
    move-exception v6

    goto :goto_1
.end method

.method private declared-synchronized writeToAmazonGamesDir(Ljava/lang/String;[B)V
    .locals 7
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    monitor-enter p0

    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".bak"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 142
    .local v1, "backupFileName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->getAmazonGamesDir()Ljava/io/File;

    move-result-object v4

    invoke-direct {v0, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 143
    .local v0, "backupFile":Ljava/io/File;
    new-instance v3, Ljava/io/File;

    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->getAmazonGamesDir()Ljava/io/File;

    move-result-object v4

    invoke-direct {v3, v4, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 146
    .local v3, "targetFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 147
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 148
    invoke-virtual {v3, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 149
    const-string v4, "GC_Whispersync"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Couldn\'t rename file ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] to backup file ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 168
    :goto_0
    monitor-exit p0

    return-void

    .line 154
    :cond_0
    :try_start_1
    const-string v4, "GC_Whispersync"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Found backup file ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]. This indicates that saving to ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] previously failed."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 160
    :cond_1
    :try_start_2
    invoke-virtual {p0, v3, p2}, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->writeDataToFile(Ljava/io/File;[B)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 167
    :try_start_3
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 141
    .end local v0    # "backupFile":Ljava/io/File;
    .end local v1    # "backupFileName":Ljava/lang/String;
    .end local v3    # "targetFile":Ljava/io/File;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 161
    .restart local v0    # "backupFile":Ljava/io/File;
    .restart local v1    # "backupFileName":Ljava/lang/String;
    .restart local v3    # "targetFile":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 163
    .local v2, "ioe":Ljava/io/IOException;
    :try_start_4
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 164
    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method


# virtual methods
.method public getVersionId()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    const-string v1, "latestVersion.txt"

    invoke-direct {p0, v1}, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->readFromAmazonGamesDir(Ljava/lang/String;)[B

    move-result-object v0

    .line 50
    .local v0, "versionId":[B
    if-nez v0, :cond_0

    .line 51
    const/4 v1, 0x0

    .line 53
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    goto :goto_0
.end method

.method public hasSuccessfullySynchronized()Z
    .locals 1

    .prologue
    .line 98
    iget-boolean v0, p0, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->hasSuccessfullySynchronized:Z

    return v0
.end method

.method public putVersionId(Ljava/lang/String;)V
    .locals 2
    .param p1, "versionId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->hasSuccessfullySynchronized:Z

    .line 60
    const-string v0, "latestVersion.txt"

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->writeToAmazonGamesDir(Ljava/lang/String;[B)V

    .line 61
    return-void
.end method

.method public retrieve()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation

    .prologue
    .line 83
    const-string v3, "gameData.json"

    invoke-direct {p0, v3}, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->readFromAmazonGamesDir(Ljava/lang/String;)[B

    move-result-object v0

    .line 84
    .local v0, "gameData":[B
    if-nez v0, :cond_0

    .line 85
    const-string v3, "GC_Whispersync"

    const-string v4, "Retrieved an empty document from disk"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    const/4 v3, 0x0

    .line 92
    :goto_0
    return-object v3

    .line 88
    :cond_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([B)V

    .line 89
    .local v2, "obfuscatedGameDataMapJson":Ljava/lang/String;
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->stringObfuscator:Lcom/amazon/ags/storage/StringObfuscator;

    invoke-interface {v3, v2}, Lcom/amazon/ags/storage/StringObfuscator;->unobfuscate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 91
    .local v1, "gameDataMapJson":Ljava/lang/String;
    const-string v3, "GC_Whispersync"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Retrieved JSON string ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] of game data map from disk"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->marshaller:Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;

    invoke-interface {v3, v1}, Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;->parse(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    move-result-object v3

    goto :goto_0
.end method

.method public save(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;)I
    .locals 5
    .param p1, "gameDataMap"    # Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation

    .prologue
    .line 65
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->marshaller:Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;

    invoke-interface {v2, p1}, Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;->composeForDisk(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;)Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, "gameDataMapJson":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 68
    const-string v2, "GC_Whispersync"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Writing game data to disk: ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->stringObfuscator:Lcom/amazon/ags/storage/StringObfuscator;

    invoke-interface {v2, v0}, Lcom/amazon/ags/storage/StringObfuscator;->obfuscate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 71
    .local v1, "obfuscatedString":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 72
    const-string v2, "gameData.json"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->writeToAmazonGamesDir(Ljava/lang/String;[B)V

    .line 73
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    .line 78
    .end local v1    # "obfuscatedString":Ljava/lang/String;
    :goto_0
    return v2

    .line 76
    :cond_0
    const-string v2, "GC_Whispersync"

    const-string v3, "No game data to write to disk yet"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public setStringObfuscator(Lcom/amazon/ags/storage/StringObfuscator;)V
    .locals 0
    .param p1, "stringObfuscator"    # Lcom/amazon/ags/storage/StringObfuscator;

    .prologue
    .line 102
    if-eqz p1, :cond_0

    .line 103
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/storage/DiskStorage;->stringObfuscator:Lcom/amazon/ags/storage/StringObfuscator;

    .line 105
    :cond_0
    return-void
.end method

.method protected writeDataToFile(Ljava/io/File;[B)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .param p2, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 173
    .local v0, "fos":Ljava/io/FileOutputStream;
    :try_start_0
    invoke-virtual {v0, p2}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 176
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 178
    return-void

    .line 176
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    throw v1
.end method
