.class final Lcom/google/android/gms/internal/fm$c;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/fp;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/fm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/fp",
        "<",
        "Lcom/google/android/gms/internal/fk;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic tW:Lcom/google/android/gms/internal/fm;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/fm;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/fm$c;->tW:Lcom/google/android/gms/internal/fm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/fm;Lcom/google/android/gms/internal/fm$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/fm$c;-><init>(Lcom/google/android/gms/internal/fm;)V

    return-void
.end method


# virtual methods
.method public bB()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/fm$c;->tW:Lcom/google/android/gms/internal/fm;

    invoke-static {v0}, Lcom/google/android/gms/internal/fm;->a(Lcom/google/android/gms/internal/fm;)V

    return-void
.end method

.method public synthetic bC()Landroid/os/IInterface;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/fm$c;->dr()Lcom/google/android/gms/internal/fk;

    move-result-object v0

    return-object v0
.end method

.method public dr()Lcom/google/android/gms/internal/fk;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/fm$c;->tW:Lcom/google/android/gms/internal/fm;

    invoke-static {v0}, Lcom/google/android/gms/internal/fm;->b(Lcom/google/android/gms/internal/fm;)Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/fk;

    return-object v0
.end method
