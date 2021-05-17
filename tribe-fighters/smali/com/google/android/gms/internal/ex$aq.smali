.class final Lcom/google/android/gms/internal/ex$aq;
.super Lcom/google/android/gms/internal/ew;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "aq"
.end annotation


# instance fields
.field final synthetic qW:Lcom/google/android/gms/internal/ex;

.field private final rs:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

.field private final rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

.field private final ru:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;)V
    .locals 2

    const/4 v1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    invoke-direct {p0}, Lcom/google/android/gms/internal/ew;-><init>()V

    const-string v0, "Callbacks must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/du;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    iput-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->rs:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    iput-object v1, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    iput-object v1, p0, Lcom/google/android/gms/internal/ex$aq;->ru:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    invoke-direct {p0}, Lcom/google/android/gms/internal/ew;-><init>()V

    const-string v0, "Callbacks must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/du;->c(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    iput-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->rs:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    iput-object p3, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    iput-object p4, p0, Lcom/google/android/gms/internal/ex$aq;->ru:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$af;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/ex$af;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public b(Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$ag;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/ex$ag;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public c(Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$ah;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/ex$ah;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public d(Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$ad;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/ex$ad;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public e(Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$ac;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/ex$ac;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public f(Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$ae;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/ex$ae;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public onLeftRoom(ILjava/lang/String;)V
    .locals 4
    .param p1, "statusCode"    # I
    .param p2, "externalRoomId"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$v;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rs:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/ex$v;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public onP2PConnected(Ljava/lang/String;)V
    .locals 4
    .param p1, "participantId"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$aa;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/ex$aa;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public onP2PDisconnected(Ljava/lang/String;)V
    .locals 4
    .param p1, "participantId"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$ab;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/ex$ab;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public onRealTimeMessageReceived(Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessage;)V
    .locals 4
    .param p1, "message"    # Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessage;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$z;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->ru:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/ex$z;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessage;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public s(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$at;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rs:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/ex$at;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/common/data/DataHolder;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public t(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$q;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rs:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/ex$q;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/common/data/DataHolder;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public u(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$as;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/ex$as;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/common/data/DataHolder;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public v(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$ap;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/ex$ap;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/common/data/DataHolder;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public w(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$ar;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rs:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/ex$ar;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/common/data/DataHolder;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public x(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$h;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/ex$h;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/common/data/DataHolder;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method

.method public y(Lcom/google/android/gms/common/data/DataHolder;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v1, Lcom/google/android/gms/internal/ex$i;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$aq;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v3, p0, Lcom/google/android/gms/internal/ex$aq;->rt:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/ex$i;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/common/data/DataHolder;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method
