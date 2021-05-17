.class public Lcom/cobra/zufflin/flurry/ZufflinFlurry;
.super Ljava/lang/Object;
.source "ZufflinFlurry.java"


# static fields
.field public static singleton:Lcom/cobra/zufflin/flurry/ZufflinFlurry;


# instance fields
.field private apiKey:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/flurry/ZufflinFlurry;->singleton:Lcom/cobra/zufflin/flurry/ZufflinFlurry;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .param p1, "apiKey"    # Ljava/lang/String;
    .param p2, "bEnableCrashReporting"    # Z

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/cobra/zufflin/flurry/ZufflinFlurry;->apiKey:Ljava/lang/String;

    .line 17
    sput-object p0, Lcom/cobra/zufflin/flurry/ZufflinFlurry;->singleton:Lcom/cobra/zufflin/flurry/ZufflinFlurry;

    .line 19
    invoke-static {p2}, Lcom/flurry/android/FlurryAgent;->setCaptureUncaughtExceptions(Z)V

    .line 20
    invoke-virtual {p0}, Lcom/cobra/zufflin/flurry/ZufflinFlurry;->start()V

    .line 21
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/flurry/ZufflinFlurry;->singleton:Lcom/cobra/zufflin/flurry/ZufflinFlurry;

    .line 26
    return-void
.end method

.method public endTimedEvent(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p2, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 66
    :cond_0
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->endTimedEvent(Ljava/lang/String;)V

    .line 72
    :goto_0
    return-void

    .line 70
    :cond_1
    invoke-static {p1, p2}, Lcom/flurry/android/FlurryAgent;->endTimedEvent(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0
.end method

.method public logEvent(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p2, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 42
    :cond_0
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;)V

    .line 48
    :goto_0
    return-void

    .line 46
    :cond_1
    invoke-static {p1, p2}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0
.end method

.method public start()V
    .locals 2

    .prologue
    .line 30
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/cobra/zufflin/flurry/ZufflinFlurry;->apiKey:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAgent;->onStartSession(Landroid/content/Context;Ljava/lang/String;)V

    .line 31
    return-void
.end method

.method public startTimedEvent(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p2, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 54
    :cond_0
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;)V

    .line 60
    :goto_0
    return-void

    .line 58
    :cond_1
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;Ljava/util/Map;Z)V

    goto :goto_0
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 35
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/android/FlurryAgent;->onEndSession(Landroid/content/Context;)V

    .line 36
    return-void
.end method
