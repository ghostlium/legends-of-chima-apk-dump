.class final Lcom/google/android/gms/internal/ex$an;
.super Lcom/google/android/gms/internal/ew;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "an"
.end annotation


# instance fields
.field final synthetic qW:Lcom/google/android/gms/internal/ex;

.field final rr:Lcom/google/android/gms/games/multiplayer/realtime/a$a;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/a$a;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ex$an;->qW:Lcom/google/android/gms/internal/ex;

    invoke-direct {p0}, Lcom/google/android/gms/internal/ew;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/ex$an;->rr:Lcom/google/android/gms/games/multiplayer/realtime/a$a;

    return-void
.end method


# virtual methods
.method public b(IILjava/lang/String;)V
    .locals 7

    iget-object v6, p0, Lcom/google/android/gms/internal/ex$an;->qW:Lcom/google/android/gms/internal/ex;

    new-instance v0, Lcom/google/android/gms/internal/ex$am;

    iget-object v1, p0, Lcom/google/android/gms/internal/ex$an;->qW:Lcom/google/android/gms/internal/ex;

    iget-object v2, p0, Lcom/google/android/gms/internal/ex$an;->rr:Lcom/google/android/gms/games/multiplayer/realtime/a$a;

    move v3, p1

    move v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/ex$am;-><init>(Lcom/google/android/gms/internal/ex;Lcom/google/android/gms/games/multiplayer/realtime/a$a;IILjava/lang/String;)V

    invoke-virtual {v6, v0}, Lcom/google/android/gms/internal/ex;->a(Lcom/google/android/gms/internal/dk$b;)V

    return-void
.end method
