.class Lcom/prime31/FlurryPlugin$1;
.super Ljava/lang/Object;
.source "FlurryPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/FlurryPlugin;->onStartSession(Ljava/lang/String;ZZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/FlurryPlugin;

.field private final synthetic val$apiKey:Ljava/lang/String;

.field private final synthetic val$enableTestAds:Z

.field private final synthetic val$initializeAds:Z

.field private final synthetic val$initializeAppCloudModule:Z


# direct methods
.method constructor <init>(Lcom/prime31/FlurryPlugin;Ljava/lang/String;ZZZ)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/FlurryPlugin$1;->this$0:Lcom/prime31/FlurryPlugin;

    iput-object p2, p0, Lcom/prime31/FlurryPlugin$1;->val$apiKey:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/prime31/FlurryPlugin$1;->val$initializeAds:Z

    iput-boolean p4, p0, Lcom/prime31/FlurryPlugin$1;->val$enableTestAds:Z

    iput-boolean p5, p0, Lcom/prime31/FlurryPlugin$1;->val$initializeAppCloudModule:Z

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 58
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/flurry/android/FlurryAgent;->setCaptureUncaughtExceptions(Z)V

    .line 59
    iget-object v0, p0, Lcom/prime31/FlurryPlugin$1;->this$0:Lcom/prime31/FlurryPlugin;

    invoke-virtual {v0}, Lcom/prime31/FlurryPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/prime31/FlurryPlugin$1;->val$apiKey:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAgent;->onStartSession(Landroid/content/Context;Ljava/lang/String;)V

    .line 60
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/prime31/FlurryPlugin;->access$0(Z)V

    .line 62
    iget-boolean v0, p0, Lcom/prime31/FlurryPlugin$1;->val$initializeAds:Z

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/prime31/FlurryPlugin$1;->this$0:Lcom/prime31/FlurryPlugin;

    iget-boolean v1, p0, Lcom/prime31/FlurryPlugin$1;->val$enableTestAds:Z

    invoke-static {v0, v1}, Lcom/prime31/FlurryPlugin;->access$1(Lcom/prime31/FlurryPlugin;Z)V

    .line 65
    const-string v0, "Prime31"

    const-string v1, "enabling Flurry ads"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    :cond_0
    iget-boolean v0, p0, Lcom/prime31/FlurryPlugin$1;->val$initializeAppCloudModule:Z

    if-eqz v0, :cond_1

    .line 70
    iget-object v0, p0, Lcom/prime31/FlurryPlugin$1;->this$0:Lcom/prime31/FlurryPlugin;

    invoke-virtual {v0}, Lcom/prime31/FlurryPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/android/FlurryAppCloud;->initAppCloudModule(Landroid/content/Context;)V

    .line 71
    const-string v0, "Prime31"

    const-string v1, "enabling Flurry App Cloud Module"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    :cond_1
    return-void
.end method
