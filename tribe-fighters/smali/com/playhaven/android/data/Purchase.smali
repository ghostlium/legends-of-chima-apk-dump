.class public Lcom/playhaven/android/data/Purchase;
.super Ljava/lang/Object;
.source "Purchase.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/playhaven/android/data/Purchase$Result;,
        Lcom/playhaven/android/data/Purchase$Store;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/playhaven/android/data/Purchase;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private cookie:Ljava/lang/String;

.field private orderId:Ljava/lang/String;

.field private payload:Ljava/lang/String;

.field private placementTag:Ljava/lang/String;

.field private price:Ljava/lang/String;

.field private quantity:Ljava/lang/String;

.field private receipt:Ljava/lang/String;

.field private result:Lcom/playhaven/android/data/Purchase$Result;

.field private signature:Ljava/lang/String;

.field private sku:Ljava/lang/String;

.field private store:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 173
    new-instance v0, Lcom/playhaven/android/data/Purchase$1;

    invoke-direct {v0}, Lcom/playhaven/android/data/Purchase$1;-><init>()V

    sput-object v0, Lcom/playhaven/android/data/Purchase;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 177
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    sget-object v0, Lcom/playhaven/android/data/Purchase$Result;->Unset:Lcom/playhaven/android/data/Purchase$Result;

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->result:Lcom/playhaven/android/data/Purchase$Result;

    .line 114
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    sget-object v0, Lcom/playhaven/android/data/Purchase$Result;->Unset:Lcom/playhaven/android/data/Purchase$Result;

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->result:Lcom/playhaven/android/data/Purchase$Result;

    .line 108
    invoke-virtual {p0, p1}, Lcom/playhaven/android/data/Purchase;->readFromParcel(Landroid/os/Parcel;)V

    .line 109
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "json"    # Ljava/lang/String;
    .param p2, "placementTag"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    sget-object v0, Lcom/playhaven/android/data/Purchase$Result;->Unset:Lcom/playhaven/android/data/Purchase$Result;

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->result:Lcom/playhaven/android/data/Purchase$Result;

    .line 88
    const-string v0, "$.cookie"

    invoke-static {p1, v0}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->cookie:Ljava/lang/String;

    .line 89
    const-string v0, "$.name"

    invoke-static {p1, v0}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->title:Ljava/lang/String;

    .line 90
    const-string v0, "$.product"

    invoke-static {p1, v0}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->sku:Ljava/lang/String;

    .line 91
    const-string v0, "$.sig4"

    invoke-static {p1, v0}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->signature:Ljava/lang/String;

    .line 92
    iput-object v1, p0, Lcom/playhaven/android/data/Purchase;->price:Ljava/lang/String;

    .line 93
    iput-object v1, p0, Lcom/playhaven/android/data/Purchase;->store:Ljava/lang/String;

    .line 94
    iput-object p2, p0, Lcom/playhaven/android/data/Purchase;->placementTag:Ljava/lang/String;

    .line 95
    iput-object v1, p0, Lcom/playhaven/android/data/Purchase;->payload:Ljava/lang/String;

    .line 96
    iput-object v1, p0, Lcom/playhaven/android/data/Purchase;->orderId:Ljava/lang/String;

    .line 102
    const-string v0, "$.quantity"

    invoke-static {p1, v0}, Lcom/playhaven/android/util/JsonUtil;->asString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->quantity:Ljava/lang/String;

    .line 103
    const-string v0, "$.receipt"

    invoke-static {p1, v0}, Lcom/playhaven/android/util/JsonUtil;->asString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->receipt:Ljava/lang/String;

    .line 104
    return-void
.end method

.method public static fromJson(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .param p0, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/playhaven/android/data/Purchase;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    if-nez p0, :cond_1

    new-instance v3, Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 83
    :cond_0
    return-object v3

    .line 75
    :cond_1
    const-string v5, "$.url"

    invoke-static {p0, v5}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 76
    .local v4, "url":Ljava/lang/String;
    new-instance v2, Landroid/net/UrlQuerySanitizer;

    invoke-direct {v2, v4}, Landroid/net/UrlQuerySanitizer;-><init>(Ljava/lang/String;)V

    .line 77
    .local v2, "sanitizer":Landroid/net/UrlQuerySanitizer;
    const-string v5, "placement_tag"

    invoke-virtual {v2, v5}, Landroid/net/UrlQuerySanitizer;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 79
    .local v1, "placementTag":Ljava/lang/String;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .local v3, "toReturn":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/playhaven/android/data/Purchase;>;"
    const-string v5, "$.purchases"

    invoke-static {p0, v5}, Lcom/playhaven/android/util/JsonUtil;->forEach(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Iterable;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 81
    .local v0, "jsonPurchase":Ljava/lang/String;
    new-instance v6, Lcom/playhaven/android/data/Purchase;

    invoke-direct {v6, v0, v1}, Lcom/playhaven/android/data/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 123
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 223
    invoke-static {p0, p1}, Lorg/apache/commons/lang/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getCookie()Ljava/lang/String;
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->cookie:Ljava/lang/String;

    return-object v0
.end method

.method public getOrderId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->orderId:Ljava/lang/String;

    return-object v0
.end method

.method public getPayload()Ljava/lang/String;
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->payload:Ljava/lang/String;

    return-object v0
.end method

.method public getPlacementTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->placementTag:Ljava/lang/String;

    return-object v0
.end method

.method public getPrice()Ljava/lang/String;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->price:Ljava/lang/String;

    return-object v0
.end method

.method public getQuantity()Ljava/lang/String;
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->quantity:Ljava/lang/String;

    return-object v0
.end method

.method public getReceipt()Ljava/lang/String;
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->receipt:Ljava/lang/String;

    return-object v0
.end method

.method public getResult()Lcom/playhaven/android/data/Purchase$Result;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->result:Lcom/playhaven/android/data/Purchase$Result;

    return-object v0
.end method

.method public getSKU()Ljava/lang/String;
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->sku:Ljava/lang/String;

    return-object v0
.end method

.method public getSignature()Ljava/lang/String;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->signature:Ljava/lang/String;

    return-object v0
.end method

.method public getStore()Ljava/lang/String;
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->store:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->title:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 218
    invoke-static {p0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->reflectionHashCode(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method protected readFromParcel(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 156
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->sku:Ljava/lang/String;

    .line 157
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->title:Ljava/lang/String;

    .line 158
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->quantity:Ljava/lang/String;

    .line 159
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->price:Ljava/lang/String;

    .line 160
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->store:Ljava/lang/String;

    .line 161
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->signature:Ljava/lang/String;

    .line 162
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->receipt:Ljava/lang/String;

    .line 163
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->cookie:Ljava/lang/String;

    .line 164
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->placementTag:Ljava/lang/String;

    .line 165
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->payload:Ljava/lang/String;

    .line 166
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->orderId:Ljava/lang/String;

    .line 167
    invoke-static {}, Lcom/playhaven/android/data/Purchase$Result;->values()[Lcom/playhaven/android/data/Purchase$Result;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->result:Lcom/playhaven/android/data/Purchase$Result;

    .line 168
    return-void
.end method

.method public setOrderId(Ljava/lang/String;)V
    .locals 0
    .param p1, "orderId"    # Ljava/lang/String;

    .prologue
    .line 207
    iput-object p1, p0, Lcom/playhaven/android/data/Purchase;->orderId:Ljava/lang/String;

    return-void
.end method

.method public setPayload(Ljava/lang/String;)V
    .locals 0
    .param p1, "payload"    # Ljava/lang/String;

    .prologue
    .line 205
    iput-object p1, p0, Lcom/playhaven/android/data/Purchase;->payload:Ljava/lang/String;

    return-void
.end method

.method public setPrice(Ljava/lang/Double;)V
    .locals 1
    .param p1, "price"    # Ljava/lang/Double;

    .prologue
    .line 200
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/playhaven/android/data/Purchase;->setPrice(Ljava/lang/String;)V

    .line 201
    return-void
.end method

.method public setPrice(Ljava/lang/String;)V
    .locals 2
    .param p1, "price"    # Ljava/lang/String;

    .prologue
    .line 193
    if-nez p1, :cond_0

    .line 194
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->price:Ljava/lang/String;

    .line 197
    :goto_0
    return-void

    .line 196
    :cond_0
    const-string v0, "[^0-9\\.]"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->price:Ljava/lang/String;

    goto :goto_0
.end method

.method public setQuantity(I)V
    .locals 1
    .param p1, "qty"    # I

    .prologue
    .line 185
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/Purchase;->quantity:Ljava/lang/String;

    return-void
.end method

.method public setResult(Lcom/playhaven/android/data/Purchase$Result;)V
    .locals 0
    .param p1, "result"    # Lcom/playhaven/android/data/Purchase$Result;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/playhaven/android/data/Purchase;->result:Lcom/playhaven/android/data/Purchase$Result;

    return-void
.end method

.method public setSKU(Ljava/lang/String;)V
    .locals 0
    .param p1, "sku"    # Ljava/lang/String;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/playhaven/android/data/Purchase;->sku:Ljava/lang/String;

    return-void
.end method

.method public setStore(Lcom/playhaven/android/data/Purchase$Store;)V
    .locals 1
    .param p1, "store"    # Lcom/playhaven/android/data/Purchase$Store;

    .prologue
    .line 202
    invoke-virtual {p1}, Lcom/playhaven/android/data/Purchase$Store;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/playhaven/android/data/Purchase;->setStore(Ljava/lang/String;)V

    return-void
.end method

.method public setStore(Ljava/lang/String;)V
    .locals 0
    .param p1, "store"    # Ljava/lang/String;

    .prologue
    .line 203
    iput-object p1, p0, Lcom/playhaven/android/data/Purchase;->store:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 213
    invoke-static {p0}, Lorg/apache/commons/lang/builder/ToStringBuilder;->reflectionToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 135
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->sku:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 136
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 137
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->quantity:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 138
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->price:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 139
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->store:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 140
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->signature:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 141
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->receipt:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 142
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->cookie:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 143
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->placementTag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 144
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->payload:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 145
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->orderId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 146
    iget-object v0, p0, Lcom/playhaven/android/data/Purchase;->result:Lcom/playhaven/android/data/Purchase$Result;

    invoke-virtual {v0}, Lcom/playhaven/android/data/Purchase$Result;->ordinal()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 147
    return-void
.end method
