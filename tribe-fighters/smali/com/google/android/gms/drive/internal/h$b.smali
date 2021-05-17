.class abstract Lcom/google/android/gms/drive/internal/h$b;
.super Lcom/google/android/gms/drive/internal/i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/drive/internal/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/drive/internal/i",
        "<",
        "Lcom/google/android/gms/common/api/Status;",
        "Lcom/google/android/gms/drive/DriveApi$OnContentsDiscardedCallback;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic or:Lcom/google/android/gms/drive/internal/h;


# direct methods
.method constructor <init>(Lcom/google/android/gms/drive/internal/h;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/drive/internal/h$b;->or:Lcom/google/android/gms/drive/internal/h;

    invoke-direct {p0}, Lcom/google/android/gms/drive/internal/i;-><init>()V

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/drive/DriveApi$OnContentsDiscardedCallback;Lcom/google/android/gms/common/api/Status;)V
    .locals 0

    invoke-interface {p1, p2}, Lcom/google/android/gms/drive/DriveApi$OnContentsDiscardedCallback;->onContentsDiscarded(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;Lcom/google/android/gms/common/api/Result;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/drive/DriveApi$OnContentsDiscardedCallback;

    check-cast p2, Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/internal/h$b;->a(Lcom/google/android/gms/drive/DriveApi$OnContentsDiscardedCallback;Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public synthetic b(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/internal/h$b;->e(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    return-object v0
.end method

.method public e(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Status;
    .locals 0

    return-object p1
.end method
