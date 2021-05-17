.class public Lcom/cobra/zufflin/PlayHaven/ZufflinPlayHaven;
.super Ljava/lang/Object;
.source "ZufflinPlayHaven.java"

# interfaces
.implements Lcom/cobra/zufflin/ZufflinActivityListener;
.implements Lcom/playhaven/android/PlacementListener;


# static fields
.field public static singleton:Lcom/cobra/zufflin/PlayHaven/ZufflinPlayHaven;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/PlayHaven/ZufflinPlayHaven;->singleton:Lcom/cobra/zufflin/PlayHaven/ZufflinPlayHaven;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "secretKey"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    sput-object p0, Lcom/cobra/zufflin/PlayHaven/ZufflinPlayHaven;->singleton:Lcom/cobra/zufflin/PlayHaven/ZufflinPlayHaven;

    .line 24
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/cobra/zufflin/ZufflinActivity;->addActivityListener(Lcom/cobra/zufflin/ZufflinActivityListener;)V

    .line 28
    :try_start_0
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    invoke-static {v2, p1, p2}, Lcom/playhaven/android/PlayHaven;->configure(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    new-instance v1, Lcom/playhaven/android/req/OpenRequest;

    invoke-direct {v1}, Lcom/playhaven/android/req/OpenRequest;-><init>()V

    .line 30
    .local v1, "open":Lcom/playhaven/android/req/OpenRequest;
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/playhaven/android/req/OpenRequest;->send(Landroid/content/Context;)V
    :try_end_0
    .catch Lcom/playhaven/android/PlayHavenException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .end local v1    # "open":Lcom/playhaven/android/req/OpenRequest;
    :goto_0
    return-void

    .line 32
    :catch_0
    move-exception v0

    .line 34
    .local v0, "e":Lcom/playhaven/android/PlayHavenException;
    invoke-virtual {v0}, Lcom/playhaven/android/PlayHavenException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public contentDismissed(Lcom/playhaven/android/Placement;Lcom/playhaven/android/view/PlayHavenView$DismissType;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "placement"    # Lcom/playhaven/android/Placement;
    .param p2, "dismissType"    # Lcom/playhaven/android/view/PlayHavenView$DismissType;
    .param p3, "data"    # Landroid/os/Bundle;

    .prologue
    .line 104
    invoke-virtual {p0}, Lcom/cobra/zufflin/PlayHaven/ZufflinPlayHaven;->nativeDismissed()V

    .line 105
    return-void
.end method

.method public contentFailed(Lcom/playhaven/android/Placement;Lcom/playhaven/android/PlayHavenException;)V
    .locals 0
    .param p1, "placement"    # Lcom/playhaven/android/Placement;
    .param p2, "e"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/cobra/zufflin/PlayHaven/ZufflinPlayHaven;->nativeDismissed()V

    .line 99
    return-void
.end method

.method public contentLoaded(Lcom/playhaven/android/Placement;)V
    .locals 0
    .param p1, "placement"    # Lcom/playhaven/android/Placement;

    .prologue
    .line 93
    return-void
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 40
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/PlayHaven/ZufflinPlayHaven;->singleton:Lcom/cobra/zufflin/PlayHaven/ZufflinPlayHaven;

    .line 41
    return-void
.end method

.method public native nativeDismissed()V
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 58
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 83
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 63
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 68
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 88
    return-void
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 73
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 78
    return-void
.end method

.method public showContent(Ljava/lang/String;)V
    .locals 3
    .param p1, "placementToken"    # Ljava/lang/String;

    .prologue
    .line 47
    :try_start_0
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/playhaven/android/view/FullScreen;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/cobra/zufflin/ZufflinActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    :goto_0
    return-void

    .line 49
    :catch_0
    move-exception v0

    .line 51
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
