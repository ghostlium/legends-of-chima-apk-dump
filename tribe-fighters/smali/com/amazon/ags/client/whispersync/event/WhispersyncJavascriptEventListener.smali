.class public Lcom/amazon/ags/client/whispersync/event/WhispersyncJavascriptEventListener;
.super Ljava/lang/Object;
.source "WhispersyncJavascriptEventListener.java"

# interfaces
.implements Lcom/amazon/ags/html5/javascript/event/JavascriptEventListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private final synchronizationManager:Lcom/amazon/ags/client/whispersync/SynchronizationManager;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/client/whispersync/SynchronizationManager;)V
    .locals 0
    .param p1, "synchronizationManager"    # Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/event/WhispersyncJavascriptEventListener;->synchronizationManager:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    .line 21
    return-void
.end method


# virtual methods
.method public onJavascriptEvent(Ljava/lang/String;)V
    .locals 3
    .param p1, "eventType"    # Ljava/lang/String;

    .prologue
    .line 25
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Received an event ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] from Javascript"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    const-string v0, "signInEvent"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 28
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/event/WhispersyncJavascriptEventListener;->synchronizationManager:Lcom/amazon/ags/client/whispersync/SynchronizationManager;

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/SynchronizationManager;->syncActively()V

    .line 30
    :cond_0
    return-void
.end method
