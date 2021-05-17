.class public Lcom/playhaven/android/data/DataCollectionField;
.super Ljava/lang/Object;
.source "DataCollectionField.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/playhaven/android/data/DataCollectionField$FieldNames;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/playhaven/android/data/DataCollectionField;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field mCssClass:Ljava/lang/String;

.field mName:Ljava/lang/String;

.field mType:Ljava/lang/String;

.field mValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    new-instance v0, Lcom/playhaven/android/data/DataCollectionField$1;

    invoke-direct {v0}, Lcom/playhaven/android/data/DataCollectionField$1;-><init>()V

    .line 52
    sput-object v0, Lcom/playhaven/android/data/DataCollectionField;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 64
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 0
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    invoke-virtual {p0, p1}, Lcom/playhaven/android/data/DataCollectionField;->readFromParcel(Landroid/os/Parcel;)V

    .line 104
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 93
    .local v1, "obj":Lorg/json/JSONObject;
    sget-object v2, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->type:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    invoke-virtual {v2}, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->name()Ljava/lang/String;

    move-result-object v2

    const-string v3, "text"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/playhaven/android/data/DataCollectionField;->mType:Ljava/lang/String;

    .line 94
    sget-object v2, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->name:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    invoke-virtual {v2}, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->name()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/playhaven/android/data/DataCollectionField;->mName:Ljava/lang/String;

    .line 95
    sget-object v2, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->cssClass:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    invoke-virtual {v2}, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->name()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/playhaven/android/data/DataCollectionField;->mCssClass:Ljava/lang/String;

    .line 96
    sget-object v2, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->value:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    invoke-virtual {v2}, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->name()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/playhaven/android/data/DataCollectionField;->mValue:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    return-void

    .line 97
    .end local v1    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Lorg/json/JSONException;
    new-instance v2, Lcom/playhaven/android/PlayHavenException;

    const-string v3, "Could not parse form data from template."

    invoke-direct {v2, v3, v0}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static fromUrl(Landroid/net/Uri;)Ljava/util/ArrayList;
    .locals 8
    .param p0, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/playhaven/android/data/DataCollectionField;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 67
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .local v1, "toReturn":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/playhaven/android/data/DataCollectionField;>;"
    if-nez p0, :cond_1

    .line 81
    :cond_0
    return-object v1

    .line 70
    :cond_1
    invoke-static {p0}, Lcom/playhaven/android/data/DataCollectionField;->getQueryParameterNames(Landroid/net/Uri;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 72
    .local v0, "paramKey":Ljava/lang/String;
    const-string v3, "dcDataCallback"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 73
    const-string v3, "_"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 74
    new-instance v3, Lcom/playhaven/android/data/DataCollectionField;

    .line 75
    const-string v4, "{\"name\":\"%s\", \"value\":\"%s\"}"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 76
    aput-object v0, v5, v6

    const/4 v6, 0x1

    .line 77
    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    .line 74
    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/playhaven/android/data/DataCollectionField;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public static getQueryParameterNames(Landroid/net/Uri;)Ljava/util/Set;
    .locals 9
    .param p0, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v8, -0x1

    .line 175
    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v4

    .line 176
    .local v4, "query":Ljava/lang/String;
    if-nez v4, :cond_0

    .line 177
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v7

    .line 198
    :goto_0
    return-object v7

    .line 180
    :cond_0
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    .line 181
    .local v2, "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v6, 0x0

    .line 183
    .local v6, "start":I
    :cond_1
    const/16 v7, 0x26

    invoke-virtual {v4, v7, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 184
    .local v3, "next":I
    if-ne v3, v8, :cond_4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    .line 186
    .local v0, "end":I
    :goto_1
    const/16 v7, 0x3d

    invoke-virtual {v4, v7, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    .line 187
    .local v5, "separator":I
    if-gt v5, v0, :cond_2

    if-ne v5, v8, :cond_3

    .line 188
    :cond_2
    move v5, v0

    .line 191
    :cond_3
    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 192
    .local v1, "name":Ljava/lang/String;
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 195
    add-int/lit8 v6, v0, 0x1

    .line 196
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    .line 182
    if-lt v6, v7, :cond_1

    .line 198
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v7

    goto :goto_0

    .end local v0    # "end":I
    .end local v1    # "name":Ljava/lang/String;
    .end local v5    # "separator":I
    :cond_4
    move v0, v3

    .line 184
    goto :goto_1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 113
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 160
    invoke-static {p0, p1}, Lorg/apache/commons/lang/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getCssClass()Ljava/lang/String;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/playhaven/android/data/DataCollectionField;->mCssClass:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/playhaven/android/data/DataCollectionField;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/playhaven/android/data/DataCollectionField;->mType:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/playhaven/android/data/DataCollectionField;->mValue:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 155
    invoke-static {p0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->reflectionHashCode(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method protected readFromParcel(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 137
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/DataCollectionField;->mType:Ljava/lang/String;

    .line 138
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/DataCollectionField;->mName:Ljava/lang/String;

    .line 139
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/DataCollectionField;->mCssClass:Ljava/lang/String;

    .line 140
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/data/DataCollectionField;->mValue:Ljava/lang/String;

    .line 141
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 150
    invoke-static {p0}, Lorg/apache/commons/lang/builder/ToStringBuilder;->reflectionToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 124
    iget-object v0, p0, Lcom/playhaven/android/data/DataCollectionField;->mType:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 125
    iget-object v0, p0, Lcom/playhaven/android/data/DataCollectionField;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 126
    iget-object v0, p0, Lcom/playhaven/android/data/DataCollectionField;->mCssClass:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lcom/playhaven/android/data/DataCollectionField;->mValue:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 128
    return-void
.end method
