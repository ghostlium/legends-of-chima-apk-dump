.class Lcom/playhaven/android/Placement$1;
.super Ljava/lang/Object;
.source "Placement.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/Placement;
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
        "Lcom/playhaven/android/Placement;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/playhaven/android/Placement;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 156
    new-instance v0, Lcom/playhaven/android/Placement;

    invoke-direct {v0, p1}, Lcom/playhaven/android/Placement;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/playhaven/android/Placement$1;->createFromParcel(Landroid/os/Parcel;)Lcom/playhaven/android/Placement;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/playhaven/android/Placement;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 157
    new-array v0, p1, [Lcom/playhaven/android/Placement;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/playhaven/android/Placement$1;->newArray(I)[Lcom/playhaven/android/Placement;

    move-result-object v0

    return-object v0
.end method