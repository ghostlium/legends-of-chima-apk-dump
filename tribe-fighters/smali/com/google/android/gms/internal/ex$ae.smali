.class final Lcom/google/android/gms/internal/ex$ae;
.super Lcom/google/android/gms/internal/ex$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ae"
.end annotation


# instance fields
.field final synthetic qW:Lcom/google/android/gms/internal/ex;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ex$ae;->qW:Lcom/google/android/gms/internal/ex;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/ex$a;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/common/data/DataHolder;[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/games/multiplayer/realtime/Room;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;",
            "Lcom/google/android/gms/games/multiplayer/realtime/Room;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1, p2, p3}, Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;->onPeersDisconnected(Lcom/google/android/gms/games/multiplayer/realtime/Room;Ljava/util/List;)V

    return-void
.end method
