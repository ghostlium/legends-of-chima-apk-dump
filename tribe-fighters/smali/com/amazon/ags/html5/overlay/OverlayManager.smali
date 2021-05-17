.class public Lcom/amazon/ags/html5/overlay/OverlayManager;
.super Ljava/lang/Object;
.source "OverlayManager.java"

# interfaces
.implements Lcom/amazon/ags/html5/overlay/toasts/ClickableToastObserver;
.implements Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinatorListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;
    }
.end annotation


# static fields
.field private static final COMMON_LEADERBOARD_MINIMUM_WAIT:J = 0x2710L

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private activeToast:Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;

.field private activity:Landroid/app/Activity;

.field private final context:Landroid/content/Context;

.field private final gcVariationManager:Lcom/amazon/ags/html5/content/GCVariationManager;

.field private final imageManager:Lcom/amazon/ags/html5/util/ImageManager;

.field private final kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

.field private final leaderboardLastTimeShownMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

.field private final pendingToasts:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final toastFactory:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactory;

.field private final uiThreadHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/html5/overlay/OverlayManager;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactory;Lcom/amazon/ags/client/KindleFireProxy;Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;Lcom/amazon/ags/html5/content/GCVariationManager;Lcom/amazon/ags/html5/util/ImageManager;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uiThreadHandler"    # Landroid/os/Handler;
    .param p3, "toastFactory"    # Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactory;
    .param p4, "kindleFireProxy"    # Lcom/amazon/ags/client/KindleFireProxy;
    .param p5, "overlaySessionInformation"    # Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;
    .param p6, "gcVariationManager"    # Lcom/amazon/ags/html5/content/GCVariationManager;
    .param p7, "imageManager"    # Lcom/amazon/ags/html5/util/ImageManager;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->addAGSClientInstanceCoordinatorListener(Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinatorListener;)V

    .line 65
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->activity:Landroid/app/Activity;

    .line 67
    iput-object p5, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

    .line 68
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->context:Landroid/content/Context;

    .line 69
    iput-object p2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->uiThreadHandler:Landroid/os/Handler;

    .line 70
    iput-object p3, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->toastFactory:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactory;

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->activeToast:Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;

    .line 72
    iput-object p4, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    .line 73
    iput-object p6, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->gcVariationManager:Lcom/amazon/ags/html5/content/GCVariationManager;

    .line 74
    iput-object p7, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->imageManager:Lcom/amazon/ags/html5/util/ImageManager;

    .line 76
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->pendingToasts:Ljava/util/Queue;

    .line 77
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->leaderboardLastTimeShownMap:Ljava/util/Map;

    .line 78
    return-void
.end method

.method static synthetic access$000(Lcom/amazon/ags/html5/overlay/OverlayManager;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/amazon/ags/html5/overlay/OverlayManager;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->uiThreadHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private getVariationCacheJson()Lorg/json/JSONObject;
    .locals 7

    .prologue
    .line 151
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 153
    .local v4, "variationsJson":Lorg/json/JSONObject;
    iget-object v5, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->gcVariationManager:Lcom/amazon/ags/html5/content/GCVariationManager;

    invoke-virtual {v5}, Lcom/amazon/ags/html5/content/GCVariationManager;->getCachedVariations()Ljava/util/Map;

    move-result-object v3

    .line 156
    .local v3, "variations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 157
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 159
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v0

    .line 160
    .local v0, "e":Ljava/lang/Exception;
    sget-object v5, Lcom/amazon/ags/html5/overlay/OverlayManager;->TAG:Ljava/lang/String;

    const-string v6, "Error occurred while preparing variation cache for overlay"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 163
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    return-object v4
.end method

.method private declared-synchronized processNextToast()V
    .locals 22

    .prologue
    .line 167
    monitor-enter p0

    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->pendingToasts:Ljava/util/Queue;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    .local v8, "nextToastRequest":Ljava/lang/String;
    if-eqz v8, :cond_5

    .line 171
    :try_start_1
    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 173
    .local v14, "toastRequest":Lorg/json/JSONObject;
    const-string v17, "canBeDisabled"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 174
    .local v2, "canBeDisabled":Ljava/lang/String;
    sget-object v17, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->INSTANCE:Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    invoke-virtual/range {v17 .. v17}, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->isEnabled()Z

    move-result v17

    if-nez v17, :cond_0

    sget-object v17, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->INSTANCE:Lcom/amazon/ags/html5/overlay/PopUpPrefs;

    invoke-virtual/range {v17 .. v17}, Lcom/amazon/ags/html5/overlay/PopUpPrefs;->isEnabled()Z

    move-result v17

    if-nez v17, :cond_b

    const-string v17, "false"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_b

    .line 175
    :cond_0
    const-string v17, "type"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 176
    .local v15, "toastType":Ljava/lang/String;
    const-string v17, "dedupeTypes"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 178
    .local v4, "dedupeTypes":Lorg/json/JSONArray;
    const/4 v9, 0x0

    .line 179
    .local v9, "shouldHideCommonLeaderboardToast":Z
    const-string v17, "Leaderboard"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 180
    const-string v17, "leaderboardName"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 181
    .local v7, "leaderboardName":Ljava/lang/String;
    if-eqz v7, :cond_2

    .line 182
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->leaderboardLastTimeShownMap:Ljava/util/Map;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1

    .line 183
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->leaderboardLastTimeShownMap:Ljava/util/Map;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/Long;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Long;->longValue()J

    move-result-wide v20

    sub-long v17, v18, v20

    const-wide/16 v19, 0x2710

    cmp-long v17, v17, v19

    if-gez v17, :cond_1

    .line 184
    const/4 v9, 0x1

    .line 187
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->leaderboardLastTimeShownMap:Ljava/util/Map;

    move-object/from16 v17, v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    .end local v7    # "leaderboardName":Ljava/lang/String;
    :cond_2
    new-instance v12, Ljava/util/HashSet;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    invoke-direct {v12, v0}, Ljava/util/HashSet;-><init>(I)V

    .line 192
    .local v12, "toastDedupeTypes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    if-ge v6, v0, :cond_3

    .line 193
    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 194
    .local v3, "dedupeType":Ljava/lang/String;
    invoke-interface {v12, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 192
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 197
    .end local v3    # "dedupeType":Ljava/lang/String;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->activeToast:Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;

    move-object/from16 v17, v0

    if-eqz v17, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->activeToast:Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->getToast()Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;->isShowing()Z

    move-result v17

    if-eqz v17, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->activeToast:Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->isDedupeCompatibleWithType(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_6

    const/4 v10, 0x1

    .line 198
    .local v10, "shouldHideDuplicate":Z
    :goto_1
    if-nez v9, :cond_4

    if-eqz v10, :cond_7

    .line 199
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->pendingToasts:Ljava/util/Queue;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v8}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->activeToast:Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->aggregate(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 229
    .end local v2    # "canBeDisabled":Ljava/lang/String;
    .end local v4    # "dedupeTypes":Lorg/json/JSONArray;
    .end local v6    # "i":I
    .end local v9    # "shouldHideCommonLeaderboardToast":Z
    .end local v10    # "shouldHideDuplicate":Z
    .end local v12    # "toastDedupeTypes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v14    # "toastRequest":Lorg/json/JSONObject;
    .end local v15    # "toastType":Ljava/lang/String;
    :cond_5
    :goto_2
    monitor-exit p0

    return-void

    .line 197
    .restart local v2    # "canBeDisabled":Ljava/lang/String;
    .restart local v4    # "dedupeTypes":Lorg/json/JSONArray;
    .restart local v6    # "i":I
    .restart local v9    # "shouldHideCommonLeaderboardToast":Z
    .restart local v12    # "toastDedupeTypes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v14    # "toastRequest":Lorg/json/JSONObject;
    .restart local v15    # "toastType":Ljava/lang/String;
    :cond_6
    const/4 v10, 0x0

    goto :goto_1

    .line 201
    .restart local v10    # "shouldHideDuplicate":Z
    :cond_7
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->activeToast:Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;

    move-object/from16 v17, v0

    if-eqz v17, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->activeToast:Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;->getToast()Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;->isShowing()Z

    move-result v17

    if-eqz v17, :cond_9

    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->activeToast:Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;

    move-object/from16 v17, v0

    if-nez v17, :cond_5

    .line 202
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->pendingToasts:Ljava/util/Queue;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v8}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 204
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->toastFactory:Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactory;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v8}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToastFactory;->getClickableWebViewToast(Ljava/lang/String;)Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;

    move-result-object v11

    .line 205
    .local v11, "toast":Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;
    move-object/from16 v0, p0

    invoke-interface {v11, v0}, Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;->addClickableToastObserver(Lcom/amazon/ags/html5/overlay/toasts/ClickableToastObserver;)V

    .line 207
    new-instance v16, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;

    move-object/from16 v0, v16

    invoke-direct {v0, v15, v12, v11}, Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;-><init>(Ljava/lang/String;Ljava/util/Set;Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;)V

    .line 208
    .local v16, "toastWrapper":Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/amazon/ags/html5/overlay/OverlayManager;->activeToast:Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;

    .line 209
    const-string v17, "icon"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 210
    .local v13, "toastIconUrl":Ljava/lang/String;
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_a

    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->imageManager:Lcom/amazon/ags/html5/util/ImageManager;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Lcom/amazon/ags/html5/util/ImageManager;->downloadImage(Ljava/lang/String;)V

    .line 214
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->uiThreadHandler:Landroid/os/Handler;

    move-object/from16 v17, v0

    new-instance v18, Lcom/amazon/ags/html5/overlay/OverlayManager$1;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11}, Lcom/amazon/ags/html5/overlay/OverlayManager$1;-><init>(Lcom/amazon/ags/html5/overlay/OverlayManager;Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;)V

    invoke-virtual/range {v17 .. v18}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 224
    .end local v2    # "canBeDisabled":Ljava/lang/String;
    .end local v4    # "dedupeTypes":Lorg/json/JSONArray;
    .end local v6    # "i":I
    .end local v9    # "shouldHideCommonLeaderboardToast":Z
    .end local v10    # "shouldHideDuplicate":Z
    .end local v11    # "toast":Lcom/amazon/ags/html5/overlay/toasts/ClickableToast;
    .end local v12    # "toastDedupeTypes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v13    # "toastIconUrl":Ljava/lang/String;
    .end local v14    # "toastRequest":Lorg/json/JSONObject;
    .end local v15    # "toastType":Ljava/lang/String;
    .end local v16    # "toastWrapper":Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;
    :catch_0
    move-exception v5

    .line 225
    .local v5, "e":Ljava/lang/Exception;
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->pendingToasts:Ljava/util/Queue;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v8}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 226
    sget-object v17, Lcom/amazon/ags/html5/overlay/OverlayManager;->TAG:Ljava/lang/String;

    const-string v18, "Unable to parse toast request"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_2

    .line 167
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v8    # "nextToastRequest":Ljava/lang/String;
    :catchall_0
    move-exception v17

    monitor-exit p0

    throw v17

    .line 222
    .restart local v2    # "canBeDisabled":Ljava/lang/String;
    .restart local v8    # "nextToastRequest":Ljava/lang/String;
    .restart local v14    # "toastRequest":Lorg/json/JSONObject;
    :cond_b
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/amazon/ags/html5/overlay/OverlayManager;->pendingToasts:Ljava/util/Queue;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v8}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_2
.end method

.method private declared-synchronized refreshActivity()V
    .locals 2

    .prologue
    .line 280
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->activity:Landroid/app/Activity;

    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 281
    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->activity:Landroid/app/Activity;

    .line 282
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->activeToast:Lcom/amazon/ags/html5/overlay/OverlayManager$InGameToastWrapper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 284
    :cond_0
    monitor-exit p0

    return-void

    .line 280
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private showHtmlAlert(Ljava/lang/String;)V
    .locals 4
    .param p1, "overlayData"    # Ljava/lang/String;

    .prologue
    .line 123
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 125
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->context:Landroid/content/Context;

    const-class v3, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 131
    const/high16 v1, 0x14010000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 134
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 135
    const-string v1, "OVERLAY_DATA_BUNDLE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 136
    const-string v1, "OVERLAY_SESSION_CLIENT_VERSION"

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->getClientVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 137
    const-string v1, "OVERLAY_SESSION_CONTENT_VERSION"

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->getContentVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 138
    const-string v1, "OVERLAY_SESSION_APPLICATION_NAME"

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->getApplicationName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 139
    const-string v1, "OVERLAY_SESSION_LANGUAGE_CODE"

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->getLocalizationUtil()Lcom/amazon/ags/html5/util/LocalizationUtil;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/LocalizationUtil;->getLanguageCode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 140
    const-string v1, "OVERLAY_SESSION_COUNTRY_CODE"

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->getLocalizationUtil()Lcom/amazon/ags/html5/util/LocalizationUtil;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/LocalizationUtil;->getCountryCode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 141
    const-string v1, "OVERLAY_SESSION_DEVICE_IDENTIFIER"

    invoke-static {}, Lcom/amazon/ags/html5/util/DeviceInfo;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 142
    const-string v1, "OVERLAY_SESSION_DEVICE_MANUFACTURER"

    invoke-static {}, Lcom/amazon/ags/html5/util/DeviceInfo;->getManufacturer()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 143
    const-string v1, "OVERLAY_SESSION_DEVICE_MODEL"

    invoke-static {}, Lcom/amazon/ags/html5/util/DeviceInfo;->getModel()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 144
    const-string v1, "OVERLAY_SESSION_DEVICE_TYPE"

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->getDeviceInfo()Lcom/amazon/ags/html5/util/DeviceInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/DeviceInfo;->getDeviceType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 145
    const-string v1, "OVERLAY_SESSION_VARIATION_CACHE"

    invoke-direct {p0}, Lcom/amazon/ags/html5/overlay/OverlayManager;->getVariationCacheJson()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 147
    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 148
    return-void
.end method

.method private showHtmlOverlay(Ljava/lang/String;)V
    .locals 4
    .param p1, "overlayData"    # Ljava/lang/String;

    .prologue
    .line 95
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 97
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->context:Landroid/content/Context;

    const-class v3, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 103
    const/high16 v1, 0x14010000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 106
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 107
    const-string v1, "OVERLAY_DATA_BUNDLE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 108
    const-string v1, "OVERLAY_SESSION_CLIENT_VERSION"

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->getClientVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 109
    const-string v1, "OVERLAY_SESSION_CONTENT_VERSION"

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->getContentVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 110
    const-string v1, "OVERLAY_SESSION_APPLICATION_NAME"

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->getApplicationName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 111
    const-string v1, "OVERLAY_SESSION_LANGUAGE_CODE"

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->getLocalizationUtil()Lcom/amazon/ags/html5/util/LocalizationUtil;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/LocalizationUtil;->getLanguageCode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 112
    const-string v1, "OVERLAY_SESSION_COUNTRY_CODE"

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->getLocalizationUtil()Lcom/amazon/ags/html5/util/LocalizationUtil;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/LocalizationUtil;->getCountryCode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 113
    const-string v1, "OVERLAY_SESSION_DEVICE_IDENTIFIER"

    invoke-static {}, Lcom/amazon/ags/html5/util/DeviceInfo;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 114
    const-string v1, "OVERLAY_SESSION_DEVICE_MANUFACTURER"

    invoke-static {}, Lcom/amazon/ags/html5/util/DeviceInfo;->getManufacturer()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 115
    const-string v1, "OVERLAY_SESSION_DEVICE_MODEL"

    invoke-static {}, Lcom/amazon/ags/html5/util/DeviceInfo;->getModel()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 116
    const-string v1, "OVERLAY_SESSION_DEVICE_TYPE"

    iget-object v2, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->overlaySessionInformation:Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;

    invoke-virtual {v2}, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->getDeviceInfo()Lcom/amazon/ags/html5/util/DeviceInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazon/ags/html5/util/DeviceInfo;->getDeviceType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 117
    const-string v1, "OVERLAY_SESSION_VARIATION_CACHE"

    invoke-direct {p0}, Lcom/amazon/ags/html5/overlay/OverlayManager;->getVariationCacheJson()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 119
    iget-object v1, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 120
    return-void
.end method


# virtual methods
.method public notifyCurrentActivityChanged(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 288
    invoke-direct {p0}, Lcom/amazon/ags/html5/overlay/OverlayManager;->refreshActivity()V

    .line 289
    return-void
.end method

.method public notifyToastDestroyed()V
    .locals 0

    .prologue
    .line 276
    invoke-direct {p0}, Lcom/amazon/ags/html5/overlay/OverlayManager;->processNextToast()V

    .line 277
    return-void
.end method

.method public showAlert(Ljava/lang/String;)V
    .locals 0
    .param p1, "overlayData"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-direct {p0, p1}, Lcom/amazon/ags/html5/overlay/OverlayManager;->showHtmlAlert(Ljava/lang/String;)V

    .line 92
    return-void
.end method

.method public showOverlay(Ljava/lang/String;)V
    .locals 1
    .param p1, "overlayData"    # Ljava/lang/String;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    invoke-interface {v0}, Lcom/amazon/ags/client/KindleFireProxy;->isOverlaysSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->kindleFireProxy:Lcom/amazon/ags/client/KindleFireProxy;

    invoke-interface {v0, p1}, Lcom/amazon/ags/client/KindleFireProxy;->showOverlay(Ljava/lang/String;)V

    .line 88
    :goto_0
    return-void

    .line 86
    :cond_0
    invoke-direct {p0, p1}, Lcom/amazon/ags/html5/overlay/OverlayManager;->showHtmlOverlay(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public declared-synchronized showToast(Ljava/lang/String;)V
    .locals 1
    .param p1, "toastData"    # Ljava/lang/String;

    .prologue
    .line 232
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlayManager;->pendingToasts:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 233
    invoke-direct {p0}, Lcom/amazon/ags/html5/overlay/OverlayManager;->processNextToast()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 234
    monitor-exit p0

    return-void

    .line 232
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
