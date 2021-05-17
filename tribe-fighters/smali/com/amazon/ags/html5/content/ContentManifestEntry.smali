.class public Lcom/amazon/ags/html5/content/ContentManifestEntry;
.super Ljava/lang/Object;
.source "ContentManifestEntry.java"


# static fields
.field private static final CHECKSUM_KEY:Ljava/lang/String; = "checksum"

.field private static final COMPATIBILITY_KEY:Ljava/lang/String; = "sdkVersionCompatibility"

.field private static final CONTENT_KEY:Ljava/lang/String; = "content"

.field private static final SEPARATOR:Ljava/lang/String; = ":::"

.field private static final TAG:Ljava/lang/String;

.field private static final VERSION_KEY:Ljava/lang/String; = "version"


# instance fields
.field private checksum:Ljava/lang/String;

.field private contentURL:Ljava/lang/String;

.field private contentVersion:Lcom/amazon/ags/html5/content/ContentVersion;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-class v0, Lcom/amazon/ags/html5/content/ContentManifestEntry;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/content/ContentManifestEntry;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/html5/content/ContentVersion;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "contentVersion"    # Lcom/amazon/ags/html5/content/ContentVersion;
    .param p2, "contentURL"    # Ljava/lang/String;
    .param p3, "checksum"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/amazon/ags/html5/content/ContentManifestEntry;->contentVersion:Lcom/amazon/ags/html5/content/ContentVersion;

    .line 35
    iput-object p2, p0, Lcom/amazon/ags/html5/content/ContentManifestEntry;->contentURL:Ljava/lang/String;

    .line 36
    iput-object p3, p0, Lcom/amazon/ags/html5/content/ContentManifestEntry;->checksum:Ljava/lang/String;

    .line 37
    return-void
.end method

.method public static createManifestEntriesFromFile(Ljava/lang/String;)Ljava/util/Map;
    .locals 21
    .param p0, "fileLocation"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/ags/html5/content/ContentManifestEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 52
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 54
    .local v12, "manifestEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/ags/html5/content/ContentManifestEntry;>;"
    new-instance v14, Ljava/io/File;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 55
    .local v14, "manifestFile":Ljava/io/File;
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v18

    if-eqz v18, :cond_0

    invoke-virtual {v14}, Ljava/io/File;->isFile()Z

    move-result v18

    if-nez v18, :cond_1

    .line 121
    .end local v12    # "manifestEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/ags/html5/content/ContentManifestEntry;>;"
    :cond_0
    :goto_0
    return-object v12

    .line 59
    .restart local v12    # "manifestEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/ags/html5/content/ContentManifestEntry;>;"
    :cond_1
    const/4 v15, 0x0

    .line 60
    .local v15, "manifestInputStream":Ljava/io/FileInputStream;
    const/4 v10, 0x0

    .line 61
    .local v10, "manifestDataInputStream":Ljava/io/DataInputStream;
    const/4 v8, 0x0

    .line 63
    .local v8, "manifestBufferedReader":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v16, Ljava/io/FileInputStream;

    move-object/from16 v0, v16

    invoke-direct {v0, v14}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .end local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    .local v16, "manifestInputStream":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v11, Ljava/io/DataInputStream;

    move-object/from16 v0, v16

    invoke-direct {v11, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 65
    .end local v10    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .local v11, "manifestDataInputStream":Ljava/io/DataInputStream;
    :try_start_2
    new-instance v9, Ljava/io/BufferedReader;

    new-instance v18, Ljava/io/InputStreamReader;

    move-object/from16 v0, v18

    invoke-direct {v0, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v18

    invoke-direct {v9, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_6
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 67
    .end local v8    # "manifestBufferedReader":Ljava/io/BufferedReader;
    .local v9, "manifestBufferedReader":Ljava/io/BufferedReader;
    :cond_2
    :goto_1
    :try_start_3
    invoke-virtual {v9}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    .local v7, "inputLine":Ljava/lang/String;
    if-eqz v7, :cond_a

    .line 68
    const-string v18, ":::"

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    .line 69
    .local v13, "manifestFields":[Ljava/lang/String;
    array-length v0, v13

    move/from16 v18, v0

    const/16 v19, 0x2

    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_2

    .line 73
    const/4 v4, 0x0

    .line 74
    .local v4, "contentVersion":Lcom/amazon/ags/html5/content/ContentVersion;
    const/16 v17, 0x0

    .line 75
    .local v17, "urlString":Ljava/lang/String;
    const/4 v3, 0x0

    .line 76
    .local v3, "compatibilityVersion":Lcom/amazon/ags/VersionInfo;
    const/4 v2, 0x0

    .line 78
    .local v2, "checksum":Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2
    array-length v0, v13

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    move/from16 v0, v18

    if-ge v6, v0, :cond_7

    .line 79
    const-string v18, "version"

    aget-object v19, v13, v6

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 80
    add-int/lit8 v18, v6, 0x1

    aget-object v18, v13, v18

    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_3

    .line 81
    add-int/lit8 v18, v6, 0x1

    aget-object v18, v13, v18

    invoke-static/range {v18 .. v18}, Lcom/amazon/ags/html5/content/ContentManifestEntry;->parseContentVersion(Ljava/lang/String;)Lcom/amazon/ags/html5/content/ContentVersion;

    move-result-object v4

    .line 78
    :cond_3
    :goto_3
    add-int/lit8 v6, v6, 0x2

    goto :goto_2

    .line 83
    :cond_4
    const-string v18, "content"

    aget-object v19, v13, v6

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 84
    add-int/lit8 v18, v6, 0x1

    aget-object v18, v13, v18

    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_3

    .line 85
    add-int/lit8 v18, v6, 0x1

    aget-object v17, v13, v18

    goto :goto_3

    .line 87
    :cond_5
    const-string v18, "sdkVersionCompatibility"

    aget-object v19, v13, v6

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_6

    .line 88
    add-int/lit8 v18, v6, 0x1

    aget-object v18, v13, v18

    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_3

    .line 89
    add-int/lit8 v18, v6, 0x1

    aget-object v18, v13, v18

    invoke-static/range {v18 .. v18}, Lcom/amazon/ags/html5/content/ContentManifestEntry;->parseCompatibilityVersion(Ljava/lang/String;)Lcom/amazon/ags/VersionInfo;

    move-result-object v3

    goto :goto_3

    .line 91
    :cond_6
    const-string v18, "checksum"

    aget-object v19, v13, v6

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 92
    add-int/lit8 v18, v6, 0x1

    aget-object v18, v13, v18

    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_3

    .line 93
    add-int/lit8 v18, v6, 0x1

    aget-object v2, v13, v18

    goto :goto_3

    .line 98
    :cond_7
    if-eqz v4, :cond_2

    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_2

    if-eqz v3, :cond_2

    .line 99
    invoke-virtual {v3}, Lcom/amazon/ags/VersionInfo;->toString()Ljava/lang/String;

    move-result-object v18

    new-instance v19, Lcom/amazon/ags/html5/content/ContentManifestEntry;

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-direct {v0, v4, v1, v2}, Lcom/amazon/ags/html5/content/ContentManifestEntry;-><init>(Lcom/amazon/ags/html5/content/ContentVersion;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v12, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    goto/16 :goto_1

    .line 102
    .end local v2    # "checksum":Ljava/lang/String;
    .end local v3    # "compatibilityVersion":Lcom/amazon/ags/VersionInfo;
    .end local v4    # "contentVersion":Lcom/amazon/ags/html5/content/ContentVersion;
    .end local v6    # "i":I
    .end local v7    # "inputLine":Ljava/lang/String;
    .end local v13    # "manifestFields":[Ljava/lang/String;
    .end local v17    # "urlString":Ljava/lang/String;
    :catch_0
    move-exception v5

    move-object v8, v9

    .end local v9    # "manifestBufferedReader":Ljava/io/BufferedReader;
    .restart local v8    # "manifestBufferedReader":Ljava/io/BufferedReader;
    move-object v10, v11

    .end local v11    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .restart local v10    # "manifestDataInputStream":Ljava/io/DataInputStream;
    move-object/from16 v15, v16

    .line 103
    .end local v16    # "manifestInputStream":Ljava/io/FileInputStream;
    .local v5, "e":Ljava/lang/Exception;
    .restart local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    :goto_4
    :try_start_4
    sget-object v18, Lcom/amazon/ags/html5/content/ContentManifestEntry;->TAG:Ljava/lang/String;

    const-string v19, "Error encountered while performing manifest read operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 104
    new-instance v12, Ljava/util/HashMap;

    .end local v12    # "manifestEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/ags/html5/content/ContentManifestEntry;>;"
    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 107
    if-eqz v8, :cond_8

    .line 108
    :try_start_5
    invoke-virtual {v8}, Ljava/io/BufferedReader;->close()V

    .line 110
    :cond_8
    if-eqz v10, :cond_9

    .line 111
    invoke-virtual {v10}, Ljava/io/DataInputStream;->close()V

    .line 113
    :cond_9
    if-eqz v15, :cond_0

    .line 114
    invoke-virtual {v15}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_0

    .line 116
    :catch_1
    move-exception v5

    .line 117
    sget-object v18, Lcom/amazon/ags/html5/content/ContentManifestEntry;->TAG:Ljava/lang/String;

    const-string v19, "Error encountered while cleaning up manifest read operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 107
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v8    # "manifestBufferedReader":Ljava/io/BufferedReader;
    .end local v10    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .end local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    .restart local v7    # "inputLine":Ljava/lang/String;
    .restart local v9    # "manifestBufferedReader":Ljava/io/BufferedReader;
    .restart local v11    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .restart local v12    # "manifestEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/ags/html5/content/ContentManifestEntry;>;"
    .restart local v16    # "manifestInputStream":Ljava/io/FileInputStream;
    :cond_a
    if-eqz v9, :cond_b

    .line 108
    :try_start_6
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V

    .line 110
    :cond_b
    if-eqz v11, :cond_c

    .line 111
    invoke-virtual {v11}, Ljava/io/DataInputStream;->close()V

    .line 113
    :cond_c
    if-eqz v16, :cond_0

    .line 114
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto/16 :goto_0

    .line 116
    :catch_2
    move-exception v5

    .line 117
    .restart local v5    # "e":Ljava/lang/Exception;
    sget-object v18, Lcom/amazon/ags/html5/content/ContentManifestEntry;->TAG:Ljava/lang/String;

    const-string v19, "Error encountered while cleaning up manifest read operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 106
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v7    # "inputLine":Ljava/lang/String;
    .end local v9    # "manifestBufferedReader":Ljava/io/BufferedReader;
    .end local v11    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .end local v12    # "manifestEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/ags/html5/content/ContentManifestEntry;>;"
    .end local v16    # "manifestInputStream":Ljava/io/FileInputStream;
    .restart local v8    # "manifestBufferedReader":Ljava/io/BufferedReader;
    .restart local v10    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .restart local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    :catchall_0
    move-exception v18

    .line 107
    :goto_5
    if-eqz v8, :cond_d

    .line 108
    :try_start_7
    invoke-virtual {v8}, Ljava/io/BufferedReader;->close()V

    .line 110
    :cond_d
    if-eqz v10, :cond_e

    .line 111
    invoke-virtual {v10}, Ljava/io/DataInputStream;->close()V

    .line 113
    :cond_e
    if-eqz v15, :cond_f

    .line 114
    invoke-virtual {v15}, Ljava/io/FileInputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    .line 118
    :cond_f
    :goto_6
    throw v18

    .line 116
    :catch_3
    move-exception v5

    .line 117
    .restart local v5    # "e":Ljava/lang/Exception;
    sget-object v19, Lcom/amazon/ags/html5/content/ContentManifestEntry;->TAG:Ljava/lang/String;

    const-string v20, "Error encountered while cleaning up manifest read operation"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    .line 106
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    .restart local v12    # "manifestEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/ags/html5/content/ContentManifestEntry;>;"
    .restart local v16    # "manifestInputStream":Ljava/io/FileInputStream;
    :catchall_1
    move-exception v18

    move-object/from16 v15, v16

    .end local v16    # "manifestInputStream":Ljava/io/FileInputStream;
    .restart local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    goto :goto_5

    .end local v10    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .end local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    .restart local v11    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .restart local v16    # "manifestInputStream":Ljava/io/FileInputStream;
    :catchall_2
    move-exception v18

    move-object v10, v11

    .end local v11    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .restart local v10    # "manifestDataInputStream":Ljava/io/DataInputStream;
    move-object/from16 v15, v16

    .end local v16    # "manifestInputStream":Ljava/io/FileInputStream;
    .restart local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    goto :goto_5

    .end local v8    # "manifestBufferedReader":Ljava/io/BufferedReader;
    .end local v10    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .end local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    .restart local v9    # "manifestBufferedReader":Ljava/io/BufferedReader;
    .restart local v11    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .restart local v16    # "manifestInputStream":Ljava/io/FileInputStream;
    :catchall_3
    move-exception v18

    move-object v8, v9

    .end local v9    # "manifestBufferedReader":Ljava/io/BufferedReader;
    .restart local v8    # "manifestBufferedReader":Ljava/io/BufferedReader;
    move-object v10, v11

    .end local v11    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .restart local v10    # "manifestDataInputStream":Ljava/io/DataInputStream;
    move-object/from16 v15, v16

    .end local v16    # "manifestInputStream":Ljava/io/FileInputStream;
    .restart local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    goto :goto_5

    .line 102
    :catch_4
    move-exception v5

    goto :goto_4

    .end local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "manifestInputStream":Ljava/io/FileInputStream;
    :catch_5
    move-exception v5

    move-object/from16 v15, v16

    .end local v16    # "manifestInputStream":Ljava/io/FileInputStream;
    .restart local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    goto :goto_4

    .end local v10    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .end local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    .restart local v11    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .restart local v16    # "manifestInputStream":Ljava/io/FileInputStream;
    :catch_6
    move-exception v5

    move-object v10, v11

    .end local v11    # "manifestDataInputStream":Ljava/io/DataInputStream;
    .restart local v10    # "manifestDataInputStream":Ljava/io/DataInputStream;
    move-object/from16 v15, v16

    .end local v16    # "manifestInputStream":Ljava/io/FileInputStream;
    .restart local v15    # "manifestInputStream":Ljava/io/FileInputStream;
    goto/16 :goto_4
.end method

.method private static parseCompatibilityVersion(Ljava/lang/String;)Lcom/amazon/ags/VersionInfo;
    .locals 10
    .param p0, "versionString"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 141
    const-string v7, "\\."

    invoke-virtual {p0, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 142
    .local v4, "versionData":[Ljava/lang/String;
    array-length v7, v4

    const/4 v8, 0x3

    if-eq v7, v8, :cond_0

    .line 153
    :goto_0
    return-object v6

    .line 145
    :cond_0
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v3, :cond_1

    aget-object v5, v0, v2

    .line 147
    .local v5, "versionNumber":Ljava/lang/String;
    :try_start_0
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 148
    :catch_0
    move-exception v1

    .line 149
    .local v1, "e":Ljava/lang/Exception;
    sget-object v7, Lcom/amazon/ags/html5/content/ContentManifestEntry;->TAG:Ljava/lang/String;

    const-string v8, "Exception encountered while parsing compatibility version number"

    invoke-static {v7, v8, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 153
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v5    # "versionNumber":Ljava/lang/String;
    :cond_1
    new-instance v6, Lcom/amazon/ags/VersionInfo;

    const/4 v7, 0x0

    aget-object v7, v4, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    aget-object v8, v4, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x2

    aget-object v9, v4, v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-direct {v6, v7, v8, v9}, Lcom/amazon/ags/VersionInfo;-><init>(III)V

    goto :goto_0
.end method

.method private static parseContentVersion(Ljava/lang/String;)Lcom/amazon/ags/html5/content/ContentVersion;
    .locals 10
    .param p0, "versionString"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 125
    const-string v7, "\\."

    invoke-virtual {p0, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 126
    .local v4, "versionData":[Ljava/lang/String;
    array-length v7, v4

    const/4 v8, 0x3

    if-eq v7, v8, :cond_0

    .line 137
    :goto_0
    return-object v6

    .line 129
    :cond_0
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v3, :cond_1

    aget-object v5, v0, v2

    .line 131
    .local v5, "versionNumber":Ljava/lang/String;
    :try_start_0
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 132
    :catch_0
    move-exception v1

    .line 133
    .local v1, "e":Ljava/lang/Exception;
    sget-object v7, Lcom/amazon/ags/html5/content/ContentManifestEntry;->TAG:Ljava/lang/String;

    const-string v8, "Exception encountered while parsing content version number"

    invoke-static {v7, v8, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 137
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v5    # "versionNumber":Ljava/lang/String;
    :cond_1
    new-instance v6, Lcom/amazon/ags/html5/content/ContentVersion;

    const/4 v7, 0x0

    aget-object v7, v4, v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    aget-object v8, v4, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x2

    aget-object v9, v4, v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-direct {v6, v7, v8, v9}, Lcom/amazon/ags/html5/content/ContentVersion;-><init>(III)V

    goto :goto_0
.end method


# virtual methods
.method public getChecksum()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/amazon/ags/html5/content/ContentManifestEntry;->checksum:Ljava/lang/String;

    return-object v0
.end method

.method public getContentURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/amazon/ags/html5/content/ContentManifestEntry;->contentURL:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Lcom/amazon/ags/html5/content/ContentVersion;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/amazon/ags/html5/content/ContentManifestEntry;->contentVersion:Lcom/amazon/ags/html5/content/ContentVersion;

    return-object v0
.end method
