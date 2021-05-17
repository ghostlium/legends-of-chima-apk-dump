.class public Lcom/amazon/insights/abtest/cache/FileVariationCache;
.super Ljava/lang/Object;
.source "FileVariationCache.java"

# interfaces
.implements Lcom/amazon/insights/abtest/cache/VariationCache;


# static fields
.field public static final VARIATIONS_DIRECTORY:Ljava/lang/String; = "variations"

.field private static logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private final fileManager:Lcom/amazon/insights/core/system/FileManager;

.field private final variationFiles:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private final variationsDirectory:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const-class v0, Lcom/amazon/insights/abtest/cache/FileVariationCache;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/insights/core/InsightsContext;)V
    .locals 2
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationFiles:Ljava/util/Map;

    .line 48
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v0

    invoke-interface {v0}, Lcom/amazon/insights/core/system/System;->getFileManager()Lcom/amazon/insights/core/system/FileManager;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->fileManager:Lcom/amazon/insights/core/system/FileManager;

    .line 49
    iget-object v0, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->fileManager:Lcom/amazon/insights/core/system/FileManager;

    const-string v1, "variations"

    invoke-interface {v0, v1}, Lcom/amazon/insights/core/system/FileManager;->createDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationsDirectory:Ljava/io/File;

    .line 50
    invoke-direct {p0}, Lcom/amazon/insights/abtest/cache/FileVariationCache;->loadVariationFileInfo()V

    .line 51
    return-void
.end method

.method private loadVariationFileInfo()V
    .locals 5

    .prologue
    .line 54
    iget-object v3, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationsDirectory:Ljava/io/File;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationsDirectory:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 62
    :cond_0
    return-void

    .line 58
    :cond_1
    iget-object v3, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->fileManager:Lcom/amazon/insights/core/system/FileManager;

    iget-object v4, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationsDirectory:Ljava/io/File;

    invoke-interface {v3, v4}, Lcom/amazon/insights/core/system/FileManager;->listFilesInDirectory(Ljava/io/File;)Ljava/util/Set;

    move-result-object v1

    .line 59
    .local v1, "files":Ljava/util/Set;, "Ljava/util/Set<Ljava/io/File;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 60
    .local v0, "file":Ljava/io/File;
    iget-object v3, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationFiles:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private loadVariationFromFile(Ljava/io/File;)Lcom/amazon/insights/abtest/DefaultVariation;
    .locals 18
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 161
    if-nez p1, :cond_0

    .line 162
    const/4 v15, 0x0

    .line 214
    :goto_0
    return-object v15

    .line 166
    :cond_0
    :try_start_0
    new-instance v6, Ljava/util/zip/GZIPInputStream;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->fileManager:Lcom/amazon/insights/core/system/FileManager;

    move-object/from16 v0, p1

    invoke-interface {v15, v0}, Lcom/amazon/insights/core/system/FileManager;->newInputStream(Ljava/io/File;)Ljava/io/InputStream;

    move-result-object v15

    invoke-direct {v6, v15}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 167
    .local v6, "input":Ljava/io/InputStream;
    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 168
    .local v4, "inReader":Ljava/io/InputStreamReader;
    new-instance v9, Ljava/io/BufferedReader;

    invoke-direct {v9, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    .line 169
    .local v9, "reader":Ljava/io/BufferedReader;
    const/4 v7, 0x0

    .line 171
    .local v7, "json":Lorg/json/JSONObject;
    :try_start_1
    const-string v3, ""

    .line 172
    .local v3, "in":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .local v1, "builder":Ljava/lang/StringBuilder;
    :goto_1
    invoke-virtual {v9}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 174
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 179
    .end local v1    # "builder":Ljava/lang/StringBuilder;
    .end local v3    # "in":Ljava/lang/String;
    .end local v7    # "json":Lorg/json/JSONObject;
    :catchall_0
    move-exception v15

    :try_start_2
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V

    throw v15
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 206
    .end local v4    # "inReader":Ljava/io/InputStreamReader;
    .end local v6    # "input":Ljava/io/InputStream;
    .end local v9    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v2

    .line 207
    .local v2, "e":Ljava/io/FileNotFoundException;
    sget-object v15, Lcom/amazon/insights/abtest/cache/FileVariationCache;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v16, "The file does not exist to read the variation from"

    move-object/from16 v0, v16

    invoke-virtual {v15, v0, v2}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 214
    .end local v2    # "e":Ljava/io/FileNotFoundException;
    :goto_2
    const/4 v15, 0x0

    goto :goto_0

    .line 177
    .restart local v1    # "builder":Ljava/lang/StringBuilder;
    .restart local v3    # "in":Ljava/lang/String;
    .restart local v4    # "inReader":Ljava/io/InputStreamReader;
    .restart local v6    # "input":Ljava/io/InputStream;
    .restart local v7    # "json":Lorg/json/JSONObject;
    .restart local v9    # "reader":Ljava/io/BufferedReader;
    :cond_1
    :try_start_3
    new-instance v7, Lorg/json/JSONObject;

    .end local v7    # "json":Lorg/json/JSONObject;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v7, v15}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 179
    .restart local v7    # "json":Lorg/json/JSONObject;
    :try_start_4
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V

    .line 182
    new-instance v14, Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    invoke-direct {v14}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;-><init>()V

    .line 183
    .local v14, "variationBuilder":Lcom/amazon/insights/abtest/DefaultVariation$Builder;
    const-string v15, "applicationKey"

    invoke-virtual {v7, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setApplicationKey(Ljava/lang/String;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 184
    const-string v15, "uniqueId"

    invoke-virtual {v7, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/amazon/insights/core/idresolver/Id;->valueOf(Ljava/lang/String;)Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setUniqueId(Lcom/amazon/insights/core/idresolver/Id;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 185
    sget-object v15, Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;->CACHE:Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;

    invoke-virtual {v14, v15}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setAllocationSource(Lcom/amazon/insights/abtest/DefaultVariation$AllocationSource;)V

    .line 186
    new-instance v15, Ljava/util/Date;

    const-string v16, "expirationDate"

    move-object/from16 v0, v16

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v16

    invoke-direct/range {v15 .. v17}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v14, v15}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setExpirationDate(Ljava/util/Date;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 187
    const-string v15, "projectName"

    invoke-virtual {v7, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setProjectName(Ljava/lang/String;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 188
    const-string v15, "variationName"

    invoke-virtual {v7, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setVariationName(Ljava/lang/String;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 189
    const-string v15, "variationId"

    invoke-virtual {v7, v15}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v15

    invoke-virtual/range {v14 .. v16}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setVariationId(J)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 190
    const-string v15, "experimentId"

    invoke-virtual {v7, v15}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v15

    invoke-virtual/range {v14 .. v16}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setExperimentId(J)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 192
    const-string v15, "variables"

    invoke-virtual {v7, v15}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    .line 193
    .local v12, "variables":Lorg/json/JSONArray;
    if-eqz v12, :cond_4

    .line 194
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 195
    .local v13, "variablesMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v5, 0x0

    .local v5, "index":I
    :goto_3
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-ge v5, v15, :cond_3

    .line 196
    invoke-virtual {v12, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    .line 197
    .local v11, "variable":Lorg/json/JSONObject;
    if-eqz v11, :cond_2

    .line 198
    const-string v15, "name"

    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 199
    .local v8, "key":Ljava/lang/String;
    const-string v15, "value"

    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 200
    .local v10, "value":Ljava/lang/String;
    invoke-interface {v13, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    .end local v8    # "key":Ljava/lang/String;
    .end local v10    # "value":Ljava/lang/String;
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 203
    .end local v11    # "variable":Lorg/json/JSONObject;
    :cond_3
    invoke-virtual {v14, v13}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->setVariables(Ljava/util/Map;)Lcom/amazon/insights/abtest/DefaultVariation$Builder;

    .line 205
    .end local v5    # "index":I
    .end local v13    # "variablesMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    invoke-virtual {v14}, Lcom/amazon/insights/abtest/DefaultVariation$Builder;->build()Lcom/amazon/insights/abtest/DefaultVariation;
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    move-result-object v15

    goto/16 :goto_0

    .line 208
    .end local v1    # "builder":Ljava/lang/StringBuilder;
    .end local v3    # "in":Ljava/lang/String;
    .end local v4    # "inReader":Ljava/io/InputStreamReader;
    .end local v6    # "input":Ljava/io/InputStream;
    .end local v7    # "json":Lorg/json/JSONObject;
    .end local v9    # "reader":Ljava/io/BufferedReader;
    .end local v12    # "variables":Lorg/json/JSONArray;
    .end local v14    # "variationBuilder":Lcom/amazon/insights/abtest/DefaultVariation$Builder;
    :catch_1
    move-exception v2

    .line 209
    .local v2, "e":Ljava/io/IOException;
    sget-object v15, Lcom/amazon/insights/abtest/cache/FileVariationCache;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v16, "An error occurred while trying to read the variation from the file"

    move-object/from16 v0, v16

    invoke-virtual {v15, v0, v2}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2

    .line 210
    .end local v2    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v2

    .line 211
    .local v2, "e":Lorg/json/JSONException;
    sget-object v15, Lcom/amazon/insights/abtest/cache/FileVariationCache;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v16, "Failed to parse from json the variation read from the file"

    move-object/from16 v0, v16

    invoke-virtual {v15, v0, v2}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2
.end method

.method private writeVariationToFile(Lcom/amazon/insights/abtest/DefaultVariation;Ljava/io/Writer;)Z
    .locals 5
    .param p1, "variation"    # Lcom/amazon/insights/abtest/DefaultVariation;
    .param p2, "writer"    # Ljava/io/Writer;

    .prologue
    const/4 v2, 0x0

    .line 218
    const/4 v1, 0x0

    .line 220
    .local v1, "json":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 225
    if-eqz v1, :cond_0

    .line 227
    :try_start_1
    invoke-virtual {p2, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 228
    invoke-virtual {p2}, Ljava/io/Writer;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 233
    :cond_0
    const/4 v2, 0x1

    :goto_0
    return v2

    .line 221
    :catch_0
    move-exception v0

    .line 222
    .local v0, "e":Lorg/json/JSONException;
    goto :goto_0

    .line 229
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .line 230
    .local v0, "e":Ljava/io/IOException;
    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized contains(Lcom/amazon/insights/abtest/DefaultVariation;)Z
    .locals 2
    .param p1, "variation"    # Lcom/amazon/insights/abtest/DefaultVariation;

    .prologue
    .line 157
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationFiles:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get(Ljava/util/Set;)Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/abtest/DefaultVariation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    .local p1, "projects":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    monitor-enter p0

    :try_start_0
    new-instance v4, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v4}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 121
    .local v4, "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 122
    .local v2, "project":Ljava/lang/String;
    iget-object v5, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationFiles:Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 123
    iget-object v5, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationFiles:Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 125
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    .line 126
    iget-object v5, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationFiles:Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 120
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "project":Ljava/lang/String;
    .end local v4    # "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 129
    .restart local v0    # "file":Ljava/io/File;
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "project":Ljava/lang/String;
    .restart local v4    # "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    :cond_1
    :try_start_1
    invoke-direct {p0, v0}, Lcom/amazon/insights/abtest/cache/FileVariationCache;->loadVariationFromFile(Ljava/io/File;)Lcom/amazon/insights/abtest/DefaultVariation;

    move-result-object v3

    .line 130
    .local v3, "variation":Lcom/amazon/insights/abtest/DefaultVariation;
    if-eqz v3, :cond_0

    .line 131
    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 135
    .end local v0    # "file":Ljava/io/File;
    .end local v2    # "project":Ljava/lang/String;
    .end local v3    # "variation":Lcom/amazon/insights/abtest/DefaultVariation;
    :cond_2
    monitor-exit p0

    return-object v4
.end method

.method public declared-synchronized getAll()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/amazon/insights/abtest/DefaultVariation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 140
    monitor-enter p0

    :try_start_0
    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 141
    .local v3, "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    iget-object v4, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationFiles:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 143
    .local v0, "fileEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/io/File;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1

    .line 144
    iget-object v4, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationFiles:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 140
    .end local v0    # "fileEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/io/File;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 147
    .restart local v0    # "fileEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/io/File;>;"
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v3    # "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/insights/abtest/DefaultVariation;>;"
    :cond_1
    :try_start_1
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    invoke-direct {p0, v4}, Lcom/amazon/insights/abtest/cache/FileVariationCache;->loadVariationFromFile(Ljava/io/File;)Lcom/amazon/insights/abtest/DefaultVariation;

    move-result-object v2

    .line 148
    .local v2, "variation":Lcom/amazon/insights/abtest/DefaultVariation;
    if-eqz v2, :cond_0

    .line 149
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 152
    .end local v0    # "fileEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/io/File;>;"
    .end local v2    # "variation":Lcom/amazon/insights/abtest/DefaultVariation;
    :cond_2
    monitor-exit p0

    return-object v3
.end method

.method public declared-synchronized put(Lcom/amazon/insights/abtest/DefaultVariation;)Z
    .locals 11
    .param p1, "variation"    # Lcom/amazon/insights/abtest/DefaultVariation;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 66
    monitor-enter p0

    :try_start_0
    invoke-static {p1}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->isDefault()Z

    move-result v9

    if-nez v9, :cond_3

    move v9, v8

    :goto_0
    invoke-static {v9}, Lcom/amazon/insights/core/util/Preconditions;->checkArgument(Z)V

    .line 69
    const/4 v1, 0x0

    .line 70
    .local v1, "file":Ljava/io/File;
    iget-object v9, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationFiles:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 71
    iget-object v9, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationFiles:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "file":Ljava/io/File;
    check-cast v1, Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    .restart local v1    # "file":Ljava/io/File;
    :goto_1
    const/4 v4, 0x0

    .line 85
    .local v4, "output":Ljava/io/OutputStream;
    if-eqz v1, :cond_0

    .line 87
    :try_start_1
    iget-object v9, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->fileManager:Lcom/amazon/insights/core/system/FileManager;

    const/4 v10, 0x0

    invoke-interface {v9, v1, v10}, Lcom/amazon/insights/core/system/FileManager;->newOutputStream(Ljava/io/File;Z)Ljava/io/OutputStream;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    .line 95
    :cond_0
    if-eqz v4, :cond_2

    .line 96
    const/4 v5, 0x0

    .line 98
    .local v5, "writer":Ljava/io/OutputStreamWriter;
    :try_start_2
    new-instance v6, Ljava/io/OutputStreamWriter;

    new-instance v9, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v9, v4}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v6, v9}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 99
    .end local v5    # "writer":Ljava/io/OutputStreamWriter;
    .local v6, "writer":Ljava/io/OutputStreamWriter;
    :try_start_3
    invoke-direct {p0, p1, v6}, Lcom/amazon/insights/abtest/cache/FileVariationCache;->writeVariationToFile(Lcom/amazon/insights/abtest/DefaultVariation;Ljava/io/Writer;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 100
    iget-object v9, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationFiles:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 106
    if-eqz v6, :cond_1

    .line 108
    :try_start_4
    invoke-virtual {v6}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :cond_1
    :goto_2
    move v7, v8

    .line 115
    .end local v4    # "output":Ljava/io/OutputStream;
    .end local v6    # "writer":Ljava/io/OutputStreamWriter;
    :cond_2
    :goto_3
    monitor-exit p0

    return v7

    .end local v1    # "file":Ljava/io/File;
    :cond_3
    move v9, v7

    .line 67
    goto :goto_0

    .line 74
    .restart local v1    # "file":Ljava/io/File;
    :cond_4
    :try_start_5
    invoke-virtual {p1}, Lcom/amazon/insights/abtest/DefaultVariation;->getProjectName()Ljava/lang/String;

    move-result-object v3

    .line 75
    .local v3, "fileName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    iget-object v9, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->variationsDirectory:Ljava/io/File;

    invoke-direct {v2, v9, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 76
    .end local v1    # "file":Ljava/io/File;
    .local v2, "file":Ljava/io/File;
    :try_start_6
    iget-object v9, p0, Lcom/amazon/insights/abtest/cache/FileVariationCache;->fileManager:Lcom/amazon/insights/core/system/FileManager;

    invoke-interface {v9, v2}, Lcom/amazon/insights/core/system/FileManager;->createFile(Ljava/io/File;)Ljava/io/File;
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_8
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v1

    .end local v2    # "file":Ljava/io/File;
    .restart local v1    # "file":Ljava/io/File;
    goto :goto_1

    .line 77
    .end local v3    # "fileName":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Ljava/io/IOException;
    :goto_4
    :try_start_7
    sget-object v8, Lcom/amazon/insights/abtest/cache/FileVariationCache;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v9, "Unable to cache the variation"

    invoke-virtual {v8, v9}, Lcom/amazon/insights/core/log/Logger;->deve(Ljava/lang/String;)V

    .line 79
    sget-object v8, Lcom/amazon/insights/abtest/cache/FileVariationCache;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v9, "An error occurred while attempting to create a new file to persist a variation"

    invoke-virtual {v8, v9, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_3

    .line 66
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "file":Ljava/io/File;
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7

    .line 88
    .restart local v1    # "file":Ljava/io/File;
    .restart local v4    # "output":Ljava/io/OutputStream;
    :catch_1
    move-exception v0

    .line 89
    .local v0, "e":Ljava/io/FileNotFoundException;
    :try_start_8
    sget-object v8, Lcom/amazon/insights/abtest/cache/FileVariationCache;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v9, "The file does not exist to write the variation to"

    invoke-virtual {v8, v9, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_3

    .line 106
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    .restart local v6    # "writer":Ljava/io/OutputStreamWriter;
    :cond_5
    if-eqz v6, :cond_2

    .line 108
    :try_start_9
    invoke-virtual {v6}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_3

    .line 109
    :catch_2
    move-exception v8

    goto :goto_3

    .line 103
    .end local v6    # "writer":Ljava/io/OutputStreamWriter;
    .restart local v5    # "writer":Ljava/io/OutputStreamWriter;
    :catch_3
    move-exception v0

    .line 104
    .local v0, "e":Ljava/io/IOException;
    :goto_5
    :try_start_a
    sget-object v8, Lcom/amazon/insights/abtest/cache/FileVariationCache;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v9, "Could not write the variation to file"

    invoke-virtual {v8, v9, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 106
    if-eqz v5, :cond_2

    .line 108
    :try_start_b
    invoke-virtual {v5}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_4
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto :goto_3

    .line 109
    :catch_4
    move-exception v8

    goto :goto_3

    .line 106
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v7

    :goto_6
    if-eqz v5, :cond_6

    .line 108
    :try_start_c
    invoke-virtual {v5}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_6
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 110
    :cond_6
    :goto_7
    :try_start_d
    throw v7
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 109
    .end local v5    # "writer":Ljava/io/OutputStreamWriter;
    .restart local v6    # "writer":Ljava/io/OutputStreamWriter;
    :catch_5
    move-exception v7

    goto :goto_2

    .end local v6    # "writer":Ljava/io/OutputStreamWriter;
    .restart local v5    # "writer":Ljava/io/OutputStreamWriter;
    :catch_6
    move-exception v8

    goto :goto_7

    .line 106
    .end local v5    # "writer":Ljava/io/OutputStreamWriter;
    .restart local v6    # "writer":Ljava/io/OutputStreamWriter;
    :catchall_2
    move-exception v7

    move-object v5, v6

    .end local v6    # "writer":Ljava/io/OutputStreamWriter;
    .restart local v5    # "writer":Ljava/io/OutputStreamWriter;
    goto :goto_6

    .line 103
    .end local v5    # "writer":Ljava/io/OutputStreamWriter;
    .restart local v6    # "writer":Ljava/io/OutputStreamWriter;
    :catch_7
    move-exception v0

    move-object v5, v6

    .end local v6    # "writer":Ljava/io/OutputStreamWriter;
    .restart local v5    # "writer":Ljava/io/OutputStreamWriter;
    goto :goto_5

    .line 77
    .end local v1    # "file":Ljava/io/File;
    .end local v4    # "output":Ljava/io/OutputStream;
    .end local v5    # "writer":Ljava/io/OutputStreamWriter;
    .restart local v2    # "file":Ljava/io/File;
    .restart local v3    # "fileName":Ljava/lang/String;
    :catch_8
    move-exception v0

    move-object v1, v2

    .end local v2    # "file":Ljava/io/File;
    .restart local v1    # "file":Ljava/io/File;
    goto :goto_4
.end method
