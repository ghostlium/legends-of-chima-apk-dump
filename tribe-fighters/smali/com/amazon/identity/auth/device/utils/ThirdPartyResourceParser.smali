.class public Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;
.super Ljava/lang/Object;
.source "ThirdPartyResourceParser.java"


# static fields
.field private static final API_KEY_FILE:Ljava/lang/String; = "api_key.txt"

.field public static final KEY_API_KEY:Ljava/lang/String; = "APIKey"

.field private static final LOG_TAG:Ljava/lang/String;

.field private static final UTF_8:Ljava/lang/String; = "UTF-8"


# instance fields
.field private final _apiKey:Ljava/lang/String;

.field private final _context:Landroid/content/Context;

.field private final _packageName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packageName"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p2, p0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->_packageName:Ljava/lang/String;

    .line 46
    iput-object p1, p0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->_context:Landroid/content/Context;

    .line 47
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->parseApiKey()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->_apiKey:Ljava/lang/String;

    .line 48
    return-void
.end method

.method private getStringValueFromMetaData(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 157
    const/4 v2, 0x0

    .line 158
    .local v2, "value":Ljava/lang/String;
    iget-object v3, p0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->_context:Landroid/content/Context;

    if-eqz v3, :cond_0

    .line 160
    sget-object v3, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Attempting to parse API Key from meta data in Android manifest"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    :try_start_0
    iget-object v3, p0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->_context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->_packageName:Ljava/lang/String;

    const/16 v5, 0x80

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 164
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v3, :cond_0

    .line 166
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    invoke-virtual {v3, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 173
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_0
    :goto_0
    return-object v2

    .line 168
    :catch_0
    move-exception v1

    .line 170
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v3, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(key="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private parseApiKey()Ljava/lang/String;
    .locals 7

    .prologue
    .line 56
    iget-object v4, p0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->_context:Landroid/content/Context;

    if-eqz v4, :cond_2

    .line 58
    const/4 v2, 0x0

    .line 61
    .local v2, "is":Ljava/io/InputStream;
    :try_start_0
    iget-object v4, p0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->_context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    iget-object v5, p0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->_packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v3

    .line 62
    .local v3, "resources":Landroid/content/res/Resources;
    invoke-virtual {v3}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 63
    .local v0, "assetManager":Landroid/content/res/AssetManager;
    const-string v4, "api_key.txt"

    invoke-virtual {v0, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 64
    sget-object v4, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Attempting to parse API Key from assets directory"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    invoke-static {v2}, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->readString(Ljava/io/InputStream;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 67
    if-eqz v2, :cond_0

    .line 69
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 78
    .end local v0    # "assetManager":Landroid/content/res/AssetManager;
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v3    # "resources":Landroid/content/res/Resources;
    :cond_0
    :goto_0
    return-object v4

    .line 67
    .restart local v2    # "is":Ljava/io/InputStream;
    :catchall_0
    move-exception v4

    if-eqz v2, :cond_1

    .line 69
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    :cond_1
    throw v4
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 72
    :catch_0
    move-exception v1

    .line 73
    .local v1, "e":Ljava/io/IOException;
    sget-object v4, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to get api key asset document: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "is":Ljava/io/InputStream;
    :cond_2
    :goto_1
    const/4 v4, 0x0

    goto :goto_0

    .line 74
    .restart local v2    # "is":Ljava/io/InputStream;
    :catch_1
    move-exception v1

    .line 75
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v4, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to get api key asset document: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method static readString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 11
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    const/4 v6, 0x0

    .line 91
    .local v6, "result":Ljava/lang/String;
    const/4 v4, 0x0

    .line 92
    .local v4, "r":Ljava/io/Reader;
    const/4 v0, 0x0

    .line 95
    .local v0, "br":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v5, Ljava/io/InputStreamReader;

    const-string v7, "UTF-8"

    invoke-direct {v5, p0, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    .end local v4    # "r":Ljava/io/Reader;
    .local v5, "r":Ljava/io/Reader;
    :try_start_1
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 97
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_8
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result-object v6

    .line 106
    if-eqz v5, :cond_0

    .line 107
    :try_start_3
    invoke-virtual {v5}, Ljava/io/Reader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 113
    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    .line 114
    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    :cond_1
    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v4, v5

    .line 121
    .end local v5    # "r":Ljava/io/Reader;
    .restart local v4    # "r":Ljava/io/Reader;
    :cond_2
    :goto_1
    return-object v6

    .line 109
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v4    # "r":Ljava/io/Reader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v5    # "r":Ljava/io/Reader;
    :catch_0
    move-exception v3

    .line 110
    .local v3, "ex":Ljava/io/IOException;
    sget-object v7, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to close InputStreamReader: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 116
    .end local v3    # "ex":Ljava/io/IOException;
    :catch_1
    move-exception v3

    .line 117
    .restart local v3    # "ex":Ljava/io/IOException;
    sget-object v7, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to close BufferedReader: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v4, v5

    .line 119
    .end local v5    # "r":Ljava/io/Reader;
    .restart local v4    # "r":Ljava/io/Reader;
    goto :goto_1

    .line 99
    .end local v3    # "ex":Ljava/io/IOException;
    :catch_2
    move-exception v2

    .line 101
    .local v2, "e":Ljava/io/IOException;
    :goto_2
    :try_start_5
    sget-object v7, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable read from asset: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 106
    if-eqz v4, :cond_3

    .line 107
    :try_start_6
    invoke-virtual {v4}, Ljava/io/Reader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 113
    :cond_3
    :goto_3
    if-eqz v0, :cond_2

    .line 114
    :try_start_7
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    goto :goto_1

    .line 116
    :catch_3
    move-exception v3

    .line 117
    .restart local v3    # "ex":Ljava/io/IOException;
    sget-object v7, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to close BufferedReader: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 109
    .end local v3    # "ex":Ljava/io/IOException;
    :catch_4
    move-exception v3

    .line 110
    .restart local v3    # "ex":Ljava/io/IOException;
    sget-object v7, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to close InputStreamReader: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 105
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v7

    .line 106
    :goto_4
    if-eqz v4, :cond_4

    .line 107
    :try_start_8
    invoke-virtual {v4}, Ljava/io/Reader;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    .line 113
    :cond_4
    :goto_5
    if-eqz v0, :cond_5

    .line 114
    :try_start_9
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    .line 118
    :cond_5
    :goto_6
    throw v7

    .line 109
    :catch_5
    move-exception v3

    .line 110
    .restart local v3    # "ex":Ljava/io/IOException;
    sget-object v8, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unable to close InputStreamReader: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 116
    .end local v3    # "ex":Ljava/io/IOException;
    :catch_6
    move-exception v3

    .line 117
    .restart local v3    # "ex":Ljava/io/IOException;
    sget-object v8, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unable to close BufferedReader: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    .line 105
    .end local v3    # "ex":Ljava/io/IOException;
    .end local v4    # "r":Ljava/io/Reader;
    .restart local v5    # "r":Ljava/io/Reader;
    :catchall_1
    move-exception v7

    move-object v4, v5

    .end local v5    # "r":Ljava/io/Reader;
    .restart local v4    # "r":Ljava/io/Reader;
    goto :goto_4

    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v4    # "r":Ljava/io/Reader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v5    # "r":Ljava/io/Reader;
    :catchall_2
    move-exception v7

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v4, v5

    .end local v5    # "r":Ljava/io/Reader;
    .restart local v4    # "r":Ljava/io/Reader;
    goto :goto_4

    .line 99
    .end local v4    # "r":Ljava/io/Reader;
    .restart local v5    # "r":Ljava/io/Reader;
    :catch_7
    move-exception v2

    move-object v4, v5

    .end local v5    # "r":Ljava/io/Reader;
    .restart local v4    # "r":Ljava/io/Reader;
    goto/16 :goto_2

    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v4    # "r":Ljava/io/Reader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v5    # "r":Ljava/io/Reader;
    :catch_8
    move-exception v2

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    move-object v4, v5

    .end local v5    # "r":Ljava/io/Reader;
    .restart local v4    # "r":Ljava/io/Reader;
    goto/16 :goto_2
.end method


# virtual methods
.method public getApiKey()Ljava/lang/String;
    .locals 2

    .prologue
    .line 132
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->isApiKeyInAssest()Z

    move-result v0

    if-nez v0, :cond_0

    .line 134
    sget-object v0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Unable to get API Key from Assests"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    const-string v0, "APIKey"

    invoke-direct {p0, v0}, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->getStringValueFromMetaData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 137
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->_apiKey:Ljava/lang/String;

    goto :goto_0
.end method

.method public isApiKeyInAssest()Z
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/amazon/identity/auth/device/utils/ThirdPartyResourceParser;->_apiKey:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
