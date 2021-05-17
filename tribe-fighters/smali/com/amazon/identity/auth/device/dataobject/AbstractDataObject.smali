.class public abstract Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;
.super Ljava/lang/Object;
.source "AbstractDataObject.java"


# static fields
.field public static final NON_EXISTENT_ROW:I = -0x1


# instance fields
.field private rowId:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->rowId:J

    return-void
.end method


# virtual methods
.method protected areObjectsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj1"    # Ljava/lang/Object;
    .param p2, "obj2"    # Ljava/lang/Object;

    .prologue
    .line 90
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 92
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 94
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public delete(Landroid/content/Context;)Z
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 67
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getRowId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->deleteRow(J)Z

    move-result v0

    .line 69
    .local v0, "deleteSuccess":Z
    if-eqz v0, :cond_0

    .line 70
    const-wide/16 v1, -0x1

    invoke-virtual {p0, v1, v2}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->setRowId(J)V

    .line 73
    :cond_0
    return v0
.end method

.method public abstract equals(Ljava/lang/Object;)Z
.end method

.method public abstract getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;",
            ">(",
            "Landroid/content/Context;",
            ")",
            "Lcom/amazon/identity/auth/device/datastore/AbstractDataSource",
            "<TK;>;"
        }
    .end annotation
.end method

.method public getRowId()J
    .locals 2

    .prologue
    .line 22
    iget-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->rowId:J

    return-wide v0
.end method

.method public abstract getValuesForInsert()Landroid/content/ContentValues;
.end method

.method public insert(Landroid/content/Context;)J
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->insertRow(Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;)J

    move-result-wide v0

    return-wide v0
.end method

.method public insertOrUpdate(Landroid/content/Context;)Z
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const-wide/16 v2, -0x1

    .line 52
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getRowId()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 53
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->insertRow(Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;)J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 56
    :goto_0
    return v0

    .line 53
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;

    move-result-object v0

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getRowId()J

    move-result-wide v1

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getValuesForInsert()Landroid/content/ContentValues;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->updateRow(JLandroid/content/ContentValues;)Z

    move-result v0

    goto :goto_0
.end method

.method public setRowId(J)V
    .locals 0
    .param p1, "rowId"    # J

    .prologue
    .line 24
    iput-wide p1, p0, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->rowId:J

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "rowid = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getRowId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getValuesForInsert()Landroid/content/ContentValues;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ContentValues;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public update(Landroid/content/Context;)Z
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;

    move-result-object v0

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getRowId()J

    move-result-wide v1

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;->getValuesForInsert()Landroid/content/ContentValues;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;->updateRow(JLandroid/content/ContentValues;)Z

    move-result v0

    return v0
.end method
