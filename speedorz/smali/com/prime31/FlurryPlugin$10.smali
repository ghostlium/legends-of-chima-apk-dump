.class Lcom/prime31/FlurryPlugin$10;
.super Ljava/lang/Object;
.source "FlurryPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/FlurryPlugin;->removeAd(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/FlurryPlugin;

.field private final synthetic val$adSpace:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/prime31/FlurryPlugin;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/FlurryPlugin$10;->this$0:Lcom/prime31/FlurryPlugin;

    iput-object p2, p0, Lcom/prime31/FlurryPlugin$10;->val$adSpace:Ljava/lang/String;

    .line 242
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 246
    iget-object v0, p0, Lcom/prime31/FlurryPlugin$10;->this$0:Lcom/prime31/FlurryPlugin;

    invoke-virtual {v0}, Lcom/prime31/FlurryPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/prime31/FlurryPlugin$10;->val$adSpace:Ljava/lang/String;

    iget-object v2, p0, Lcom/prime31/FlurryPlugin$10;->this$0:Lcom/prime31/FlurryPlugin;

    iget-object v2, v2, Lcom/prime31/FlurryPlugin;->_layout:Landroid/widget/RelativeLayout;

    invoke-static {v0, v1, v2}, Lcom/flurry/android/FlurryAds;->removeAd(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)V

    .line 247
    return-void
.end method
