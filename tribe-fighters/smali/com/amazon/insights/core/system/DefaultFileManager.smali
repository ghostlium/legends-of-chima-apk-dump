.class public Lcom/amazon/insights/core/system/DefaultFileManager;
.super Ljava/lang/Object;
.source "DefaultFileManager.java"

# interfaces
.implements Lcom/amazon/insights/core/system/FileManager;


# instance fields
.field private final directory:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 0
    .param p1, "rootDirectory"    # Ljava/io/File;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/amazon/insights/core/system/DefaultFileManager;->directory:Ljava/io/File;

    .line 23
    return-void
.end method


# virtual methods
.method public createDirectory(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p1, "directoryPath"    # Ljava/lang/String;

    .prologue
    .line 27
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/amazon/insights/core/system/DefaultFileManager;->directory:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 28
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 29
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_0

    .line 30
    const/4 v0, 0x0

    .line 33
    .end local v0    # "dir":Ljava/io/File;
    :cond_0
    return-object v0
.end method

.method public createFile(Ljava/io/File;)Ljava/io/File;
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    const/4 p1, 0x0

    .line 73
    .end local p1    # "file":Ljava/io/File;
    :cond_0
    return-object p1
.end method

.method public createFile(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p1, "filepath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/amazon/insights/core/system/DefaultFileManager;->directory:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 63
    .local v0, "file":Ljava/io/File;
    invoke-virtual {p0, v0}, Lcom/amazon/insights/core/system/DefaultFileManager;->createFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    return-object v1
.end method

.method public deleteFile(Ljava/io/File;)Z
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 84
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    .line 87
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public deleteFile(Ljava/lang/String;)Z
    .locals 2
    .param p1, "filepath"    # Ljava/lang/String;

    .prologue
    .line 78
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/amazon/insights/core/system/DefaultFileManager;->directory:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 79
    .local v0, "file":Ljava/io/File;
    invoke-virtual {p0, v0}, Lcom/amazon/insights/core/system/DefaultFileManager;->deleteFile(Ljava/io/File;)Z

    move-result v1

    return v1
.end method

.method public getDirectory(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p1, "directoryPath"    # Ljava/lang/String;

    .prologue
    .line 38
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/amazon/insights/core/system/DefaultFileManager;->directory:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 39
    .local v0, "dir":Ljava/io/File;
    return-object v0
.end method

.method public listFilesInDirectory(Ljava/io/File;)Ljava/util/Set;
    .locals 7
    .param p1, "directory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 51
    .local v3, "filesSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/io/File;>;"
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 52
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 53
    .local v2, "files":[Ljava/io/File;
    move-object v0, v2

    .local v0, "arr$":[Ljava/io/File;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v1, v0, v4

    .line 54
    .local v1, "file":Ljava/io/File;
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 53
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 57
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "files":[Ljava/io/File;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    :cond_0
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v6

    return-object v6
.end method

.method public listFilesInDirectory(Ljava/lang/String;)Ljava/util/Set;
    .locals 2
    .param p1, "directoryPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/amazon/insights/core/system/DefaultFileManager;->directory:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 45
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {p0, v0}, Lcom/amazon/insights/core/system/DefaultFileManager;->listFilesInDirectory(Ljava/io/File;)Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public newInputStream(Ljava/io/File;)Ljava/io/InputStream;
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 98
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 99
    .local v0, "stream":Ljava/io/InputStream;
    return-object v0
.end method

.method public newInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 2
    .param p1, "filepath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/amazon/insights/core/system/DefaultFileManager;->directory:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 93
    .local v0, "file":Ljava/io/File;
    invoke-virtual {p0, v0}, Lcom/amazon/insights/core/system/DefaultFileManager;->newInputStream(Ljava/io/File;)Ljava/io/InputStream;

    move-result-object v1

    return-object v1
.end method

.method public newOutputStream(Ljava/io/File;Z)Ljava/io/OutputStream;
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .param p2, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 110
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 111
    .local v0, "stream":Ljava/io/OutputStream;
    return-object v0
.end method

.method public newOutputStream(Ljava/lang/String;Z)Ljava/io/OutputStream;
    .locals 2
    .param p1, "filepath"    # Ljava/lang/String;
    .param p2, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 104
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/amazon/insights/core/system/DefaultFileManager;->directory:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 105
    .local v0, "file":Ljava/io/File;
    invoke-virtual {p0, v0, p2}, Lcom/amazon/insights/core/system/DefaultFileManager;->newOutputStream(Ljava/io/File;Z)Ljava/io/OutputStream;

    move-result-object v1

    return-object v1
.end method
