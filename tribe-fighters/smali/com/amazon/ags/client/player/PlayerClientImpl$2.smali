.class Lcom/amazon/ags/client/player/PlayerClientImpl$2;
.super Ljava/lang/Object;
.source "PlayerClientImpl.java"

# interfaces
.implements Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/player/PlayerClientImpl;->setSignedInListener(Lcom/amazon/ags/api/player/AGSignedInListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/player/PlayerClientImpl;

.field final synthetic val$listener:Lcom/amazon/ags/api/player/AGSignedInListener;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/player/PlayerClientImpl;Lcom/amazon/ags/api/player/AGSignedInListener;)V
    .locals 0

    .prologue
    .line 96
    iput-object p1, p0, Lcom/amazon/ags/client/player/PlayerClientImpl$2;->this$0:Lcom/amazon/ags/client/player/PlayerClientImpl;

    iput-object p2, p0, Lcom/amazon/ags/client/player/PlayerClientImpl$2;->val$listener:Lcom/amazon/ags/api/player/AGSignedInListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notifyIsGuestModeSet(Z)V
    .locals 5
    .param p1, "isGuestMode"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 108
    :try_start_0
    iget-object v4, p0, Lcom/amazon/ags/client/player/PlayerClientImpl$2;->val$listener:Lcom/amazon/ags/api/player/AGSignedInListener;

    if-nez p1, :cond_1

    move v3, v1

    :goto_0
    invoke-interface {v4, v3}, Lcom/amazon/ags/api/player/AGSignedInListener;->onSignedInStateChange(Z)V

    .line 110
    invoke-static {}, Lcom/amazon/ags/jni/AGSJniHandler;->isLibraryLoaded()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 111
    if-nez p1, :cond_2

    :goto_1
    invoke-static {v1}, Lcom/amazon/ags/jni/player/ProfilesJni;->callSignedInStateChangedListener(Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    :cond_0
    :goto_2
    return-void

    :cond_1
    move v3, v2

    .line 108
    goto :goto_0

    :cond_2
    move v1, v2

    .line 111
    goto :goto_1

    .line 113
    :catch_0
    move-exception v0

    .line 114
    .local v0, "throwable":Ljava/lang/Throwable;
    invoke-static {}, Lcom/amazon/ags/client/player/PlayerClientImpl;->access$000()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error in calling signed in listener: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method public notifyPlayerIdSet(Ljava/lang/String;)V
    .locals 0
    .param p1, "playerId"    # Ljava/lang/String;

    .prologue
    .line 103
    return-void
.end method

.method public notifyStateSet(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 99
    return-void
.end method
