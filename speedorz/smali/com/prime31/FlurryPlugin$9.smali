.class Lcom/prime31/FlurryPlugin$9;
.super Ljava/lang/Object;
.source "FlurryPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/FlurryPlugin;->displayAd(Ljava/lang/String;IJ)V
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
    iput-object p1, p0, Lcom/prime31/FlurryPlugin$9;->this$0:Lcom/prime31/FlurryPlugin;

    iput p2, p0, Lcom/prime31/FlurryPlugin$9;->val$adSize:I

    iput-object p3, p0, Lcom/prime31/FlurryPlugin$9;->val$adSpace:Ljava/lang/String;

    iput-wide p4, p0, Lcom/prime31/FlurryPlugin$9;->val$timeout:J

    .line 202
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 206
    sget-object v3, Lcom/flurry/android/FlurryAdSize;->BANNER_BOTTOM:Lcom/flurry/android/FlurryAdSize;

    .line 207
    .local v3, "adSizeEnum":Lcom/flurry/android/FlurryAdSize;
    iget v0, p0, Lcom/prime31/FlurryPlugin$9;->val$adSize:I

    packed-switch v0, :pswitch_data_0

    .line 221
    :goto_0
    sget-object v0, Lcom/flurry/android/FlurryAdSize;->FULLSCREEN:Lcom/flurry/android/FlurryAdSize;

    if-ne v3, v0, :cond_1

    .line 223
    iget-object v0, p0, Lcom/prime31/FlurryPlugin$9;->this$0:Lcom/prime31/FlurryPlugin;

    iget-object v0, v0, Lcom/prime31/FlurryPlugin;->_layout:Landroid/widget/RelativeLayout;

    if-nez v0, :cond_0

    .line 224
    iget-object v0, p0, Lcom/prime31/FlurryPlugin$9;->this$0:Lcom/prime31/FlurryPlugin;

    iget v1, p0, Lcom/prime31/FlurryPlugin$9;->val$adSize:I

    invoke-virtual {v0, v1}, Lcom/prime31/FlurryPlugin;->prepLayout(I)V

    .line 233
    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/prime31/FlurryPlugin$9;->this$0:Lcom/prime31/FlurryPlugin;

    invoke-virtual {v0}, Lcom/prime31/FlurryPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/prime31/FlurryPlugin$9;->val$adSpace:Ljava/lang/String;

    iget-object v2, p0, Lcom/prime31/FlurryPlugin$9;->this$0:Lcom/prime31/FlurryPlugin;

    iget-object v2, v2, Lcom/prime31/FlurryPlugin;->_layout:Landroid/widget/RelativeLayout;

    iget-wide v4, p0, Lcom/prime31/FlurryPlugin$9;->val$timeout:J

    invoke-static/range {v0 .. v5}, Lcom/flurry/android/FlurryAds;->getAd(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;J)Z

    move-result v6

    .line 234
    .local v6, "didGetAd":Z
    const-string v0, "Prime31"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "didGetAd: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    return-void

    .line 210
    .end local v6    # "didGetAd":Z
    :pswitch_0
    sget-object v3, Lcom/flurry/android/FlurryAdSize;->BANNER_BOTTOM:Lcom/flurry/android/FlurryAdSize;

    .line 211
    goto :goto_0

    .line 213
    :pswitch_1
    sget-object v3, Lcom/flurry/android/FlurryAdSize;->BANNER_TOP:Lcom/flurry/android/FlurryAdSize;

    .line 214
    goto :goto_0

    .line 216
    :pswitch_2
    sget-object v3, Lcom/flurry/android/FlurryAdSize;->FULLSCREEN:Lcom/flurry/android/FlurryAdSize;

    goto :goto_0

    .line 228
    :cond_1
    iget-object v0, p0, Lcom/prime31/FlurryPlugin$9;->this$0:Lcom/prime31/FlurryPlugin;

    iget v1, p0, Lcom/prime31/FlurryPlugin$9;->val$adSize:I

    invoke-virtual {v0, v1}, Lcom/prime31/FlurryPlugin;->prepLayout(I)V

    goto :goto_1

    .line 207
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
