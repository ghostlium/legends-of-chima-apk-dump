.class abstract Lcom/google/android/gms/drive/internal/i;
.super Lcom/google/android/gms/common/api/a$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R::",
        "Lcom/google/android/gms/common/api/Result;",
        "C:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/common/api/a$a",
        "<TR;TC;",
        "Lcom/google/android/gms/drive/internal/j;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    sget-object v0, Lcom/google/android/gms/drive/Drive;->jL:Lcom/google/android/gms/common/api/Api$b;

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/a$a;-><init>(Lcom/google/android/gms/common/api/Api$b;)V

    return-void
.end method
