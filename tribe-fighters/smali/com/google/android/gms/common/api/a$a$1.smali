.class Lcom/google/android/gms/common/api/a$a$1;
.super Lcom/google/android/gms/common/api/a$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/common/api/a$a;-><init>(Lcom/google/android/gms/common/api/Api$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/api/a$b",
        "<TR;TC;>;"
    }
.end annotation


# instance fields
.field final synthetic kA:Lcom/google/android/gms/common/api/a$a;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/a$a;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/common/api/a$a$1;->kA:Lcom/google/android/gms/common/api/a$a;

    invoke-direct {p0}, Lcom/google/android/gms/common/api/a$b;-><init>()V

    return-void
.end method


# virtual methods
.method protected a(Ljava/lang/Object;Lcom/google/android/gms/common/api/Result;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;TR;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/common/api/a$a$1;->kA:Lcom/google/android/gms/common/api/a$a;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/common/api/a$a;->a(Ljava/lang/Object;Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Lcom/google/android/gms/common/api/Result;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/common/api/a$a$1;->a(Ljava/lang/Object;Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method
