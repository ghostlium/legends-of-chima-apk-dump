.class Lcom/prime31/FlurryPlugin$11;
.super Ljava/lang/Object;
.source "FlurryPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/FlurryPlugin;->isAdAvailable(Ljava/lang/String;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/FlurryPlugin;

.field private final synthetic val$adSize:I

.field private final synthetic val$adSpace:Ljava/lang/String;

.field private final synthetic val$timeout:J


# direct methods
.method constructor <init>(Lcom/prime31/FlurryPlugin;ILjava/lang/String;J)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/FlurryPlugin$11;->this$0:Lcom/prime31/FlurryPlugin;

    iput p2, p0, Lcom/prime31/FlurryPlugin$11;->val$adSize:I

    iput-object p3, p0, Lcom/prime31/FlurryPlugin$11;->val$adSpace:Ljava/lang/String;

    iput-wide p4, p0, Lcom/prime31/FlurryPlugin$11;->val$timeout:J

    .line 254
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 258
    sget-object v0, Lcom/flurry/android/FlurryAdSize;->BANNER_BOTTOM:Lcom/flurry/android/FlurryAdSize;

    .line 259
    .local v0, "adSizeEnum":Lcom/flurry/android/FlurryAdSize;
    iget v2, p0, Lcom/prime31/FlurryPlugin$11;->val$adSize:I

    packed-switch v2, :pswitch_data_0

    .line 272
    :goto_0
    iget-object v2, p0, Lcom/prime31/FlurryPlugin$11;->this$0:Lcom/prime31/FlurryPlugin;

    invoke-virtual {v2}, Lcom/prime31/FlurryPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/prime31/FlurryPlugin$11;->val$adSpace:Ljava/lang/String;

    iget-wide v4, p0, Lcom/prime31/FlurryPlugin$11;->val$timeout:J

    invoke-static {v2, v3, v0, v4, v5}, Lcom/flurry/android/FlurryAds;->isAdAvailable(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;J)Z

    move-result v1

    .line 274
    .local v1, "isAdAvailable":Z
    if-eqz v1, :cond_0

    .line 275
    iget-object v2, p0, Lcom/prime31/FlurryPlugin$11;->this$0:Lcom/prime31/FlurryPlugin;

    const-string v3, "adAvailableForSpace"

    iget-object v4, p0, Lcom/prime31/FlurryPlugin$11;->val$adSpace:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/prime31/FlurryPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    :goto_1
    return-void

    .line 262
    .end local v1    # "isAdAvailable":Z
    :pswitch_0
    sget-object v0, Lcom/flurry/android/FlurryAdSize;->BANNER_BOTTOM:Lcom/flurry/android/FlurryAdSize;

    .line 263
    goto :goto_0

    .line 265
    :pswitch_1
    sget-object v0, Lcom/flurry/android/FlurryAdSize;->BANNER_TOP:Lcom/flurry/android/FlurryAdSize;

    .line 266
    goto :goto_0

    .line 268
    :pswitch_2
    sget-object v0, Lcom/flurry/android/FlurryAdSize;->FULLSCREEN:Lcom/flurry/android/FlurryAdSize;

    goto :goto_0

    .line 277
    .restart local v1    # "isAdAvailable":Z
    :cond_0
    iget-object v2, p0, Lcom/prime31/FlurryPlugin$11;->this$0:Lcom/prime31/FlurryPlugin;

    const-string v3, "adNotAvailableForSpace"

    iget-object v4, p0, Lcom/prime31/FlurryPlugin$11;->val$adSpace:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/prime31/FlurryPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 259
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
