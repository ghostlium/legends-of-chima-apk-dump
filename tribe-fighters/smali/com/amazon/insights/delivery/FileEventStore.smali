.class public Lcom/amazon/insights/delivery/FileEventStore;
.super Ljava/lang/Object;
.source "FileEventStore.java"

# interfaces
.implements Lcom/amazon/insights/delivery/EventStore;


# static fields
.field static final ENCRYPTION_ALGORITHM:Ljava/lang/String; = "AES"

.field static final ERROR_LENGTH_THRESHOLD_PERCENTAGE:D = 1.1

.field static final EVENTS_DIRECTORY:Ljava/lang/String; = "events"

.field static final EVENT_FILE_NAME:Ljava/lang/String; = "eventsFile"

.field static final KEY_MAX_STORAGE_SIZE:Ljava/lang/String; = "maxStorageSize"

.field static final MAX_STORAGE_SIZE:J = 0x500000L

.field private static final logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private final accessLock:Ljava/util/concurrent/locks/ReentrantLock;

.field private final context:Lcom/amazon/insights/core/InsightsContext;

.field private eventsFile:Ljava/io/File;

.field private secretKey:Ljavax/crypto/SecretKey;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/amazon/insights/delivery/FileEventStore;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/insights/core/InsightsContext;)V
    .locals 10
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;

    .prologue
    const/16 v9, 0x20

    const/16 v8, 0x10

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v6, Ljava/util/concurrent/locks/ReentrantLock;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Ljava/util/concurrent/locks/ReentrantLock;-><init>(Z)V

    iput-object v6, p0, Lcom/amazon/insights/delivery/FileEventStore;->accessLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 54
    iput-object p1, p0, Lcom/amazon/insights/delivery/FileEventStore;->context:Lcom/amazon/insights/core/InsightsContext;

    .line 55
    invoke-direct {p0}, Lcom/amazon/insights/delivery/FileEventStore;->tryCreateEventsFile()Z

    .line 56
    new-array v5, v9, [B

    .line 58
    .local v5, "keyBytes":[B
    :try_start_0
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v6

    invoke-interface {v6}, Lcom/amazon/insights/InsightsCredentials;->getPrivateKey()Ljava/lang/String;

    move-result-object v4

    .line 59
    .local v4, "key":Ljava/lang/String;
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v6

    if-eqz v6, :cond_0

    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v6

    invoke-static {}, Lcom/amazon/insights/core/idresolver/Id;->getEmptyId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v7

    if-eq v6, v7, :cond_0

    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v6

    invoke-virtual {v6}, Lcom/amazon/insights/core/idresolver/Id;->getValue()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 60
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getUniqueId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v6

    invoke-virtual {v6}, Lcom/amazon/insights/core/idresolver/Id;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 63
    :cond_0
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getCredentials()Lcom/amazon/insights/InsightsCredentials;

    move-result-object v6

    invoke-interface {v6}, Lcom/amazon/insights/InsightsCredentials;->getPrivateKey()Ljava/lang/String;

    move-result-object v0

    .line 64
    .local v0, "defaultPrefix":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    if-le v6, v8, :cond_1

    .line 65
    const/16 v6, 0x10

    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 67
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v7

    const-string v8, "encryptionPrefix"

    invoke-interface {v7, v8, v0}, Lcom/amazon/insights/core/configuration/Configuration;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 69
    const-string v6, "UTF-8"

    invoke-virtual {v4, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 71
    .local v3, "hashedKey":[B
    :try_start_1
    const-string v6, "SHA-256"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 72
    .local v1, "digest":Ljava/security/MessageDigest;
    const-string v6, "UTF-8"

    invoke-virtual {v4, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/security/MessageDigest;->digest([B)[B
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    .line 77
    .end local v1    # "digest":Ljava/security/MessageDigest;
    :goto_0
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v8, 0x20

    :try_start_2
    invoke-static {v3, v6, v5, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    new-instance v6, Ljavax/crypto/spec/SecretKeySpec;

    const-string v7, "AES"

    invoke-direct {v6, v5, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    iput-object v6, p0, Lcom/amazon/insights/delivery/FileEventStore;->secretKey:Ljavax/crypto/SecretKey;
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_0

    .line 82
    .end local v0    # "defaultPrefix":Ljava/lang/String;
    .end local v3    # "hashedKey":[B
    .end local v4    # "key":Ljava/lang/String;
    :goto_1
    return-void

    .line 79
    :catch_0
    move-exception v2

    .line 80
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/amazon/insights/delivery/FileEventStore;->secretKey:Ljavax/crypto/SecretKey;

    goto :goto_1

    .line 73
    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v0    # "defaultPrefix":Ljava/lang/String;
    .restart local v3    # "hashedKey":[B
    .restart local v4    # "key":Ljava/lang/String;
    :catch_1
    move-exception v6

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/delivery/FileEventStore;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$100(Lcom/amazon/insights/delivery/FileEventStore;)Lcom/amazon/insights/core/InsightsContext;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/delivery/FileEventStore;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/amazon/insights/delivery/FileEventStore;->context:Lcom/amazon/insights/core/InsightsContext;

    return-object v0
.end method

.method static synthetic access$200()Lcom/amazon/insights/core/log/Logger;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    return-object v0
.end method

.method static synthetic access$300(Lcom/amazon/insights/delivery/FileEventStore;)Ljavax/crypto/SecretKey;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/delivery/FileEventStore;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/amazon/insights/delivery/FileEventStore;->secretKey:Ljavax/crypto/SecretKey;

    return-object v0
.end method

.method static synthetic access$400(Lcom/amazon/insights/delivery/FileEventStore;)Ljava/util/concurrent/locks/ReentrantLock;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/delivery/FileEventStore;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/amazon/insights/delivery/FileEventStore;->accessLock:Ljava/util/concurrent/locks/ReentrantLock;

    return-object v0
.end method

.method static synthetic access$500(Lcom/amazon/insights/delivery/FileEventStore;I)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/insights/delivery/FileEventStore;
    .param p1, "x1"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/amazon/insights/delivery/FileEventStore;->deleteReadEvents(I)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private deleteReadEvents(I)Ljava/io/File;
    .locals 22
    .param p1, "lineNumber"    # I

    .prologue
    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->context:Lcom/amazon/insights/core/InsightsContext;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Lcom/amazon/insights/core/system/System;->getFileManager()Lcom/amazon/insights/core/system/FileManager;

    move-result-object v6

    .line 169
    .local v6, "fileManager":Lcom/amazon/insights/core/system/FileManager;
    const-string v18, "events"

    move-object/from16 v0, v18

    invoke-interface {v6, v0}, Lcom/amazon/insights/core/system/FileManager;->createDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 171
    .local v5, "eventsDir":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->context:Lcom/amazon/insights/core/InsightsContext;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v18

    const-string v19, "maxStorageSize"

    const-wide/32 v20, 0x500000

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    invoke-interface/range {v18 .. v20}, Lcom/amazon/insights/core/configuration/Configuration;->optLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 172
    .local v8, "maxStorageSize":J
    long-to-double v0, v8

    move-wide/from16 v18, v0

    const-wide v20, 0x3ff199999999999aL    # 1.1

    mul-double v18, v18, v20

    move-wide/from16 v0, v18

    double-to-long v14, v0

    .line 173
    .local v14, "threshold":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->length()J

    move-result-wide v18

    cmp-long v18, v18, v14

    if-ltz v18, :cond_1

    .line 174
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->delete()Z

    move-result v18

    if-nez v18, :cond_0

    .line 175
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "Failed to delete events file that exceeds the max storage size"

    invoke-virtual/range {v18 .. v19}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    .line 178
    :cond_0
    :try_start_0
    new-instance v18, Ljava/io/File;

    const-string v19, "eventsFile"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v5, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object/from16 v0, v18

    invoke-interface {v6, v0}, Lcom/amazon/insights/core/system/FileManager;->createFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v18, v0

    .line 257
    :goto_1
    return-object v18

    .line 179
    :catch_0
    move-exception v3

    .line 180
    .local v3, "e":Ljava/io/IOException;
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "An error occurred while attempting to create the eventsFile"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v3}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 185
    .end local v3    # "e":Ljava/io/IOException;
    :cond_1
    const/4 v12, 0x0

    .line 187
    .local v12, "tempEventsFile":Ljava/io/File;
    :try_start_1
    new-instance v13, Ljava/io/File;

    const-string v18, "eventsFile.tmp"

    move-object/from16 v0, v18

    invoke-direct {v13, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 188
    .local v13, "tempFile":Ljava/io/File;
    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    move-result v18

    if-eqz v18, :cond_2

    .line 189
    invoke-virtual {v13}, Ljava/io/File;->delete()Z

    move-result v18

    if-nez v18, :cond_2

    .line 190
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "Failed to delete previous temp file"

    invoke-virtual/range {v18 .. v19}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    .line 193
    :cond_2
    invoke-interface {v6, v13}, Lcom/amazon/insights/core/system/FileManager;->createFile(Ljava/io/File;)Ljava/io/File;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v12

    .line 199
    const/4 v4, 0x0

    .line 200
    .local v4, "errorsOccurred":Z
    if-eqz v12, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->exists()Z

    move-result v18

    if-eqz v18, :cond_8

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v18

    if-eqz v18, :cond_8

    .line 201
    const/4 v10, 0x0

    .line 202
    .local v10, "reader":Ljava/io/BufferedReader;
    const/16 v16, 0x0

    .line 204
    .local v16, "writer":Ljava/io/PrintWriter;
    :try_start_2
    new-instance v11, Ljava/io/BufferedReader;

    new-instance v18, Ljava/io/FileReader;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v19, v0

    invoke-direct/range {v18 .. v19}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v18

    invoke-direct {v11, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_e
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 205
    .end local v10    # "reader":Ljava/io/BufferedReader;
    .local v11, "reader":Ljava/io/BufferedReader;
    :try_start_3
    new-instance v17, Ljava/io/PrintWriter;

    new-instance v18, Ljava/io/FileWriter;

    const/16 v19, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v0, v12, v1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-direct/range {v17 .. v18}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_f
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_c
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 207
    .end local v16    # "writer":Ljava/io/PrintWriter;
    .local v17, "writer":Ljava/io/PrintWriter;
    const/4 v7, 0x0

    .line 208
    .local v7, "line":Ljava/lang/String;
    const/4 v2, 0x0

    .line 209
    .local v2, "currentLineNumber":I
    :cond_3
    :goto_2
    :try_start_4
    invoke-virtual {v11}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_9

    .line 210
    add-int/lit8 v2, v2, 0x1

    .line 211
    move/from16 v0, p1

    if-le v2, v0, :cond_3

    .line 212
    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 213
    invoke-virtual/range {v17 .. v17}, Ljava/io/PrintWriter;->flush()V
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_d
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_2

    .line 216
    :catch_1
    move-exception v3

    move-object/from16 v16, v17

    .end local v17    # "writer":Ljava/io/PrintWriter;
    .restart local v16    # "writer":Ljava/io/PrintWriter;
    move-object v10, v11

    .line 217
    .end local v2    # "currentLineNumber":I
    .end local v7    # "line":Ljava/lang/String;
    .end local v11    # "reader":Ljava/io/BufferedReader;
    .local v3, "e":Ljava/io/FileNotFoundException;
    .restart local v10    # "reader":Ljava/io/BufferedReader;
    :goto_3
    const/4 v4, 0x1

    .line 218
    :try_start_5
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "The events file count not be found"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v3}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 223
    if-eqz v16, :cond_4

    .line 224
    invoke-virtual/range {v16 .. v16}, Ljava/io/PrintWriter;->close()V

    .line 226
    :cond_4
    if-eqz v10, :cond_5

    .line 228
    :try_start_6
    invoke-virtual {v10}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_9

    .line 234
    :cond_5
    :goto_4
    if-nez v4, :cond_7

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->delete()Z

    move-result v18

    if-eqz v18, :cond_e

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v18

    if-nez v18, :cond_6

    .line 237
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "Failed to rename temp file to events file"

    invoke-virtual/range {v18 .. v19}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    .line 240
    :cond_6
    :try_start_7
    new-instance v18, Ljava/io/File;

    const-string v19, "eventsFile"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v5, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object/from16 v0, v18

    invoke-interface {v6, v0}, Lcom/amazon/insights/core/system/FileManager;->createFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    .line 250
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :cond_7
    :goto_5
    new-instance v13, Ljava/io/File;

    .end local v13    # "tempFile":Ljava/io/File;
    const-string v18, "eventsFile.tmp"

    move-object/from16 v0, v18

    invoke-direct {v13, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 251
    .restart local v13    # "tempFile":Ljava/io/File;
    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    move-result v18

    if-eqz v18, :cond_8

    .line 252
    invoke-virtual {v13}, Ljava/io/File;->delete()Z

    move-result v18

    if-nez v18, :cond_8

    .line 253
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "Failed to delete temp file"

    invoke-virtual/range {v18 .. v19}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    .line 257
    .end local v10    # "reader":Ljava/io/BufferedReader;
    .end local v16    # "writer":Ljava/io/PrintWriter;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v18, v0

    goto/16 :goto_1

    .line 194
    .end local v4    # "errorsOccurred":Z
    .end local v13    # "tempFile":Ljava/io/File;
    :catch_2
    move-exception v3

    .line 195
    .local v3, "e":Ljava/io/IOException;
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "An error occurred while attempting to create/open the temporary events file"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v3}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 196
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v18, v0

    goto/16 :goto_1

    .line 223
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v2    # "currentLineNumber":I
    .restart local v4    # "errorsOccurred":Z
    .restart local v7    # "line":Ljava/lang/String;
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v13    # "tempFile":Ljava/io/File;
    .restart local v17    # "writer":Ljava/io/PrintWriter;
    :cond_9
    if-eqz v17, :cond_a

    .line 224
    invoke-virtual/range {v17 .. v17}, Ljava/io/PrintWriter;->close()V

    .line 226
    :cond_a
    if-eqz v11, :cond_b

    .line 228
    :try_start_8
    invoke-virtual {v11}, Ljava/io/BufferedReader;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_8

    .line 234
    :cond_b
    :goto_6
    if-nez v4, :cond_18

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->delete()Z

    move-result v18

    if-eqz v18, :cond_d

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v18

    if-nez v18, :cond_c

    .line 237
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "Failed to rename temp file to events file"

    invoke-virtual/range {v18 .. v19}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    .line 240
    :cond_c
    :try_start_9
    new-instance v18, Ljava/io/File;

    const-string v19, "eventsFile"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v5, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object/from16 v0, v18

    invoke-interface {v6, v0}, Lcom/amazon/insights/core/system/FileManager;->createFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    move-object/from16 v16, v17

    .end local v17    # "writer":Ljava/io/PrintWriter;
    .restart local v16    # "writer":Ljava/io/PrintWriter;
    move-object v10, v11

    .line 243
    .end local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v10    # "reader":Ljava/io/BufferedReader;
    goto :goto_5

    .line 241
    .end local v10    # "reader":Ljava/io/BufferedReader;
    .end local v16    # "writer":Ljava/io/PrintWriter;
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v17    # "writer":Ljava/io/PrintWriter;
    :catch_3
    move-exception v3

    .line 242
    .restart local v3    # "e":Ljava/io/IOException;
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "An error occurred while attempting to create the eventsFile"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v3}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object/from16 v16, v17

    .end local v17    # "writer":Ljava/io/PrintWriter;
    .restart local v16    # "writer":Ljava/io/PrintWriter;
    move-object v10, v11

    .line 243
    .end local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v10    # "reader":Ljava/io/BufferedReader;
    goto/16 :goto_5

    .line 245
    .end local v3    # "e":Ljava/io/IOException;
    .end local v10    # "reader":Ljava/io/BufferedReader;
    .end local v16    # "writer":Ljava/io/PrintWriter;
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v17    # "writer":Ljava/io/PrintWriter;
    :cond_d
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "Failed to delete previous events file"

    invoke-virtual/range {v18 .. v19}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    move-object/from16 v16, v17

    .end local v17    # "writer":Ljava/io/PrintWriter;
    .restart local v16    # "writer":Ljava/io/PrintWriter;
    move-object v10, v11

    .end local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v10    # "reader":Ljava/io/BufferedReader;
    goto/16 :goto_5

    .line 241
    .end local v2    # "currentLineNumber":I
    .end local v7    # "line":Ljava/lang/String;
    .local v3, "e":Ljava/io/FileNotFoundException;
    :catch_4
    move-exception v3

    .line 242
    .local v3, "e":Ljava/io/IOException;
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "An error occurred while attempting to create the eventsFile"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v3}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_5

    .line 245
    .local v3, "e":Ljava/io/FileNotFoundException;
    :cond_e
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "Failed to delete previous events file"

    invoke-virtual/range {v18 .. v19}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 219
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :catch_5
    move-exception v3

    .line 220
    .local v3, "e":Ljava/io/IOException;
    :goto_7
    :try_start_a
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "An error occurred while attempting to delete the read events"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v3}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 221
    const/4 v4, 0x1

    .line 223
    if-eqz v16, :cond_f

    .line 224
    invoke-virtual/range {v16 .. v16}, Ljava/io/PrintWriter;->close()V

    .line 226
    :cond_f
    if-eqz v10, :cond_10

    .line 228
    :try_start_b
    invoke-virtual {v10}, Ljava/io/BufferedReader;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_a

    .line 234
    :cond_10
    :goto_8
    if-nez v4, :cond_7

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->delete()Z

    move-result v18

    if-eqz v18, :cond_12

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v18

    if-nez v18, :cond_11

    .line 237
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "Failed to rename temp file to events file"

    invoke-virtual/range {v18 .. v19}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    .line 240
    :cond_11
    :try_start_c
    new-instance v18, Ljava/io/File;

    const-string v19, "eventsFile"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v5, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object/from16 v0, v18

    invoke-interface {v6, v0}, Lcom/amazon/insights/core/system/FileManager;->createFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_6

    goto/16 :goto_5

    .line 241
    :catch_6
    move-exception v3

    .line 242
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "An error occurred while attempting to create the eventsFile"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v3}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_5

    .line 245
    :cond_12
    sget-object v18, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v19, "Failed to delete previous events file"

    invoke-virtual/range {v18 .. v19}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 223
    .end local v3    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v18

    :goto_9
    if-eqz v16, :cond_13

    .line 224
    invoke-virtual/range {v16 .. v16}, Ljava/io/PrintWriter;->close()V

    .line 226
    :cond_13
    if-eqz v10, :cond_14

    .line 228
    :try_start_d
    invoke-virtual {v10}, Ljava/io/BufferedReader;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_b

    .line 234
    :cond_14
    :goto_a
    if-nez v4, :cond_16

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->delete()Z

    move-result v19

    if-eqz v19, :cond_17

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v19

    if-nez v19, :cond_15

    .line 237
    sget-object v19, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v20, "Failed to rename temp file to events file"

    invoke-virtual/range {v19 .. v20}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    .line 240
    :cond_15
    :try_start_e
    new-instance v19, Ljava/io/File;

    const-string v20, "eventsFile"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v5, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-interface {v6, v0}, Lcom/amazon/insights/core/system/FileManager;->createFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_7

    .line 245
    :cond_16
    :goto_b
    throw v18

    .line 241
    :catch_7
    move-exception v3

    .line 242
    .restart local v3    # "e":Ljava/io/IOException;
    sget-object v19, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v20, "An error occurred while attempting to create the eventsFile"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v3}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_b

    .line 245
    .end local v3    # "e":Ljava/io/IOException;
    :cond_17
    sget-object v19, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v20, "Failed to delete previous events file"

    invoke-virtual/range {v19 .. v20}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V

    goto :goto_b

    .line 229
    .end local v10    # "reader":Ljava/io/BufferedReader;
    .end local v16    # "writer":Ljava/io/PrintWriter;
    .restart local v2    # "currentLineNumber":I
    .restart local v7    # "line":Ljava/lang/String;
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v17    # "writer":Ljava/io/PrintWriter;
    :catch_8
    move-exception v18

    goto/16 :goto_6

    .end local v2    # "currentLineNumber":I
    .end local v7    # "line":Ljava/lang/String;
    .end local v11    # "reader":Ljava/io/BufferedReader;
    .end local v17    # "writer":Ljava/io/PrintWriter;
    .local v3, "e":Ljava/io/FileNotFoundException;
    .restart local v10    # "reader":Ljava/io/BufferedReader;
    .restart local v16    # "writer":Ljava/io/PrintWriter;
    :catch_9
    move-exception v18

    goto/16 :goto_4

    .local v3, "e":Ljava/io/IOException;
    :catch_a
    move-exception v18

    goto/16 :goto_8

    .end local v3    # "e":Ljava/io/IOException;
    :catch_b
    move-exception v19

    goto :goto_a

    .line 223
    .end local v10    # "reader":Ljava/io/BufferedReader;
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v18

    move-object v10, v11

    .end local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v10    # "reader":Ljava/io/BufferedReader;
    goto :goto_9

    .end local v10    # "reader":Ljava/io/BufferedReader;
    .end local v16    # "writer":Ljava/io/PrintWriter;
    .restart local v2    # "currentLineNumber":I
    .restart local v7    # "line":Ljava/lang/String;
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v17    # "writer":Ljava/io/PrintWriter;
    :catchall_2
    move-exception v18

    move-object/from16 v16, v17

    .end local v17    # "writer":Ljava/io/PrintWriter;
    .restart local v16    # "writer":Ljava/io/PrintWriter;
    move-object v10, v11

    .end local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v10    # "reader":Ljava/io/BufferedReader;
    goto :goto_9

    .line 219
    .end local v2    # "currentLineNumber":I
    .end local v7    # "line":Ljava/lang/String;
    .end local v10    # "reader":Ljava/io/BufferedReader;
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    :catch_c
    move-exception v3

    move-object v10, v11

    .end local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v10    # "reader":Ljava/io/BufferedReader;
    goto/16 :goto_7

    .end local v10    # "reader":Ljava/io/BufferedReader;
    .end local v16    # "writer":Ljava/io/PrintWriter;
    .restart local v2    # "currentLineNumber":I
    .restart local v7    # "line":Ljava/lang/String;
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v17    # "writer":Ljava/io/PrintWriter;
    :catch_d
    move-exception v3

    move-object/from16 v16, v17

    .end local v17    # "writer":Ljava/io/PrintWriter;
    .restart local v16    # "writer":Ljava/io/PrintWriter;
    move-object v10, v11

    .end local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v10    # "reader":Ljava/io/BufferedReader;
    goto/16 :goto_7

    .line 216
    .end local v2    # "currentLineNumber":I
    .end local v7    # "line":Ljava/lang/String;
    :catch_e
    move-exception v3

    goto/16 :goto_3

    .end local v10    # "reader":Ljava/io/BufferedReader;
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    :catch_f
    move-exception v3

    move-object v10, v11

    .end local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v10    # "reader":Ljava/io/BufferedReader;
    goto/16 :goto_3

    .end local v10    # "reader":Ljava/io/BufferedReader;
    .end local v16    # "writer":Ljava/io/PrintWriter;
    .restart local v2    # "currentLineNumber":I
    .restart local v7    # "line":Ljava/lang/String;
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v17    # "writer":Ljava/io/PrintWriter;
    :cond_18
    move-object/from16 v16, v17

    .end local v17    # "writer":Ljava/io/PrintWriter;
    .restart local v16    # "writer":Ljava/io/PrintWriter;
    move-object v10, v11

    .end local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v10    # "reader":Ljava/io/BufferedReader;
    goto/16 :goto_5
.end method

.method public static newInstance(Lcom/amazon/insights/core/InsightsContext;)Lcom/amazon/insights/delivery/FileEventStore;
    .locals 1
    .param p0, "context"    # Lcom/amazon/insights/core/InsightsContext;

    .prologue
    .line 50
    new-instance v0, Lcom/amazon/insights/delivery/FileEventStore;

    invoke-direct {v0, p0}, Lcom/amazon/insights/delivery/FileEventStore;-><init>(Lcom/amazon/insights/core/InsightsContext;)V

    return-object v0
.end method

.method private tryCloseWriter(Ljava/io/Writer;)V
    .locals 3
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/insights/delivery/EventStoreException;
        }
    .end annotation

    .prologue
    .line 157
    if-eqz p1, :cond_0

    .line 159
    :try_start_0
    invoke-virtual {p1}, Ljava/io/Writer;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    :cond_0
    :goto_0
    return-void

    .line 160
    :catch_0
    move-exception v0

    .line 161
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Unable to close writer for events file"

    invoke-virtual {v1, v2, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private tryCreateEventsFile()Z
    .locals 6

    .prologue
    const/4 v3, 0x1

    .line 112
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 130
    :goto_0
    return v3

    .line 116
    :cond_0
    monitor-enter p0

    .line 117
    :try_start_0
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 118
    monitor-exit p0

    goto :goto_0

    .line 131
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 122
    :cond_1
    :try_start_1
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v4}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v4

    invoke-interface {v4}, Lcom/amazon/insights/core/system/System;->getFileManager()Lcom/amazon/insights/core/system/FileManager;

    move-result-object v2

    .line 123
    .local v2, "fileManager":Lcom/amazon/insights/core/system/FileManager;
    const-string v4, "events"

    invoke-interface {v2, v4}, Lcom/amazon/insights/core/system/FileManager;->createDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 124
    .local v1, "eventsDir":Ljava/io/File;
    new-instance v4, Ljava/io/File;

    const-string v5, "eventsFile"

    invoke-direct {v4, v1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-interface {v2, v4}, Lcom/amazon/insights/core/system/FileManager;->createFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v4

    iput-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    :try_start_2
    monitor-exit p0

    goto :goto_0

    .line 126
    .end local v1    # "eventsDir":Ljava/io/File;
    .end local v2    # "fileManager":Lcom/amazon/insights/core/system/FileManager;
    :catch_0
    move-exception v0

    .line 127
    .local v0, "e":Ljava/io/IOException;
    sget-object v3, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v4, "Unable to open events file"

    invoke-virtual {v3, v4}, Lcom/amazon/insights/core/log/Logger;->deve(Ljava/lang/String;)V

    .line 128
    sget-object v3, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v4, "An error occurred while attempting to create/open the events file"

    invoke-virtual {v3, v4, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 130
    const/4 v3, 0x0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method private tryInitializeWriter()Ljava/io/Writer;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/insights/delivery/EventStoreException;
        }
    .end annotation

    .prologue
    .line 135
    const/4 v3, 0x0

    .line 137
    .local v3, "writer":Ljava/io/Writer;
    :try_start_0
    invoke-direct {p0}, Lcom/amazon/insights/delivery/FileEventStore;->tryCreateEventsFile()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 138
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v4}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v4

    invoke-interface {v4}, Lcom/amazon/insights/core/system/System;->getFileManager()Lcom/amazon/insights/core/system/FileManager;

    move-result-object v4

    iget-object v5, p0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    const/4 v6, 0x1

    invoke-interface {v4, v5, v6}, Lcom/amazon/insights/core/system/FileManager;->newOutputStream(Ljava/io/File;Z)Ljava/io/OutputStream;

    move-result-object v2

    .line 139
    .local v2, "stream":Ljava/io/OutputStream;
    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-direct {v1, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 140
    .local v1, "strWriter":Ljava/io/OutputStreamWriter;
    new-instance v3, Lcom/amazon/insights/core/io/EncryptedWriter;

    .end local v3    # "writer":Ljava/io/Writer;
    iget-object v4, p0, Lcom/amazon/insights/delivery/FileEventStore;->secretKey:Ljavax/crypto/SecretKey;

    invoke-direct {v3, v1, v4}, Lcom/amazon/insights/core/io/EncryptedWriter;-><init>(Ljava/io/Writer;Ljavax/crypto/SecretKey;)V

    .line 153
    .restart local v3    # "writer":Ljava/io/Writer;
    return-object v3

    .line 142
    .end local v1    # "strWriter":Ljava/io/OutputStreamWriter;
    .end local v2    # "stream":Ljava/io/OutputStream;
    :cond_0
    new-instance v4, Lcom/amazon/insights/delivery/EventStoreException;

    const-string v5, "Unable to create eventsFile"

    invoke-direct {v4, v5}, Lcom/amazon/insights/delivery/EventStoreException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Lcom/amazon/insights/delivery/EventStoreException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 144
    .end local v3    # "writer":Ljava/io/Writer;
    :catch_0
    move-exception v0

    .line 145
    .local v0, "e":Lcom/amazon/insights/delivery/EventStoreException;
    throw v0

    .line 146
    .end local v0    # "e":Lcom/amazon/insights/delivery/EventStoreException;
    :catch_1
    move-exception v0

    .line 147
    .local v0, "e":Ljava/io/FileNotFoundException;
    sget-object v4, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v5, "Events file not found to persist event to"

    invoke-virtual {v4, v5, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 148
    new-instance v4, Lcom/amazon/insights/delivery/EventStoreException;

    const-string v5, "Unable to open events file writer"

    invoke-direct {v4, v5, v0}, Lcom/amazon/insights/delivery/EventStoreException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 149
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_2
    move-exception v0

    .line 150
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v5, "Unexpected exception"

    invoke-virtual {v4, v5, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 151
    new-instance v4, Lcom/amazon/insights/delivery/EventStoreException;

    const-string v5, "Unexpected error while creating eventsFile writer"

    invoke-direct {v4, v5, v0}, Lcom/amazon/insights/delivery/EventStoreException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method


# virtual methods
.method public iterator()Lcom/amazon/insights/delivery/EventStore$EventIterator;
    .locals 1

    .prologue
    .line 262
    new-instance v0, Lcom/amazon/insights/delivery/FileEventStore$1;

    invoke-direct {v0, p0}, Lcom/amazon/insights/delivery/FileEventStore$1;-><init>(Lcom/amazon/insights/delivery/FileEventStore;)V

    return-object v0
.end method

.method public put(Ljava/lang/String;)Z
    .locals 9
    .param p1, "event"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/insights/delivery/EventStoreException;
        }
    .end annotation

    .prologue
    .line 86
    const/4 v3, 0x0

    .line 87
    .local v3, "success":Z
    const/4 v4, 0x0

    .line 88
    .local v4, "writer":Ljava/io/Writer;
    iget-object v5, p0, Lcom/amazon/insights/delivery/FileEventStore;->accessLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 90
    :try_start_0
    invoke-direct {p0}, Lcom/amazon/insights/delivery/FileEventStore;->tryInitializeWriter()Ljava/io/Writer;

    move-result-object v4

    .line 91
    if-eqz v4, :cond_0

    .line 92
    iget-object v5, p0, Lcom/amazon/insights/delivery/FileEventStore;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v5}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v5

    const-string v6, "maxStorageSize"

    const-wide/32 v7, 0x500000

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lcom/amazon/insights/core/configuration/Configuration;->optLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 93
    .local v1, "maxStorageSize":J
    iget-object v5, p0, Lcom/amazon/insights/delivery/FileEventStore;->eventsFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    int-to-long v7, v7

    add-long/2addr v5, v7

    cmp-long v5, v5, v1

    if-gtz v5, :cond_1

    .line 94
    invoke-virtual {v4, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 95
    invoke-virtual {v4}, Ljava/io/Writer;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    const/4 v3, 0x1

    .line 104
    .end local v1    # "maxStorageSize":J
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/amazon/insights/delivery/FileEventStore;->accessLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 105
    invoke-direct {p0, v4}, Lcom/amazon/insights/delivery/FileEventStore;->tryCloseWriter(Ljava/io/Writer;)V

    .line 108
    :goto_1
    return v3

    .line 98
    .restart local v1    # "maxStorageSize":J
    :cond_1
    :try_start_1
    sget-object v5, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "The events file exceeded its allowed size of "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " bytes"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 101
    .end local v1    # "maxStorageSize":J
    :catch_0
    move-exception v0

    .line 102
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    sget-object v5, Lcom/amazon/insights/delivery/FileEventStore;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v6, "Failed to persist the event"

    invoke-virtual {v5, v6, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 104
    iget-object v5, p0, Lcom/amazon/insights/delivery/FileEventStore;->accessLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 105
    invoke-direct {p0, v4}, Lcom/amazon/insights/delivery/FileEventStore;->tryCloseWriter(Ljava/io/Writer;)V

    goto :goto_1

    .line 104
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    iget-object v6, p0, Lcom/amazon/insights/delivery/FileEventStore;->accessLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 105
    invoke-direct {p0, v4}, Lcom/amazon/insights/delivery/FileEventStore;->tryCloseWriter(Ljava/io/Writer;)V

    throw v5
.end method
