.class public Lcom/amazon/ags/html5/content/ContentVersion;
.super Ljava/lang/Object;
.source "ContentVersion.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/amazon/ags/html5/content/ContentVersion;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final VERSION_FILENAME:Ljava/lang/String; = "version.txt"

.field private static final majorKey:Ljava/lang/String; = "major"

.field private static final minorKey:Ljava/lang/String; = "minor"

.field private static final patchKey:Ljava/lang/String; = "patch"

.field private static final separator:Ljava/lang/String; = "::"

.field private static final versionKey:Ljava/lang/String; = "version"


# instance fields
.field private majorVersion:Ljava/lang/Integer;

.field private minorVersion:Ljava/lang/Integer;

.field private patchVersion:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Lcom/amazon/ags/html5/content/ContentVersion;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(III)V
    .locals 1
    .param p1, "major"    # I
    .param p2, "minor"    # I
    .param p3, "patch"    # I

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/content/ContentVersion;->majorVersion:Ljava/lang/Integer;

    .line 42
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/content/ContentVersion;->minorVersion:Ljava/lang/Integer;

    .line 43
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/content/ContentVersion;->patchVersion:Ljava/lang/Integer;

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 7
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    const/4 v6, -0x1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    if-nez p1, :cond_0

    .line 48
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Input json must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 53
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 56
    .local v1, "jsonData":Lorg/json/JSONObject;
    const-string v3, "version"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 58
    .local v2, "version":Lorg/json/JSONObject;
    const-string v3, "major"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, p0, Lcom/amazon/ags/html5/content/ContentVersion;->majorVersion:Ljava/lang/Integer;

    .line 59
    const-string v3, "minor"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, p0, Lcom/amazon/ags/html5/content/ContentVersion;->minorVersion:Ljava/lang/Integer;

    .line 60
    const-string v3, "patch"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, p0, Lcom/amazon/ags/html5/content/ContentVersion;->patchVersion:Ljava/lang/Integer;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .end local v1    # "jsonData":Lorg/json/JSONObject;
    .end local v2    # "version":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 61
    :catch_0
    move-exception v0

    .line 62
    .local v0, "e":Lorg/json/JSONException;
    sget-object v3, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to parse version JSON: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 64
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, p0, Lcom/amazon/ags/html5/content/ContentVersion;->majorVersion:Ljava/lang/Integer;

    .line 65
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, p0, Lcom/amazon/ags/html5/content/ContentVersion;->minorVersion:Ljava/lang/Integer;

    .line 66
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, p0, Lcom/amazon/ags/html5/content/ContentVersion;->patchVersion:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public static createVersionFromDefaultContentRawResource(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/ags/html5/content/ContentVersion;
    .locals 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contentDirectory"    # Ljava/lang/String;
    .param p2, "contentResourceName"    # Ljava/lang/String;

    .prologue
    .line 162
    const/4 v2, 0x0

    .line 164
    .local v2, "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 165
    .local v5, "res":Landroid/content/res/Resources;
    invoke-static/range {p0 .. p2}, Lcom/amazon/ags/html5/util/ResourceUtils;->getIdentifier(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 166
    .local v0, "defaultContentRawResourceIdentifier":I
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-virtual {v5, v0}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v11

    invoke-direct {v1, v11}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 167
    .local v1, "defaultContentRawResourceInputStream":Ljava/io/InputStream;
    new-instance v3, Ljava/util/zip/ZipInputStream;

    invoke-direct {v3, v1}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 168
    .end local v2    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    .local v3, "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    const/4 v7, 0x0

    .line 169
    .local v7, "versionInfoZipEntry":Ljava/util/zip/ZipEntry;
    :try_start_1
    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v10

    .local v10, "zipInputStreamEntry":Ljava/util/zip/ZipEntry;
    :goto_0
    if-eqz v10, :cond_0

    .line 170
    invoke-virtual {v10}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "version.txt"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 171
    move-object v7, v10

    .line 175
    :cond_0
    if-eqz v7, :cond_3

    .line 176
    invoke-virtual {v7}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v11

    long-to-int v9, v11

    .line 177
    .local v9, "versionTextByteSize":I
    new-array v6, v9, [B

    .line 178
    .local v6, "versionBytes":[B
    invoke-virtual {v3, v6}, Ljava/util/zip/ZipInputStream;->read([B)I

    .line 179
    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v6}, Ljava/lang/String;-><init>([B)V

    .line 180
    .local v8, "versionString":Ljava/lang/String;
    invoke-static {v8}, Lcom/amazon/ags/html5/content/ContentVersion;->parseContentVersion(Ljava/lang/String;)Lcom/amazon/ags/html5/content/ContentVersion;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v11

    .line 186
    if-eqz v3, :cond_1

    .line 187
    :try_start_2
    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :cond_1
    :goto_1
    move-object v2, v3

    .line 193
    .end local v0    # "defaultContentRawResourceIdentifier":I
    .end local v1    # "defaultContentRawResourceInputStream":Ljava/io/InputStream;
    .end local v3    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    .end local v5    # "res":Landroid/content/res/Resources;
    .end local v6    # "versionBytes":[B
    .end local v7    # "versionInfoZipEntry":Ljava/util/zip/ZipEntry;
    .end local v8    # "versionString":Ljava/lang/String;
    .end local v9    # "versionTextByteSize":I
    .end local v10    # "zipInputStreamEntry":Ljava/util/zip/ZipEntry;
    .restart local v2    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    :goto_2
    return-object v11

    .line 169
    .end local v2    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    .restart local v0    # "defaultContentRawResourceIdentifier":I
    .restart local v1    # "defaultContentRawResourceInputStream":Ljava/io/InputStream;
    .restart local v3    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    .restart local v5    # "res":Landroid/content/res/Resources;
    .restart local v7    # "versionInfoZipEntry":Ljava/util/zip/ZipEntry;
    .restart local v10    # "zipInputStreamEntry":Ljava/util/zip/ZipEntry;
    :cond_2
    :try_start_3
    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result-object v10

    goto :goto_0

    .line 189
    .restart local v6    # "versionBytes":[B
    .restart local v8    # "versionString":Ljava/lang/String;
    .restart local v9    # "versionTextByteSize":I
    :catch_0
    move-exception v4

    .line 190
    .local v4, "e":Ljava/io/IOException;
    sget-object v12, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    const-string v13, "Error encountered while cleaning up version file read operation"

    invoke-static {v12, v13, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 186
    .end local v4    # "e":Ljava/io/IOException;
    .end local v6    # "versionBytes":[B
    .end local v8    # "versionString":Ljava/lang/String;
    .end local v9    # "versionTextByteSize":I
    :cond_3
    if-eqz v3, :cond_4

    .line 187
    :try_start_4
    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    :cond_4
    move-object v2, v3

    .line 193
    .end local v0    # "defaultContentRawResourceIdentifier":I
    .end local v1    # "defaultContentRawResourceInputStream":Ljava/io/InputStream;
    .end local v3    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    .end local v5    # "res":Landroid/content/res/Resources;
    .end local v7    # "versionInfoZipEntry":Ljava/util/zip/ZipEntry;
    .end local v10    # "zipInputStreamEntry":Ljava/util/zip/ZipEntry;
    .restart local v2    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    :cond_5
    :goto_3
    const/4 v11, 0x0

    goto :goto_2

    .line 189
    .end local v2    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    .restart local v0    # "defaultContentRawResourceIdentifier":I
    .restart local v1    # "defaultContentRawResourceInputStream":Ljava/io/InputStream;
    .restart local v3    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    .restart local v5    # "res":Landroid/content/res/Resources;
    .restart local v7    # "versionInfoZipEntry":Ljava/util/zip/ZipEntry;
    .restart local v10    # "zipInputStreamEntry":Ljava/util/zip/ZipEntry;
    :catch_1
    move-exception v4

    .line 190
    .restart local v4    # "e":Ljava/io/IOException;
    sget-object v11, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    const-string v12, "Error encountered while cleaning up version file read operation"

    invoke-static {v11, v12, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v2, v3

    .line 192
    .end local v3    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    .restart local v2    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    goto :goto_3

    .line 182
    .end local v0    # "defaultContentRawResourceIdentifier":I
    .end local v1    # "defaultContentRawResourceInputStream":Ljava/io/InputStream;
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "res":Landroid/content/res/Resources;
    .end local v7    # "versionInfoZipEntry":Ljava/util/zip/ZipEntry;
    .end local v10    # "zipInputStreamEntry":Ljava/util/zip/ZipEntry;
    :catch_2
    move-exception v4

    .line 183
    .restart local v4    # "e":Ljava/io/IOException;
    :goto_4
    :try_start_5
    sget-object v11, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    const-string v12, "Could not extract version from content zip file."

    invoke-static {v11, v12, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 186
    if-eqz v2, :cond_5

    .line 187
    :try_start_6
    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    goto :goto_3

    .line 189
    :catch_3
    move-exception v4

    .line 190
    sget-object v11, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    const-string v12, "Error encountered while cleaning up version file read operation"

    invoke-static {v11, v12, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    .line 185
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v11

    .line 186
    :goto_5
    if-eqz v2, :cond_6

    .line 187
    :try_start_7
    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    .line 191
    :cond_6
    :goto_6
    throw v11

    .line 189
    :catch_4
    move-exception v4

    .line 190
    .restart local v4    # "e":Ljava/io/IOException;
    sget-object v12, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    const-string v13, "Error encountered while cleaning up version file read operation"

    invoke-static {v12, v13, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    .line 185
    .end local v2    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v0    # "defaultContentRawResourceIdentifier":I
    .restart local v1    # "defaultContentRawResourceInputStream":Ljava/io/InputStream;
    .restart local v3    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    .restart local v5    # "res":Landroid/content/res/Resources;
    .restart local v7    # "versionInfoZipEntry":Ljava/util/zip/ZipEntry;
    :catchall_1
    move-exception v11

    move-object v2, v3

    .end local v3    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    .restart local v2    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    goto :goto_5

    .line 182
    .end local v2    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    .restart local v3    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    :catch_5
    move-exception v4

    move-object v2, v3

    .end local v3    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    .restart local v2    # "defaultContentZipInputStream":Ljava/util/zip/ZipInputStream;
    goto :goto_4
.end method

.method public static createVersionFromFile(Ljava/lang/String;)Lcom/amazon/ags/html5/content/ContentVersion;
    .locals 9
    .param p0, "fileLocation"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 111
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 112
    .local v3, "versionFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v7

    if-nez v7, :cond_1

    .line 135
    :cond_0
    :goto_0
    return-object v6

    .line 115
    :cond_1
    const/4 v4, 0x0

    .line 116
    .local v4, "versionInputStream":Ljava/io/FileInputStream;
    const/4 v1, 0x0

    .line 118
    .local v1, "versionBufferedReader":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    .end local v4    # "versionInputStream":Ljava/io/FileInputStream;
    .local v5, "versionInputStream":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    invoke-direct {v7, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 120
    .end local v1    # "versionBufferedReader":Ljava/io/BufferedReader;
    .local v2, "versionBufferedReader":Ljava/io/BufferedReader;
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/amazon/ags/html5/content/ContentVersion;->parseContentVersion(Ljava/lang/String;)Lcom/amazon/ags/html5/content/ContentVersion;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result-object v6

    .line 125
    if-eqz v5, :cond_2

    .line 126
    :try_start_3
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    .line 128
    :cond_2
    if-eqz v2, :cond_0

    .line 129
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 131
    :catch_0
    move-exception v0

    .line 132
    .local v0, "e":Ljava/io/IOException;
    sget-object v7, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    const-string v8, "Error encountered while cleaning up version file read operation"

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 121
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "versionBufferedReader":Ljava/io/BufferedReader;
    .end local v5    # "versionInputStream":Ljava/io/FileInputStream;
    .restart local v1    # "versionBufferedReader":Ljava/io/BufferedReader;
    .restart local v4    # "versionInputStream":Ljava/io/FileInputStream;
    :catch_1
    move-exception v0

    .line 122
    .restart local v0    # "e":Ljava/io/IOException;
    :goto_1
    :try_start_4
    sget-object v7, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    const-string v8, "Error encountered in reading version file."

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 125
    if-eqz v4, :cond_3

    .line 126
    :try_start_5
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V

    .line 128
    :cond_3
    if-eqz v1, :cond_0

    .line 129
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_0

    .line 131
    :catch_2
    move-exception v0

    .line 132
    sget-object v7, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    const-string v8, "Error encountered while cleaning up version file read operation"

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 124
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    .line 125
    :goto_2
    if-eqz v4, :cond_4

    .line 126
    :try_start_6
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V

    .line 128
    :cond_4
    if-eqz v1, :cond_5

    .line 129
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 133
    :cond_5
    :goto_3
    throw v6

    .line 131
    :catch_3
    move-exception v0

    .line 132
    .restart local v0    # "e":Ljava/io/IOException;
    sget-object v7, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    const-string v8, "Error encountered while cleaning up version file read operation"

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    .line 124
    .end local v0    # "e":Ljava/io/IOException;
    .end local v4    # "versionInputStream":Ljava/io/FileInputStream;
    .restart local v5    # "versionInputStream":Ljava/io/FileInputStream;
    :catchall_1
    move-exception v6

    move-object v4, v5

    .end local v5    # "versionInputStream":Ljava/io/FileInputStream;
    .restart local v4    # "versionInputStream":Ljava/io/FileInputStream;
    goto :goto_2

    .end local v1    # "versionBufferedReader":Ljava/io/BufferedReader;
    .end local v4    # "versionInputStream":Ljava/io/FileInputStream;
    .restart local v2    # "versionBufferedReader":Ljava/io/BufferedReader;
    .restart local v5    # "versionInputStream":Ljava/io/FileInputStream;
    :catchall_2
    move-exception v6

    move-object v1, v2

    .end local v2    # "versionBufferedReader":Ljava/io/BufferedReader;
    .restart local v1    # "versionBufferedReader":Ljava/io/BufferedReader;
    move-object v4, v5

    .end local v5    # "versionInputStream":Ljava/io/FileInputStream;
    .restart local v4    # "versionInputStream":Ljava/io/FileInputStream;
    goto :goto_2

    .line 121
    .end local v4    # "versionInputStream":Ljava/io/FileInputStream;
    .restart local v5    # "versionInputStream":Ljava/io/FileInputStream;
    :catch_4
    move-exception v0

    move-object v4, v5

    .end local v5    # "versionInputStream":Ljava/io/FileInputStream;
    .restart local v4    # "versionInputStream":Ljava/io/FileInputStream;
    goto :goto_1

    .end local v1    # "versionBufferedReader":Ljava/io/BufferedReader;
    .end local v4    # "versionInputStream":Ljava/io/FileInputStream;
    .restart local v2    # "versionBufferedReader":Ljava/io/BufferedReader;
    .restart local v5    # "versionInputStream":Ljava/io/FileInputStream;
    :catch_5
    move-exception v0

    move-object v1, v2

    .end local v2    # "versionBufferedReader":Ljava/io/BufferedReader;
    .restart local v1    # "versionBufferedReader":Ljava/io/BufferedReader;
    move-object v4, v5

    .end local v5    # "versionInputStream":Ljava/io/FileInputStream;
    .restart local v4    # "versionInputStream":Ljava/io/FileInputStream;
    goto :goto_1
.end method

.method public static createVersionFromZip(Ljava/util/zip/ZipFile;)Lcom/amazon/ags/html5/content/ContentVersion;
    .locals 7
    .param p0, "contentZip"    # Ljava/util/zip/ZipFile;

    .prologue
    const/4 v4, 0x0

    .line 139
    const-string v5, "version.txt"

    invoke-virtual {p0, v5}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v3

    .line 140
    .local v3, "versionFileZipEntry":Ljava/util/zip/ZipEntry;
    if-nez v3, :cond_1

    .line 158
    :cond_0
    :goto_0
    return-object v4

    .line 143
    :cond_1
    const/4 v1, 0x0

    .line 145
    .local v1, "versionBufferedReader":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual {p0, v3}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    .end local v1    # "versionBufferedReader":Ljava/io/BufferedReader;
    .local v2, "versionBufferedReader":Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/amazon/ags/html5/content/ContentVersion;->parseContentVersion(Ljava/lang/String;)Lcom/amazon/ags/html5/content/ContentVersion;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v4

    .line 151
    if-eqz v2, :cond_0

    .line 152
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 154
    :catch_0
    move-exception v0

    .line 155
    .local v0, "e":Ljava/io/IOException;
    sget-object v5, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    const-string v6, "Error encountered while cleaning up version file read operation"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 147
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "versionBufferedReader":Ljava/io/BufferedReader;
    .restart local v1    # "versionBufferedReader":Ljava/io/BufferedReader;
    :catch_1
    move-exception v0

    .line 148
    .restart local v0    # "e":Ljava/io/IOException;
    :goto_1
    :try_start_3
    sget-object v5, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    const-string v6, "Error encountered in reading version file."

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 151
    if-eqz v1, :cond_0

    .line 152
    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    .line 154
    :catch_2
    move-exception v0

    .line 155
    sget-object v5, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    const-string v6, "Error encountered while cleaning up version file read operation"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 150
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 151
    :goto_2
    if-eqz v1, :cond_2

    .line 152
    :try_start_5
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 156
    :cond_2
    :goto_3
    throw v4

    .line 154
    :catch_3
    move-exception v0

    .line 155
    .restart local v0    # "e":Ljava/io/IOException;
    sget-object v5, Lcom/amazon/ags/html5/content/ContentVersion;->TAG:Ljava/lang/String;

    const-string v6, "Error encountered while cleaning up version file read operation"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    .line 150
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "versionBufferedReader":Ljava/io/BufferedReader;
    .restart local v2    # "versionBufferedReader":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v4

    move-object v1, v2

    .end local v2    # "versionBufferedReader":Ljava/io/BufferedReader;
    .restart local v1    # "versionBufferedReader":Ljava/io/BufferedReader;
    goto :goto_2

    .line 147
    .end local v1    # "versionBufferedReader":Ljava/io/BufferedReader;
    .restart local v2    # "versionBufferedReader":Ljava/io/BufferedReader;
    :catch_4
    move-exception v0

    move-object v1, v2

    .end local v2    # "versionBufferedReader":Ljava/io/BufferedReader;
    .restart local v1    # "versionBufferedReader":Ljava/io/BufferedReader;
    goto :goto_1
.end method

.method private static parseContentVersion(Ljava/lang/String;)Lcom/amazon/ags/html5/content/ContentVersion;
    .locals 10
    .param p0, "contentString"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v6, 0x0

    .line 197
    const/4 v0, 0x0

    .line 198
    .local v0, "contentVersion":Lcom/amazon/ags/html5/content/ContentVersion;
    const-string v7, "version"

    invoke-virtual {p0, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 199
    const-string v7, "::"

    invoke-virtual {p0, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 200
    .local v4, "versionInfo":[Ljava/lang/String;
    array-length v7, v4

    if-eq v7, v9, :cond_1

    .line 214
    .end local v4    # "versionInfo":[Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v6

    .line 203
    .restart local v4    # "versionInfo":[Ljava/lang/String;
    :cond_1
    aget-object v7, v4, v8

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 204
    .local v5, "versionString":Ljava/lang/String;
    const-string v7, "\\."

    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 205
    .local v3, "versionData":[Ljava/lang/String;
    array-length v7, v3

    const/4 v8, 0x3

    if-ne v7, v8, :cond_0

    .line 209
    :try_start_0
    new-instance v1, Lcom/amazon/ags/html5/content/ContentVersion;

    const/4 v7, 0x0

    aget-object v7, v3, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    aget-object v8, v3, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x2

    aget-object v9, v3, v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-direct {v1, v7, v8, v9}, Lcom/amazon/ags/html5/content/ContentVersion;-><init>(III)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0    # "contentVersion":Lcom/amazon/ags/html5/content/ContentVersion;
    .local v1, "contentVersion":Lcom/amazon/ags/html5/content/ContentVersion;
    move-object v0, v1

    .end local v1    # "contentVersion":Lcom/amazon/ags/html5/content/ContentVersion;
    .end local v3    # "versionData":[Ljava/lang/String;
    .end local v4    # "versionInfo":[Ljava/lang/String;
    .end local v5    # "versionString":Ljava/lang/String;
    .restart local v0    # "contentVersion":Lcom/amazon/ags/html5/content/ContentVersion;
    :cond_2
    move-object v6, v0

    .line 214
    goto :goto_0

    .line 210
    .restart local v3    # "versionData":[Ljava/lang/String;
    .restart local v4    # "versionInfo":[Ljava/lang/String;
    .restart local v5    # "versionString":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 211
    .local v2, "e":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method


# virtual methods
.method public compareTo(Lcom/amazon/ags/html5/content/ContentVersion;)I
    .locals 3
    .param p1, "otherVersion"    # Lcom/amazon/ags/html5/content/ContentVersion;

    .prologue
    .line 85
    if-nez p1, :cond_0

    .line 86
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Compared version must not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 88
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/html5/content/ContentVersion;->majorVersion:Ljava/lang/Integer;

    invoke-virtual {p1}, Lcom/amazon/ags/html5/content/ContentVersion;->getMajorVersion()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v0

    .line 89
    .local v0, "retVal":I
    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/amazon/ags/html5/content/ContentVersion;->minorVersion:Ljava/lang/Integer;

    invoke-virtual {p1}, Lcom/amazon/ags/html5/content/ContentVersion;->getMinorVersion()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v0

    .line 90
    :cond_1
    if-nez v0, :cond_2

    iget-object v1, p0, Lcom/amazon/ags/html5/content/ContentVersion;->patchVersion:Ljava/lang/Integer;

    invoke-virtual {p1}, Lcom/amazon/ags/html5/content/ContentVersion;->getPatchVersion()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v0

    .line 91
    :cond_2
    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 26
    check-cast p1, Lcom/amazon/ags/html5/content/ContentVersion;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/html5/content/ContentVersion;->compareTo(Lcom/amazon/ags/html5/content/ContentVersion;)I

    move-result v0

    return v0
.end method

.method public getMajorVersion()I
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/amazon/ags/html5/content/ContentVersion;->majorVersion:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getMinorVersion()I
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/amazon/ags/html5/content/ContentVersion;->minorVersion:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getPatchVersion()I
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/amazon/ags/html5/content/ContentVersion;->patchVersion:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 2

    .prologue
    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/amazon/ags/html5/content/ContentVersion;->majorVersion:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 97
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    iget-object v1, p0, Lcom/amazon/ags/html5/content/ContentVersion;->minorVersion:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    iget-object v1, p0, Lcom/amazon/ags/html5/content/ContentVersion;->patchVersion:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 107
    invoke-virtual {p0}, Lcom/amazon/ags/html5/content/ContentVersion;->getVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
