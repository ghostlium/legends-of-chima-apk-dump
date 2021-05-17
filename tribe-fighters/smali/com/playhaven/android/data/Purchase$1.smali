.class Lcom/playhaven/android/data/Purchase$1;
.super Ljava/lang/Object;
.source "Purchase.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/data/Purchase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/playhaven/android/data/Purchase;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/playhaven/android/data/Purchase;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 175
    new-instance v0, Lcom/playhaven/android/data/Purchase;

    invoke-direct {v0, p1}, Lcom/playhaven/android/data/Purchase;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/playhaven/android/data/Purchase$1;->createFromParcel(Landroid/os/Parcel;)Lcom/playhaven/android/data/Purchase;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/playhaven/android/data/Purchase;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 176
    new-array v0, p1, [Lcom/playhaven/android/data/Purchase;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/playhaven/android/data/Purchase$1;->newArray(I)[Lcom/playhaven/android/data/Purchase;

    move-result-object v0

    return-object v0
.end method
