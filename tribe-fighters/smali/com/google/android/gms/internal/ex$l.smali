.class final Lcom/google/android/gms/internal/ex$l;
.super Lcom/google/android/gms/internal/ew;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "l"
.end annotation


# instance fields
.field final synthetic qW:Lcom/google/android/gms/internal/ex;

.field private final ra:Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ex$l;->qW:Lcom/google/android/gms/internal/ex;

    invoke-direct {p0}, Lcom/google/android/gms/internal/ew;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/ex$l;->ra:Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;

    return-void
.end method


# virtual methods
.method public k(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 5

    new-instance v1, Lcom/google/android/gms/games/multiplayer/InvitationBuffer;

    invoke-direct {v1, p1}, Lcom/google/android/gms/games/multiplayer/InvitationBuffer;-><init>(Lcom/google/android/gms/common/data/DataHolder;)V

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {v1}, Lcom/google/android/gms/games/multiplayer/InvitationBuffer;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/games/multiplayer/InvitationBuffer;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/multiplayer/Invitation;

    invoke-interface {v0}, Lcom/google/android/gms/games/multiplayer/Invitation;->freeze()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/multiplayer/Invitation;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    invoke-virtual {v1}, Lcom/google/android/gms/games/multiplayer/InvitationBuffer;->close()V

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/ex$l;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v2, Lcom/google/android/gms/internal/ex$m;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$l;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v4, p0, Lcom/google/android/gms/internal/ex$l;->ra:Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;

    invoke-direct {v2, v3, v4, v0}, Lcom/google/android/gms/internal/ex$m;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;Lcom/google/android/gms/games/multiplayer/Invitation;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Lcom/google/android/gms/games/multiplayer/InvitationBuffer;->close()V

    throw v0
.end method

.method public onInvitationRemoved(Ljava/lang/String;)V
    .locals 4
    .param p1, "invitationId"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/ex$l;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$n;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$l;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$l;->ra:Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/ex$n;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method
