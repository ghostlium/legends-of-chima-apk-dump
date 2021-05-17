.class public Lcom/playhaven/android/view/DefaultPlayHavenListener;
.super Ljava/lang/Object;
.source "DefaultPlayHavenListener.java"

# interfaces
.implements Lcom/playhaven/android/view/PlayHavenListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public viewDismissed(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/view/PlayHavenView$DismissType;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Lcom/playhaven/android/view/PlayHavenView;
    .param p2, "dismissType"    # Lcom/playhaven/android/view/PlayHavenView$DismissType;
    .param p3, "data"    # Landroid/os/Bundle;

    .prologue
    .line 51
    return-void
.end method

.method public viewFailed(Lcom/playhaven/android/view/PlayHavenView;Lcom/playhaven/android/PlayHavenException;)V
    .locals 0
    .param p1, "view"    # Lcom/playhaven/android/view/PlayHavenView;
    .param p2, "exception"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 36
    return-void
.end method
