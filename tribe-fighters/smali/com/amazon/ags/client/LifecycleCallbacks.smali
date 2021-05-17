.class public Lcom/amazon/ags/client/LifecycleCallbacks;
.super Ljava/lang/Object;
.source "LifecycleCallbacks.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation


# instance fields
.field private initFeatures:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/amazon/ags/api/AmazonGamesFeature;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/EnumSet;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/amazon/ags/api/AmazonGamesFeature;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p1, "features":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/amazon/ags/api/AmazonGamesFeature;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/amazon/ags/client/LifecycleCallbacks;->initFeatures:Ljava/util/EnumSet;

    .line 26
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 30
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 34
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 38
    instance-of v0, p1, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    if-nez v0, :cond_0

    instance-of v0, p1, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;

    if-nez v0, :cond_0

    .line 40
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->release()V

    .line 42
    :cond_0
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 46
    instance-of v0, p1, Lcom/amazon/ags/html5/overlay/GameCircleUserInterface;

    if-nez v0, :cond_0

    instance-of v0, p1, Lcom/amazon/ags/html5/overlay/GameCircleAlertUserInterface;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/amazon/ags/client/LifecycleCallbacks$1;

    invoke-direct {v0, p0}, Lcom/amazon/ags/client/LifecycleCallbacks$1;-><init>(Lcom/amazon/ags/client/LifecycleCallbacks;)V

    iget-object v1, p0, Lcom/amazon/ags/client/LifecycleCallbacks;->initFeatures:Ljava/util/EnumSet;

    invoke-static {p1, v0, v1}, Lcom/amazon/ags/api/AmazonGamesClient;->initialize(Landroid/app/Activity;Lcom/amazon/ags/api/AmazonGamesCallback;Ljava/util/EnumSet;)V

    .line 56
    :cond_0
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 60
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 64
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 68
    return-void
.end method
