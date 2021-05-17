.class public final Lcom/google/android/gms/drive/metadata/internal/c;
.super Ljava/lang/Object;


# static fields
.field private static oS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/drive/metadata/MetadataField",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/drive/metadata/internal/c;->oS:Ljava/util/Map;

    sget-object v0, Lcom/google/android/gms/internal/et;->oU:Lcom/google/android/gms/drive/metadata/MetadataField;

    invoke-static {v0}, Lcom/google/android/gms/drive/metadata/internal/c;->b(Lcom/google/android/gms/drive/metadata/MetadataField;)V

    sget-object v0, Lcom/google/android/gms/internal/et;->TITLE:Lcom/google/android/gms/drive/metadata/MetadataField;

    invoke-static {v0}, Lcom/google/android/gms/drive/metadata/internal/c;->b(Lcom/google/android/gms/drive/metadata/MetadataField;)V

    sget-object v0, Lcom/google/android/gms/internal/et;->MIME_TYPE:Lcom/google/android/gms/drive/metadata/MetadataField;

    invoke-static {v0}, Lcom/google/android/gms/drive/metadata/internal/c;->b(Lcom/google/android/gms/drive/metadata/MetadataField;)V

    sget-object v0, Lcom/google/android/gms/internal/et;->STARRED:Lcom/google/android/gms/drive/metadata/MetadataField;

    invoke-static {v0}, Lcom/google/android/gms/drive/metadata/internal/c;->b(Lcom/google/android/gms/drive/metadata/MetadataField;)V

    sget-object v0, Lcom/google/android/gms/internal/et;->TRASHED:Lcom/google/android/gms/drive/metadata/MetadataField;

    invoke-static {v0}, Lcom/google/android/gms/drive/metadata/internal/c;->b(Lcom/google/android/gms/drive/metadata/MetadataField;)V

    sget-object v0, Lcom/google/android/gms/internal/et;->oV:Lcom/google/android/gms/drive/metadata/MetadataField;

    invoke-static {v0}, Lcom/google/android/gms/drive/metadata/internal/c;->b(Lcom/google/android/gms/drive/metadata/MetadataField;)V

    sget-object v0, Lcom/google/android/gms/internal/et;->oW:Lcom/google/android/gms/drive/metadata/MetadataField;

    invoke-static {v0}, Lcom/google/android/gms/drive/metadata/internal/c;->b(Lcom/google/android/gms/drive/metadata/MetadataField;)V

    sget-object v0, Lcom/google/android/gms/internal/et;->PARENTS:Lcom/google/android/gms/drive/metadata/CollectionMetadataField;

    invoke-static {v0}, Lcom/google/android/gms/drive/metadata/internal/c;->b(Lcom/google/android/gms/drive/metadata/MetadataField;)V

    sget-object v0, Lcom/google/android/gms/internal/eu;->oZ:Lcom/google/android/gms/drive/metadata/OrderedMetadataField;

    invoke-static {v0}, Lcom/google/android/gms/drive/metadata/internal/c;->b(Lcom/google/android/gms/drive/metadata/MetadataField;)V

    sget-object v0, Lcom/google/android/gms/internal/eu;->oX:Lcom/google/android/gms/drive/metadata/OrderedMetadataField;

    invoke-static {v0}, Lcom/google/android/gms/drive/metadata/internal/c;->b(Lcom/google/android/gms/drive/metadata/MetadataField;)V

    sget-object v0, Lcom/google/android/gms/internal/eu;->oY:Lcom/google/android/gms/drive/metadata/OrderedMetadataField;

    invoke-static {v0}, Lcom/google/android/gms/drive/metadata/internal/c;->b(Lcom/google/android/gms/drive/metadata/MetadataField;)V

    sget-object v0, Lcom/google/android/gms/internal/eu;->pa:Lcom/google/android/gms/drive/metadata/OrderedMetadataField;

    invoke-static {v0}, Lcom/google/android/gms/drive/metadata/internal/c;->b(Lcom/google/android/gms/drive/metadata/MetadataField;)V

    return-void
.end method

.method public static P(Ljava/lang/String;)Lcom/google/android/gms/drive/metadata/MetadataField;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/drive/metadata/MetadataField",
            "<*>;"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/drive/metadata/internal/c;->oS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/drive/metadata/MetadataField;

    return-object v0
.end method

.method private static b(Lcom/google/android/gms/drive/metadata/MetadataField;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/drive/metadata/MetadataField",
            "<*>;)V"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/drive/metadata/internal/c;->oS:Ljava/util/Map;

    invoke-virtual {p0}, Lcom/google/android/gms/drive/metadata/MetadataField;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Duplicate field name registered: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/drive/metadata/MetadataField;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    sget-object v0, Lcom/google/android/gms/drive/metadata/internal/c;->oS:Ljava/util/Map;

    invoke-virtual {p0}, Lcom/google/android/gms/drive/metadata/MetadataField;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static cD()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/google/android/gms/drive/metadata/MetadataField",
            "<*>;>;"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/drive/metadata/internal/c;->oS:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
