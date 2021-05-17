.class public Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;
.super Lcom/amazon/ags/html5/javascript/CallHandlerBase;
.source "NativeKindleFireStateCallHandler.java"


# static fields
.field private static final GC_KINDLE_SETTINGS_ACTION:Ljava/lang/String; = "com.amazon.ags.app.AMAZON_GAMES_SETTINGS"

.field private static final GC_PACKAGE_NAME:Ljava/lang/String; = "com.amazon.ags.app"

.field private static final supportedCalls:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final context:Landroid/content/Context;

.field private final kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 29
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "isKindle"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "isGCServiceReady"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "isKindleRegistered"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "hasOptedIn"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "isWhispersyncEnabled"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "setOptIn"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "canDisplayKindleSettings"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "launchKindleSettings"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->supportedCalls:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Lcom/amazon/ags/client/KindleFireProxy;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uiThreadHandler"    # Landroid/os/Handler;
    .param p3, "kindleFireProxy"    # Lcom/amazon/ags/client/KindleFireProxy;

    .prologue
    .line 49
    sget-object v0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->supportedCalls:Ljava/util/Set;

    invoke-direct {p0, p2, v0}, Lcom/amazon/ags/html5/javascript/CallHandlerBase;-><init>(Landroid/os/Handler;Ljava/util/Set;)V

    .line 50
    iput-object p3, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    .line 51
    iput-object p1, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->context:Landroid/content/Context;

    .line 52
    return-void
.end method

.method private checkKindleGameSettingsAvailability()Z
    .locals 4

    .prologue
    .line 120
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 121
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "com.amazon.ags.app.AMAZON_GAMES_SETTINGS"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 122
    const-string v2, "com.amazon.ags.app"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 123
    iget-object v2, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/high16 v3, 0x10000

    invoke-virtual {v2, v0, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 124
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private launchSettings()V
    .locals 2

    .prologue
    .line 128
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 129
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.amazon.ags.app.AMAZON_GAMES_SETTINGS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 130
    const-string v1, "com.amazon.ags.app"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 131
    const/high16 v1, 0x10010000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 132
    iget-object v1, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 133
    return-void
.end method

.method private makeJsonReplyForSingleValue(Ljava/lang/Object;)Ljava/lang/String;
    .locals 5
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 109
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 111
    .local v1, "jsonReply":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "value"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    return-object v2

    .line 112
    :catch_0
    move-exception v0

    .line 113
    .local v0, "e":Lorg/json/JSONException;
    iget-object v2, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to make JSON relpy to Javascript for value ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 114
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected handleMessage(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 14
    .param p1, "rid"    # Ljava/lang/String;
    .param p2, "nativeCallType"    # Ljava/lang/String;
    .param p3, "request"    # Lorg/json/JSONObject;

    .prologue
    .line 56
    iget-object v11, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Processing request ["

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "] for call type ["

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "]"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    const/4 v9, 0x0

    .line 60
    .local v9, "jsonReply":Ljava/lang/String;
    const-string v11, "isKindle"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 61
    iget-object v11, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    invoke-interface {v11}, Lcom/amazon/ags/client/KindleFireProxy;->isKindle()Z

    move-result v5

    .line 62
    .local v5, "isKindle":Z
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->makeJsonReplyForSingleValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 98
    .end local v5    # "isKindle":Z
    :cond_0
    :goto_0
    iget-object v11, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Returning reply ["

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "] for request ["

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "]"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    if-eqz v9, :cond_9

    .line 101
    invoke-virtual {v9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v12, "SUCCESS"

    invoke-virtual {p0, p1, v11, v12}, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    const/4 v11, 0x1

    .line 104
    :goto_1
    return v11

    .line 63
    :cond_1
    const-string v11, "isGCServiceReady"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 64
    iget-object v11, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    invoke-interface {v11}, Lcom/amazon/ags/client/KindleFireProxy;->isReady()Z

    move-result v6

    .line 65
    .local v6, "isReady":Z
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->makeJsonReplyForSingleValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 66
    goto :goto_0

    .end local v6    # "isReady":Z
    :cond_2
    const-string v11, "isKindleRegistered"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 67
    iget-object v11, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    invoke-interface {v11}, Lcom/amazon/ags/client/KindleFireProxy;->isRegistered()Z

    move-result v7

    .line 68
    .local v7, "isRegistered":Z
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->makeJsonReplyForSingleValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 69
    goto :goto_0

    .end local v7    # "isRegistered":Z
    :cond_3
    const-string v11, "hasOptedIn"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 70
    iget-object v11, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    invoke-interface {v11}, Lcom/amazon/ags/client/KindleFireProxy;->isOptedIn()Z

    move-result v4

    .line 71
    .local v4, "hasOptedIn":Z
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->makeJsonReplyForSingleValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 72
    goto :goto_0

    .end local v4    # "hasOptedIn":Z
    :cond_4
    const-string v11, "isWhispersyncEnabled"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 73
    iget-object v11, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    invoke-interface {v11}, Lcom/amazon/ags/client/KindleFireProxy;->isWhispersyncEnabled()Z

    move-result v8

    .line 74
    .local v8, "isWhipersyncEnabled":Z
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->makeJsonReplyForSingleValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 75
    goto/16 :goto_0

    .end local v8    # "isWhipersyncEnabled":Z
    :cond_5
    const-string v11, "setOptIn"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 77
    :try_start_0
    const-string v11, "parameters"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 78
    .local v10, "parameters":Lorg/json/JSONObject;
    const-string v11, "hasOptedIn"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    .line 79
    .restart local v4    # "hasOptedIn":Z
    iget-object v11, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    invoke-interface {v11, v4}, Lcom/amazon/ags/client/KindleFireProxy;->setOptIn(Z)V

    .line 80
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    goto/16 :goto_0

    .line 81
    .end local v4    # "hasOptedIn":Z
    .end local v10    # "parameters":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 82
    .local v2, "e":Lorg/json/JSONException;
    iget-object v11, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->TAG:Ljava/lang/String;

    const-string v12, "Unable to get value for key [hasOptedIn]"

    invoke-static {v11, v12, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 84
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_6
    const-string v11, "canDisplayKindleSettings"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 85
    iget-object v11, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    invoke-interface {v11}, Lcom/amazon/ags/client/KindleFireProxy;->isReady()Z

    move-result v6

    .line 86
    .restart local v6    # "isReady":Z
    iget-object v11, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    invoke-interface {v11}, Lcom/amazon/ags/client/KindleFireProxy;->isRegistered()Z

    move-result v7

    .line 87
    .restart local v7    # "isRegistered":Z
    if-eqz v6, :cond_7

    if-eqz v7, :cond_7

    invoke-direct {p0}, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->checkKindleGameSettingsAvailability()Z

    move-result v11

    if-eqz v11, :cond_7

    const/4 v1, 0x1

    .line 88
    .local v1, "canLaunchKindleSettings":Z
    :goto_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->makeJsonReplyForSingleValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 89
    goto/16 :goto_0

    .line 87
    .end local v1    # "canLaunchKindleSettings":Z
    :cond_7
    const/4 v1, 0x0

    goto :goto_2

    .line 89
    .end local v6    # "isReady":Z
    .end local v7    # "isRegistered":Z
    :cond_8
    const-string v11, "launchKindleSettings"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 91
    :try_start_1
    invoke-direct {p0}, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->launchSettings()V

    .line 92
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v9

    goto/16 :goto_0

    .line 93
    :catch_1
    move-exception v3

    .line 94
    .local v3, "exception":Landroid/content/ActivityNotFoundException;
    iget-object v11, p0, Lcom/amazon/ags/html5/javascript/NativeKindleFireStateCallHandler;->TAG:Ljava/lang/String;

    const-string v12, "Settings were either launched without checking that they are available or an expected error occurred"

    invoke-static {v11, v12, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 104
    .end local v3    # "exception":Landroid/content/ActivityNotFoundException;
    :cond_9
    const/4 v11, 0x0

    goto/16 :goto_1
.end method
