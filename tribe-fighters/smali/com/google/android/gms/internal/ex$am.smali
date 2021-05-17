.class final Lcom/google/android/gms/internal/ex$am;
.super Lcom/google/android/gms/internal/dk$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "am"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/dk",
        "<",
        "Lcom/google/android/gms/internal/fc;",
        ">.b<",
        "Lcom/google/android/gms/games/multiplayer/realtime/a$a;",
        ">;"
    }
.end annotation


# instance fields
.field private final ka:I

.field final synthetic qW:Lcom/google/android/gms/internal/ex;

.field private final rp:Ljava/lang/String;

.field private final rq:I


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/a$a;IILjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ex$am;->qW:Lcom/google/android/gms/internal/ex;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/dk$b;-><init>(Lcom/google/android/gms/internal/dk;Ljava/lang/Object;)V

    iput p3, p0, Lcom/google/android/gms/internal/ex$am;->ka:I

    iput p4, p0, Lcom/google/android/gms/internal/ex$am;->rq:I

    iput-object p5, p0, Lcom/google/android/gms/internal/ex$am;->rp:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/games/multiplayer/realtime/a$a;)V
    .locals 3

    if-eqz p1, :cond_0

    iget v0, p0, Lcom/google/android/gms/internal/ex$am;->ka:I

    iget v1, p0, Lcom/google/android/gms/internal/ex$am;->rq:I

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$am;->rp:Ljava/lang/String;

    invoke-interface {p1, v0, v1, v2}, Lcom/google/android/gms/games/multiplayer/realtime/a$a;->onRealTimeMessageSent(IILjava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected aQ()V
    .locals 0

    return-void
.end method

.method public synthetic b(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/games/multiplayer/realtime/a$a;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ex$am;->a(Lcom/google/android/gms/games/multiplayer/realtime/a$a;)V

    return-void
.end method
