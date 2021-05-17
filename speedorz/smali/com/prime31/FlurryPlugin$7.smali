.class Lcom/prime31/FlurryPlugin$7;
.super Ljava/lang/Object;
.source "FlurryPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/FlurryPlugin;->initializeAds(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/FlurryPlugin;

.field private final synthetic val$enableTestAds:Z


# direct methods
.method constructor <init>(Lcom/prime31/FlurryPlugin;Z)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/FlurryPlugin$7;->this$0:Lcom/prime31/FlurryPlugin;

    iput-boolean p2, p0, Lcom/prime31/FlurryPlugin$7;->val$enableTestAds:Z

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 147
    const-string v0, "Prime31"

    const-string v1, "enabled Flurry ads"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    iget-object v0, p0, Lcom/prime31/FlurryPlugin$7;->this$0:Lcom/prime31/FlurryPlugin;

    invoke-virtual {v0}, Lcom/prime31/FlurryPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/android/FlurryAds;->initializeAds(Landroid/content/Context;)V

    .line 149
    iget-object v0, p0, Lcom/prime31/FlurryPlugin$7;->this$0:Lcom/prime31/FlurryPlugin;

    invoke-static {v0}, Lcom/flurry/android/FlurryAds;->setAdListener(Lcom/flurry/android/FlurryAdListener;)V

    .line 151
    iget-boolean v0, p0, Lcom/prime31/FlurryPlugin$7;->val$enableTestAds:Z

    if-eqz v0, :cond_0

    .line 153
    const-string v0, "Prime31"

    const-string v1, "test mode is on"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    invoke-static {v2}, Lcom/flurry/android/FlurryAds;->enableTestAds(Z)V

    .line 155
    invoke-static {v2}, Lcom/flurry/android/FlurryAgent;->setLogEnabled(Z)V

    .line 157
    :cond_0
    return-void
.end method
