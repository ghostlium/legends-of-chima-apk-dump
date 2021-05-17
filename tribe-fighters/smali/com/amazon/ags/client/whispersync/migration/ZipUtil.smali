.class public Lcom/amazon/ags/client/whispersync/migration/ZipUtil;
.super Ljava/lang/Object;
.source "ZipUtil.java"


# static fields
.field private static final KIBI:I = 0x400

.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private zipInputStream:Ljava/util/zip/ZipInputStream;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getNextEntry(Ljava/util/zip/ZipInputStream;)Ljava/util/zip/ZipEntry;
    .locals 5
    .param p1, "zip"    # Ljava/util/zip/ZipInputStream;

    .prologue
    const/4 v2, 0x0

    .line 77
    :try_start_0
    invoke-virtual {p1}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 82
    :goto_0
    return-object v2

    .line 78
    :catch_0
    move-exception v1

    .line 79
    .local v1, "efo":Ljava/io/EOFException;
    const-string v3, "GC_Whispersync"

    const-string v4, "Ignoring EOFException"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 81
    .end local v1    # "efo":Ljava/io/EOFException;
    :catch_1
    move-exception v0

    .line 82
    .local v0, "e":Ljava/io/IOException;
    goto :goto_0
.end method

.method private unzipFile(Ljava/io/File;)V
    .locals 6
    .param p1, "entryFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 88
    const/16 v4, 0x400

    new-array v0, v4, [B

    .line 90
    .local v0, "buffer":[B
    const/4 v2, 0x0

    .line 92
    .local v2, "os":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 95
    .end local v2    # "os":Ljava/io/FileOutputStream;
    .local v3, "os":Ljava/io/FileOutputStream;
    :goto_0
    :try_start_1
    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;->zipInputStream:Ljava/util/zip/ZipInputStream;

    invoke-virtual {v4, v0}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v1

    .local v1, "count":I
    const/4 v4, -0x1

    if-eq v1, v4, :cond_1

    .line 96
    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 99
    .end local v1    # "count":I
    :catchall_0
    move-exception v4

    move-object v2, v3

    .end local v3    # "os":Ljava/io/FileOutputStream;
    .restart local v2    # "os":Ljava/io/FileOutputStream;
    :goto_1
    iget-object v5, p0, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;->zipInputStream:Ljava/util/zip/ZipInputStream;

    invoke-virtual {v5}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    .line 100
    if-eqz v2, :cond_0

    .line 101
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    :cond_0
    throw v4

    .line 99
    .end local v2    # "os":Ljava/io/FileOutputStream;
    .restart local v1    # "count":I
    .restart local v3    # "os":Ljava/io/FileOutputStream;
    :cond_1
    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;->zipInputStream:Ljava/util/zip/ZipInputStream;

    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    .line 100
    if-eqz v3, :cond_2

    .line 101
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 104
    :cond_2
    return-void

    .line 99
    .end local v1    # "count":I
    .end local v3    # "os":Ljava/io/FileOutputStream;
    .restart local v2    # "os":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v4

    goto :goto_1
.end method


# virtual methods
.method public final unzip(Ljava/io/InputStream;Ljava/io/File;)V
    .locals 5
    .param p1, "source"    # Ljava/io/InputStream;
    .param p2, "destinationDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    if-nez p1, :cond_0

    .line 38
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "source cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 40
    :cond_0
    if-nez p2, :cond_1

    .line 41
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "destinationDir cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 44
    :cond_1
    const-string v2, "GC_Whispersync"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Entering unzip() with destination directory ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    new-instance v2, Ljava/util/zip/ZipInputStream;

    invoke-direct {v2, p1}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v2, p0, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;->zipInputStream:Ljava/util/zip/ZipInputStream;

    .line 49
    :goto_0
    :try_start_0
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;->zipInputStream:Ljava/util/zip/ZipInputStream;

    invoke-direct {p0, v2}, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;->getNextEntry(Ljava/util/zip/ZipInputStream;)Ljava/util/zip/ZipEntry;

    move-result-object v0

    .local v0, "entry":Ljava/util/zip/ZipEntry;
    if-eqz v0, :cond_4

    .line 51
    new-instance v1, Ljava/io/File;

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p2, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 53
    .local v1, "entryFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 54
    const-string v2, "GC_Whispersync"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Creating dir: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 63
    .end local v0    # "entry":Ljava/util/zip/ZipEntry;
    .end local v1    # "entryFile":Ljava/io/File;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;->zipInputStream:Ljava/util/zip/ZipInputStream;

    if-eqz v3, :cond_2

    .line 64
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;->zipInputStream:Ljava/util/zip/ZipInputStream;

    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->close()V

    :cond_2
    throw v2

    .line 57
    .restart local v0    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v1    # "entryFile":Ljava/io/File;
    :cond_3
    :try_start_1
    const-string v2, "GC_Whispersync"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Creating file: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    invoke-direct {p0, v1}, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;->unzipFile(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 63
    .end local v1    # "entryFile":Ljava/io/File;
    :cond_4
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;->zipInputStream:Ljava/util/zip/ZipInputStream;

    if-eqz v2, :cond_5

    .line 64
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;->zipInputStream:Ljava/util/zip/ZipInputStream;

    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->close()V

    .line 67
    :cond_5
    return-void
.end method

.method public final unzip([BLjava/io/File;)V
    .locals 2
    .param p1, "source"    # [B
    .param p2, "destinationDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    if-nez p1, :cond_0

    .line 31
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 33
    :cond_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {p0, v0, p2}, Lcom/amazon/ags/client/whispersync/migration/ZipUtil;->unzip(Ljava/io/InputStream;Ljava/io/File;)V

    .line 34
    return-void
.end method
