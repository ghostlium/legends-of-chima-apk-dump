.class public Lcom/playhaven/android/view/HTMLView;
.super Landroid/webkit/WebView;
.source "HTMLView.java"

# interfaces
.implements Lcom/playhaven/android/view/ChildView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/playhaven/android/view/HTMLView$Dispatches;,
        Lcom/playhaven/android/view/HTMLView$SubcontentRequest;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/webkit/WebView;",
        "Lcom/playhaven/android/view/ChildView",
        "<",
        "Lcom/playhaven/android/view/HTMLView;",
        ">;"
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$playhaven$android$view$HTMLView$Dispatches:[I


# instance fields
.field private final CALLBACK_TEMPLATE:Ljava/lang/String;

.field private final COLLECT_FORM_DATA:Ljava/lang/String;

.field private final DISPATCH_PREFIX:Ljava/lang/String;

.field private final DISPATCH_PROTOCOL_TEMPLATE:Ljava/lang/String;

.field private mDataFields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/playhaven/android/data/DataCollectionField;",
            ">;"
        }
    .end annotation
.end field

.field private mImages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mPlacement:Lcom/playhaven/android/Placement;

.field private mPurchases:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/playhaven/android/data/Purchase;",
            ">;"
        }
    .end annotation
.end field

.field private mRewards:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/playhaven/android/data/Reward;",
            ">;"
        }
    .end annotation
.end field

.field private webChromeClient:Landroid/webkit/WebChromeClient;

.field private webViewClient:Landroid/webkit/WebViewClient;


# direct methods
.method static synthetic $SWITCH_TABLE$com$playhaven$android$view$HTMLView$Dispatches()[I
    .locals 3

    .prologue
    .line 50
    sget-object v0, Lcom/playhaven/android/view/HTMLView;->$SWITCH_TABLE$com$playhaven$android$view$HTMLView$Dispatches:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/playhaven/android/view/HTMLView$Dispatches;->values()[Lcom/playhaven/android/view/HTMLView$Dispatches;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/playhaven/android/view/HTMLView$Dispatches;->closeButton:Lcom/playhaven/android/view/HTMLView$Dispatches;

    invoke-virtual {v1}, Lcom/playhaven/android/view/HTMLView$Dispatches;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_8

    :goto_1
    :try_start_1
    sget-object v1, Lcom/playhaven/android/view/HTMLView$Dispatches;->dcData:Lcom/playhaven/android/view/HTMLView$Dispatches;

    invoke-virtual {v1}, Lcom/playhaven/android/view/HTMLView$Dispatches;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_7

    :goto_2
    :try_start_2
    sget-object v1, Lcom/playhaven/android/view/HTMLView$Dispatches;->dismiss:Lcom/playhaven/android/view/HTMLView$Dispatches;

    invoke-virtual {v1}, Lcom/playhaven/android/view/HTMLView$Dispatches;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_6

    :goto_3
    :try_start_3
    sget-object v1, Lcom/playhaven/android/view/HTMLView$Dispatches;->launch:Lcom/playhaven/android/view/HTMLView$Dispatches;

    invoke-virtual {v1}, Lcom/playhaven/android/view/HTMLView$Dispatches;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_5

    :goto_4
    :try_start_4
    sget-object v1, Lcom/playhaven/android/view/HTMLView$Dispatches;->loadContext:Lcom/playhaven/android/view/HTMLView$Dispatches;

    invoke-virtual {v1}, Lcom/playhaven/android/view/HTMLView$Dispatches;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :goto_5
    :try_start_5
    sget-object v1, Lcom/playhaven/android/view/HTMLView$Dispatches;->purchase:Lcom/playhaven/android/view/HTMLView$Dispatches;

    invoke-virtual {v1}, Lcom/playhaven/android/view/HTMLView$Dispatches;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_3

    :goto_6
    :try_start_6
    sget-object v1, Lcom/playhaven/android/view/HTMLView$Dispatches;->reward:Lcom/playhaven/android/view/HTMLView$Dispatches;

    invoke-virtual {v1}, Lcom/playhaven/android/view/HTMLView$Dispatches;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_2

    :goto_7
    :try_start_7
    sget-object v1, Lcom/playhaven/android/view/HTMLView$Dispatches;->subcontent:Lcom/playhaven/android/view/HTMLView$Dispatches;

    invoke-virtual {v1}, Lcom/playhaven/android/view/HTMLView$Dispatches;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_1

    :goto_8
    :try_start_8
    sget-object v1, Lcom/playhaven/android/view/HTMLView$Dispatches;->track:Lcom/playhaven/android/view/HTMLView$Dispatches;

    invoke-virtual {v1}, Lcom/playhaven/android/view/HTMLView$Dispatches;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_0

    :goto_9
    sput-object v0, Lcom/playhaven/android/view/HTMLView;->$SWITCH_TABLE$com$playhaven$android$view$HTMLView$Dispatches:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_9

    :catch_1
    move-exception v1

    goto :goto_8

    :catch_2
    move-exception v1

    goto :goto_7

    :catch_3
    move-exception v1

    goto :goto_6

    :catch_4
    move-exception v1

    goto :goto_5

    :catch_5
    move-exception v1

    goto :goto_4

    :catch_6
    move-exception v1

    goto :goto_3

    :catch_7
    move-exception v1

    goto :goto_2

    :catch_8
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 190
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 51
    const-string v0, "ph://"

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->DISPATCH_PREFIX:Ljava/lang/String;

    .line 60
    const-string v0, "javascript:PlayHaven.nativeAPI.callback(\"%s\", %s, %s)"

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->CALLBACK_TEMPLATE:Ljava/lang/String;

    .line 61
    const-string v0, "javascript:window.PlayHavenDispatchProtocolVersion=4"

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->DISPATCH_PROTOCOL_TEMPLATE:Ljava/lang/String;

    .line 62
    const-string v0, "javascript:$.ajax({dataType: \'jsonp\', jsonp: \'dcDataCallback\', data: $(\'form\').serialize(), url: \'ph://dcData\'});"

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->COLLECT_FORM_DATA:Ljava/lang/String;

    .line 132
    new-instance v0, Lcom/playhaven/android/view/HTMLView$1;

    invoke-direct {v0, p0}, Lcom/playhaven/android/view/HTMLView$1;-><init>(Lcom/playhaven/android/view/HTMLView;)V

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->webChromeClient:Landroid/webkit/WebChromeClient;

    .line 140
    new-instance v0, Lcom/playhaven/android/view/HTMLView$2;

    invoke-direct {v0, p0}, Lcom/playhaven/android/view/HTMLView$2;-><init>(Lcom/playhaven/android/view/HTMLView;)V

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->webViewClient:Landroid/webkit/WebViewClient;

    .line 191
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 194
    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    const-string v0, "ph://"

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->DISPATCH_PREFIX:Ljava/lang/String;

    .line 60
    const-string v0, "javascript:PlayHaven.nativeAPI.callback(\"%s\", %s, %s)"

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->CALLBACK_TEMPLATE:Ljava/lang/String;

    .line 61
    const-string v0, "javascript:window.PlayHavenDispatchProtocolVersion=4"

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->DISPATCH_PROTOCOL_TEMPLATE:Ljava/lang/String;

    .line 62
    const-string v0, "javascript:$.ajax({dataType: \'jsonp\', jsonp: \'dcDataCallback\', data: $(\'form\').serialize(), url: \'ph://dcData\'});"

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->COLLECT_FORM_DATA:Ljava/lang/String;

    .line 132
    new-instance v0, Lcom/playhaven/android/view/HTMLView$1;

    invoke-direct {v0, p0}, Lcom/playhaven/android/view/HTMLView$1;-><init>(Lcom/playhaven/android/view/HTMLView;)V

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->webChromeClient:Landroid/webkit/WebChromeClient;

    .line 140
    new-instance v0, Lcom/playhaven/android/view/HTMLView$2;

    invoke-direct {v0, p0}, Lcom/playhaven/android/view/HTMLView$2;-><init>(Lcom/playhaven/android/view/HTMLView;)V

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->webViewClient:Landroid/webkit/WebViewClient;

    .line 195
    return-void
.end method

.method static synthetic access$0(Lcom/playhaven/android/view/HTMLView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 205
    invoke-direct {p0, p1}, Lcom/playhaven/android/view/HTMLView;->handleDispatch(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1(Lcom/playhaven/android/view/HTMLView;)Ljava/util/List;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/playhaven/android/view/HTMLView;->mImages:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$2(Lcom/playhaven/android/view/HTMLView;)Lcom/playhaven/android/Placement;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/playhaven/android/view/HTMLView;->mPlacement:Lcom/playhaven/android/Placement;

    return-object v0
.end method

.method private handleDispatch(Ljava/lang/String;)V
    .locals 24
    .param p1, "dispatchUrl"    # Ljava/lang/String;

    .prologue
    .line 206
    invoke-static/range {p1 .. p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 207
    .local v5, "callbackUri":Landroid/net/Uri;
    const-string v19, "callback"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 208
    .local v3, "callbackId":Ljava/lang/String;
    invoke-virtual {v5}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v4

    .line 209
    .local v4, "callbackString":Ljava/lang/String;
    const-string v19, "context"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 210
    .local v8, "dispatchContext":Ljava/lang/String;
    const-string v19, "Handling dispatch: %s of type %s"

    const/16 v20, 0x2

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object p1, v20, v21

    const/16 v21, 0x1

    aput-object v4, v20, v21

    invoke-static/range {v19 .. v20}, Lcom/playhaven/android/PlayHaven;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 212
    invoke-static {}, Lcom/playhaven/android/view/HTMLView;->$SWITCH_TABLE$com$playhaven$android$view$HTMLView$Dispatches()[I

    move-result-object v19

    invoke-static {v4}, Lcom/playhaven/android/view/HTMLView$Dispatches;->valueOf(Ljava/lang/String;)Lcom/playhaven/android/view/HTMLView$Dispatches;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/playhaven/android/view/HTMLView$Dispatches;->ordinal()I

    move-result v20

    aget v19, v19, v20

    packed-switch v19, :pswitch_data_0

    .line 360
    :goto_0
    return-void

    .line 218
    :pswitch_0
    const-string v10, "true"

    .line 220
    .local v10, "hidden":Ljava/lang/String;
    :try_start_0
    new-instance v19, Lorg/json/JSONObject;

    move-object/from16 v0, v19

    invoke-direct {v0, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v20, "hidden"

    invoke-virtual/range {v19 .. v20}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .line 226
    :goto_1
    const-string v19, "true"

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 227
    invoke-virtual/range {p0 .. p0}, Lcom/playhaven/android/view/HTMLView;->getParent()Landroid/view/ViewParent;

    move-result-object v19

    check-cast v19, Lcom/playhaven/android/view/PlayHavenView;

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Lcom/playhaven/android/view/PlayHavenView;->setExitVisible(Z)V

    .line 231
    :cond_0
    const-string v19, "javascript:PlayHaven.nativeAPI.callback(\"%s\", %s, %s)"

    const/16 v20, 0x3

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object v3, v20, v21

    const/16 v21, 0x1

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "{\'hidden\':\'"

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v22

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "\'}"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    aput-object v22, v20, v21

    const/16 v21, 0x2

    const/16 v22, 0x0

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/playhaven/android/view/HTMLView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 221
    :catch_0
    move-exception v12

    .line 223
    .local v12, "jse":Lorg/json/JSONException;
    const-string v10, "false"

    goto :goto_1

    .line 237
    .end local v10    # "hidden":Ljava/lang/String;
    .end local v12    # "jse":Lorg/json/JSONException;
    :pswitch_1
    sget-object v7, Lcom/playhaven/android/view/PlayHavenView$DismissType;->NoThanks:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    .line 238
    .local v7, "dismiss":Lcom/playhaven/android/view/PlayHavenView$DismissType;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/playhaven/android/view/HTMLView;->mRewards:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 239
    sget-object v7, Lcom/playhaven/android/view/PlayHavenView$DismissType;->Reward:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    .line 241
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/playhaven/android/view/HTMLView;->mDataFields:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    if-eqz v19, :cond_2

    .line 242
    sget-object v7, Lcom/playhaven/android/view/PlayHavenView$DismissType;->OptIn:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    .line 244
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/playhaven/android/view/HTMLView;->mPurchases:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    if-eqz v19, :cond_3

    .line 245
    sget-object v7, Lcom/playhaven/android/view/PlayHavenView$DismissType;->Purchase:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    .line 247
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/playhaven/android/view/HTMLView;->mPlacement:Lcom/playhaven/android/Placement;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/playhaven/android/Placement;->getListener()Lcom/playhaven/android/PlacementListener;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/playhaven/android/view/HTMLView;->mPlacement:Lcom/playhaven/android/Placement;

    move-object/from16 v20, v0

    invoke-virtual/range {p0 .. p0}, Lcom/playhaven/android/view/HTMLView;->generateResponseBundle()Landroid/os/Bundle;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v7, v2}, Lcom/playhaven/android/PlacementListener;->contentDismissed(Lcom/playhaven/android/Placement;Lcom/playhaven/android/view/PlayHavenView$DismissType;Landroid/os/Bundle;)V

    .line 250
    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/playhaven/android/view/HTMLView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    goto/16 :goto_0

    .line 258
    .end local v7    # "dismiss":Lcom/playhaven/android/view/PlayHavenView$DismissType;
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/playhaven/android/view/HTMLView;->mPlacement:Lcom/playhaven/android/Placement;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/playhaven/android/Placement;->getListener()Lcom/playhaven/android/PlacementListener;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/playhaven/android/view/HTMLView;->mPlacement:Lcom/playhaven/android/Placement;

    move-object/from16 v20, v0

    sget-object v21, Lcom/playhaven/android/view/PlayHavenView$DismissType;->Launch:Lcom/playhaven/android/view/PlayHavenView$DismissType;

    const/16 v22, 0x0

    invoke-interface/range {v19 .. v22}, Lcom/playhaven/android/PlacementListener;->contentDismissed(Lcom/playhaven/android/Placement;Lcom/playhaven/android/view/PlayHavenView$DismissType;Landroid/os/Bundle;)V

    .line 266
    :try_start_1
    new-instance v19, Lorg/json/JSONObject;

    move-object/from16 v0, v19

    invoke-direct {v0, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v20, "url"

    invoke-virtual/range {v19 .. v20}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v17

    .line 272
    .local v17, "url":Ljava/lang/String;
    new-instance v18, Lcom/playhaven/android/req/UrlRequest;

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/playhaven/android/req/UrlRequest;-><init>(Ljava/lang/String;)V

    .line 273
    .local v18, "urlRequest":Lcom/playhaven/android/req/UrlRequest;
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v13

    .line 274
    .local v13, "pool":Ljava/util/concurrent/ExecutorService;
    move-object/from16 v0, v18

    invoke-interface {v13, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v16

    .line 275
    .local v16, "uriFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/String;>;"
    move-object/from16 v11, v17

    .line 277
    .local v11, "initialUrl":Ljava/lang/String;
    new-instance v19, Ljava/lang/Thread;

    new-instance v20, Lcom/playhaven/android/view/HTMLView$3;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2, v11}, Lcom/playhaven/android/view/HTMLView$3;-><init>(Lcom/playhaven/android/view/HTMLView;Ljava/util/concurrent/Future;Ljava/lang/String;)V

    invoke-direct/range {v19 .. v20}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 301
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 267
    .end local v11    # "initialUrl":Ljava/lang/String;
    .end local v13    # "pool":Ljava/util/concurrent/ExecutorService;
    .end local v16    # "uriFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/String;>;"
    .end local v17    # "url":Ljava/lang/String;
    .end local v18    # "urlRequest":Lcom/playhaven/android/req/UrlRequest;
    :catch_1
    move-exception v12

    .line 268
    .restart local v12    # "jse":Lorg/json/JSONException;
    const-string v19, "Could not parse launch URL."

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    invoke-static/range {v19 .. v20}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 308
    .end local v12    # "jse":Lorg/json/JSONException;
    :pswitch_3
    const-string v19, "javascript:window.PlayHavenDispatchProtocolVersion=4"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/playhaven/android/view/HTMLView;->loadUrl(Ljava/lang/String;)V

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/playhaven/android/view/HTMLView;->mPlacement:Lcom/playhaven/android/Placement;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/playhaven/android/Placement;->getModel()Ljava/lang/String;

    move-result-object v19

    const-string v20, "$.response.context"

    invoke-static/range {v19 .. v20}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnet/minidev/json/JSONObject;

    .line 310
    .local v6, "context":Lnet/minidev/json/JSONObject;
    const-string v19, "javascript:PlayHaven.nativeAPI.callback(\"%s\", %s, %s)"

    const/16 v20, 0x3

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object v3, v20, v21

    const/16 v21, 0x1

    aput-object v6, v20, v21

    const/16 v21, 0x2

    const/16 v22, 0x0

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/playhaven/android/view/HTMLView;->loadUrl(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 317
    .end local v6    # "context":Lnet/minidev/json/JSONObject;
    :pswitch_4
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/playhaven/android/view/HTMLView;->collectAttachments(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 324
    :pswitch_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/playhaven/android/view/HTMLView;->mPlacement:Lcom/playhaven/android/Placement;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/playhaven/android/Placement;->getModel()Ljava/lang/String;

    move-result-object v19

    const-string v20, "$.response.context.content.open_dispatch.parameters"

    invoke-static/range {v19 .. v20}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lnet/minidev/json/JSONObject;

    .line 325
    .local v14, "rewardParam":Lnet/minidev/json/JSONObject;
    if-eqz v14, :cond_4

    invoke-virtual {v14}, Lnet/minidev/json/JSONObject;->size()I

    move-result v19

    if-nez v19, :cond_5

    .line 328
    :cond_4
    const-string v19, "javascript:$.ajax({dataType: \'jsonp\', jsonp: \'dcDataCallback\', data: $(\'form\').serialize(), url: \'ph://dcData\'});"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/playhaven/android/view/HTMLView;->loadUrl(Ljava/lang/String;)V

    .line 331
    :cond_5
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/playhaven/android/view/HTMLView;->collectAttachments(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 339
    .end local v14    # "rewardParam":Lnet/minidev/json/JSONObject;
    :pswitch_6
    new-instance v15, Lcom/playhaven/android/view/HTMLView$SubcontentRequest;

    move-object/from16 v0, p0

    invoke-direct {v15, v0, v8}, Lcom/playhaven/android/view/HTMLView$SubcontentRequest;-><init>(Lcom/playhaven/android/view/HTMLView;Ljava/lang/String;)V

    .line 340
    .local v15, "subcontentRequest":Lcom/playhaven/android/view/HTMLView$SubcontentRequest;
    invoke-virtual/range {p0 .. p0}, Lcom/playhaven/android/view/HTMLView;->getContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Lcom/playhaven/android/view/HTMLView$SubcontentRequest;->send(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 344
    .end local v15    # "subcontentRequest":Lcom/playhaven/android/view/HTMLView$SubcontentRequest;
    :pswitch_7
    const-string v19, "track callback not implemented."

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    invoke-static/range {v19 .. v20}, Lcom/playhaven/android/PlayHaven;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 352
    :pswitch_8
    :try_start_2
    invoke-static {v5}, Lcom/playhaven/android/data/DataCollectionField;->fromUrl(Landroid/net/Uri;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/playhaven/android/view/HTMLView;->mDataFields:Ljava/util/ArrayList;
    :try_end_2
    .catch Lcom/playhaven/android/PlayHavenException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    .line 353
    :catch_2
    move-exception v9

    .line 354
    .local v9, "e":Lcom/playhaven/android/PlayHavenException;
    invoke-virtual {v9}, Lcom/playhaven/android/PlayHavenException;->printStackTrace()V

    goto/16 :goto_0

    .line 212
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method


# virtual methods
.method public collectAttachments(Ljava/lang/String;)V
    .locals 1
    .param p1, "dispatchContext"    # Ljava/lang/String;

    .prologue
    .line 367
    const-string v0, "$.purchases"

    invoke-static {p1, v0}, Lcom/playhaven/android/util/JsonUtil;->hasPath(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 368
    invoke-static {p1}, Lcom/playhaven/android/data/Purchase;->fromJson(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->mPurchases:Ljava/util/ArrayList;

    .line 370
    :cond_0
    const-string v0, "$.rewards"

    invoke-static {p1, v0}, Lcom/playhaven/android/util/JsonUtil;->hasPath(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 371
    invoke-static {p1}, Lcom/playhaven/android/data/Reward;->fromJson(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->mRewards:Ljava/util/ArrayList;

    .line 372
    :cond_1
    return-void
.end method

.method public generateResponseBundle()Landroid/os/Bundle;
    .locals 3

    .prologue
    .line 442
    const/4 v0, 0x0

    .line 444
    .local v0, "data":Landroid/os/Bundle;
    iget-object v1, p0, Lcom/playhaven/android/view/HTMLView;->mRewards:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    .line 445
    new-instance v0, Landroid/os/Bundle;

    .end local v0    # "data":Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 446
    .restart local v0    # "data":Landroid/os/Bundle;
    const-string v1, "data.reward"

    iget-object v2, p0, Lcom/playhaven/android/view/HTMLView;->mRewards:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 449
    :cond_0
    iget-object v1, p0, Lcom/playhaven/android/view/HTMLView;->mDataFields:Ljava/util/ArrayList;

    if-eqz v1, :cond_2

    .line 450
    if-nez v0, :cond_1

    new-instance v0, Landroid/os/Bundle;

    .end local v0    # "data":Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 451
    .restart local v0    # "data":Landroid/os/Bundle;
    :cond_1
    const-string v1, "data.optin"

    iget-object v2, p0, Lcom/playhaven/android/view/HTMLView;->mDataFields:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 454
    :cond_2
    iget-object v1, p0, Lcom/playhaven/android/view/HTMLView;->mPurchases:Ljava/util/ArrayList;

    if-eqz v1, :cond_4

    .line 455
    if-nez v0, :cond_3

    new-instance v0, Landroid/os/Bundle;

    .end local v0    # "data":Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 456
    .restart local v0    # "data":Landroid/os/Bundle;
    :cond_3
    const-string v1, "data.purchase"

    iget-object v2, p0, Lcom/playhaven/android/view/HTMLView;->mPurchases:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 459
    :cond_4
    return-object v0
.end method

.method public load(Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 380
    new-instance v0, Lcom/playhaven/android/view/HTMLView$4;

    invoke-direct {v0, p0, p1}, Lcom/playhaven/android/view/HTMLView$4;-><init>(Lcom/playhaven/android/view/HTMLView;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/HTMLView;->post(Ljava/lang/Runnable;)Z

    .line 411
    return-void
.end method

.method public setPlacement(Lcom/playhaven/android/Placement;)V
    .locals 2
    .param p1, "placement"    # Lcom/playhaven/android/Placement;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .prologue
    .line 416
    iput-object p1, p0, Lcom/playhaven/android/view/HTMLView;->mPlacement:Lcom/playhaven/android/Placement;

    .line 417
    invoke-virtual {p0}, Lcom/playhaven/android/view/HTMLView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 418
    iget-object v0, p0, Lcom/playhaven/android/view/HTMLView;->webViewClient:Landroid/webkit/WebViewClient;

    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/HTMLView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 419
    iget-object v0, p0, Lcom/playhaven/android/view/HTMLView;->webChromeClient:Landroid/webkit/WebChromeClient;

    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/HTMLView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 423
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->mImages:Ljava/util/List;

    .line 425
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 426
    iget-object v0, p0, Lcom/playhaven/android/view/HTMLView;->mPlacement:Lcom/playhaven/android/Placement;

    invoke-virtual {v0}, Lcom/playhaven/android/Placement;->getModel()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/playhaven/android/data/JsonUrlExtractor;->getImages(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->mImages:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 429
    :cond_0
    iget-object v0, p0, Lcom/playhaven/android/view/HTMLView;->mImages:Ljava/util/List;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/playhaven/android/view/HTMLView;->mImages:Ljava/util/List;

    .line 432
    :cond_1
    iget-object v0, p0, Lcom/playhaven/android/view/HTMLView;->mPlacement:Lcom/playhaven/android/Placement;

    invoke-virtual {v0}, Lcom/playhaven/android/Placement;->getModel()Ljava/lang/String;

    move-result-object v0

    const-string v1, "$.response.url"

    invoke-static {v0, v1}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/playhaven/android/view/HTMLView;->load(Ljava/lang/String;)V

    .line 433
    return-void

    .line 428
    :catchall_0
    move-exception v0

    .line 429
    iget-object v1, p0, Lcom/playhaven/android/view/HTMLView;->mImages:Ljava/util/List;

    if-nez v1, :cond_2

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/playhaven/android/view/HTMLView;->mImages:Ljava/util/List;

    .line 430
    :cond_2
    throw v0
.end method
