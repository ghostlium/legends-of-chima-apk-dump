.class abstract Lcom/google/android/gms/drive/internal/k$a;
.super Lcom/google/android/gms/drive/internal/i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/drive/internal/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/drive/internal/i",
        "<",
        "Lcom/google/android/gms/common/api/Status;",
        "Lcom/google/android/gms/drive/DriveFile$OnContentsClosedCallback;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic ox:Lcom/google/android/gms/drive/internal/k;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/drive/internal/k;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/drive/internal/k$a;->ox:Lcom/google/android/gms/drive/internal/k;

    invoke-direct {p0}, Lcom/google/android/gms/drive/internal/i;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/drive/internal/k;Lcom/google/android/gms/drive/internal/k$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/drive/internal/k$a;-><init>(Lcom/google/android/gms/drive/internal/k;)V

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/drive/DriveFile$OnContentsClosedCallback;Lcom/google/android/gms/common/api/Status;)V
    .locals 0

    invoke-interface {p1, p2}, Lcom/google/android/gms/drive/DriveFile$OnContentsClosedCallback;->onClose(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;Lcom/google/android/gms/common/api/Result;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/drive/DriveFile$OnContentsClosedCallback;

    check-cast p2, Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/drive/internal/k$a;->a(Lcom/google/android/gms/drive/DriveFile$OnContentsClosedCallback;Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public synthetic b(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/drive/internal/k$a;->e(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    return-object v0
.end method

.method public e(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Status;
    .locals 0

    return-object p1
.end method
