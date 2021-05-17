.class public Lcom/playhaven/android/data/Reward;
.super Ljava/lang/Object;
.source "Reward.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/playhaven/android/data/Reward;",
            ">;"
        }
    .end annotation
.end field

.field private static final NULL:Ljava/lang/String; = "null"


# instance fields
.field private quantity:Ljava/lang/Double;

.field private receipt:Ljava/lang/Double;

.field private signature:Ljava/lang/String;

.field private tag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 121
    new-instance v0, Lcom/playhaven/android/data/Reward$1;

    invoke-direct {v0}, Lcom/playhaven/android/data/Reward$1;-><init>()V

    sput-object v0, Lcom/playhaven/android/data/Reward;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 125
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 0
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    invoke-virtual {p0, p1}, Lcom/playhaven/android/data/Reward;->readFromParcel(Landroid/os/Parcel;)V

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const-string v0, "$.quantity"

    invoke-static {p1, v0}, Lcom/playhaven/android/util/JsonUtil;->asDouble(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Reward;->quantity:Ljava/lang/Double;

    .line 66
    const-string v0, "$.receipt"

    invoke-static {p1, v0}, Lcom/playhaven/android/util/JsonUtil;->asDouble(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Reward;->receipt:Ljava/lang/Double;

    .line 67
    const-string v0, "$.reward"

    invoke-static {p1, v0}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/playhaven/android/data/Reward;->tag:Ljava/lang/String;

    .line 68
    const-string v0, "$.sig4"

    invoke-static {p1, v0}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/playhaven/android/data/Reward;->signature:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public static fromJson(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 4
    .param p0, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/playhaven/android/data/Reward;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    if-nez p0, :cond_1

    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 49
    :cond_0
    return-object v1

    .line 45
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .local v1, "toReturn":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/playhaven/android/data/Reward;>;"
    const-string v2, "$.rewards"

    invoke-static {p0, v2}, Lcom/playhaven/android/util/JsonUtil;->forEach(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 47
    .local v0, "jsonReward":Ljava/lang/String;
    new-instance v3, Lcom/playhaven/android/data/Reward;

    invoke-direct {v3, v0}, Lcom/playhaven/android/data/Reward;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 88
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 155
    invoke-static {p0, p1}, Lorg/apache/commons/lang/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getQuantity()Ljava/lang/Double;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/playhaven/android/data/Reward;->quantity:Ljava/lang/Double;

    return-object v0
.end method

.method public getReceipt()Ljava/lang/Double;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/playhaven/android/data/Reward;->receipt:Ljava/lang/Double;

    return-object v0
.end method

.method public getSignature()Ljava/lang/String;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/playhaven/android/data/Reward;->signature:Ljava/lang/String;

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/playhaven/android/data/Reward;->tag:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 150
    invoke-static {p0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->reflectionHashCode(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method protected readFromParcel(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 112
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Reward;->quantity:Ljava/lang/Double;

    .line 113
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Reward;->receipt:Ljava/lang/Double;

    .line 114
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Reward;->tag:Ljava/lang/String;

    .line 115
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Reward;->signature:Ljava/lang/String;

    .line 116
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 145
    invoke-static {p0}, Lorg/apache/commons/lang/builder/ToStringBuilder;->reflectionToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 99
    iget-object v0, p0, Lcom/playhaven/android/data/Reward;->quantity:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 100
    iget-object v0, p0, Lcom/playhaven/android/data/Reward;->receipt:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 101
    iget-object v0, p0, Lcom/playhaven/android/data/Reward;->tag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 102
    iget-object v0, p0, Lcom/playhaven/android/data/Reward;->signature:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 103
    return-void
.end method
