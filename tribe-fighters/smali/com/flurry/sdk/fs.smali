.class public Lcom/flurry/sdk/fs;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/fs$1;,
        Lcom/flurry/sdk/fs$b;,
        Lcom/flurry/sdk/fs$c;,
        Lcom/flurry/sdk/fs$a;,
        Lcom/flurry/sdk/fs$d;
    }
.end annotation


# static fields
.field private static final a:Lcom/flurry/sdk/fs;

.field private static final b:Lcom/flurry/sdk/fm;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    new-instance v0, Lcom/flurry/sdk/fs;

    invoke-direct {v0}, Lcom/flurry/sdk/fs;-><init>()V

    sput-object v0, Lcom/flurry/sdk/fs;->a:Lcom/flurry/sdk/fs;

    .line 761
    sget-object v0, Lcom/flurry/sdk/fm$v;->g:Lcom/flurry/sdk/fm$v;

    invoke-static {v0}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$v;)Lcom/flurry/sdk/fm;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/fs;->b:Lcom/flurry/sdk/fm;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a()Lcom/flurry/sdk/fs;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/flurry/sdk/fs;->a:Lcom/flurry/sdk/fs;

    return-object v0
.end method

.method private a(Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 416
    move v0, v1

    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_5

    .line 417
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 418
    sparse-switch v2, :sswitch_data_0

    .line 445
    if-ltz v2, :cond_0

    const/16 v3, 0x1f

    if-le v2, v3, :cond_2

    :cond_0
    const/16 v3, 0x7f

    if-lt v2, v3, :cond_1

    const/16 v3, 0x9f

    if-le v2, v3, :cond_2

    :cond_1
    const/16 v3, 0x2000

    if-lt v2, v3, :cond_4

    const/16 v3, 0x20ff

    if-gt v2, v3, :cond_4

    .line 446
    :cond_2
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 447
    const-string v2, "\\u"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v2, v1

    .line 448
    :goto_1
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    rsub-int/lit8 v3, v3, 0x4

    if-ge v2, v3, :cond_3

    .line 449
    const/16 v3, 0x30

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 448
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 420
    :sswitch_0
    const-string v2, "\\\""

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 423
    :sswitch_1
    const-string v2, "\\\\"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 426
    :sswitch_2
    const-string v2, "\\b"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 429
    :sswitch_3
    const-string v2, "\\f"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 432
    :sswitch_4
    const-string v2, "\\n"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 435
    :sswitch_5
    const-string v2, "\\r"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 438
    :sswitch_6
    const-string v2, "\\t"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 441
    :sswitch_7
    const-string v2, "\\/"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 450
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 452
    :cond_4
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 456
    :cond_5
    return-void

    .line 418
    nop

    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_2
        0x9 -> :sswitch_6
        0xa -> :sswitch_4
        0xc -> :sswitch_3
        0xd -> :sswitch_5
        0x22 -> :sswitch_0
        0x2f -> :sswitch_7
        0x5c -> :sswitch_1
    .end sparse-switch
.end method


# virtual methods
.method protected a(ILjava/lang/Object;Lcom/flurry/sdk/fm;)I
    .locals 2

    .prologue
    .line 697
    mul-int/lit8 v0, p1, 0x1f

    invoke-virtual {p0, p2, p3}, Lcom/flurry/sdk/fs;->b(Ljava/lang/Object;Lcom/flurry/sdk/fm;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public a(Lcom/flurry/sdk/fm;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 539
    invoke-virtual {p0, p2}, Lcom/flurry/sdk/fs;->b(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/fm;->e(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 540
    if-eqz v0, :cond_0

    .line 541
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 542
    :cond_0
    new-instance v0, Lcom/flurry/sdk/fo;

    invoke-direct {v0, p1, p2}, Lcom/flurry/sdk/fo;-><init>(Lcom/flurry/sdk/fm;Ljava/lang/Object;)V

    throw v0
.end method

.method public a(Ljava/lang/Object;Ljava/lang/Object;Lcom/flurry/sdk/fm;)I
    .locals 1

    .prologue
    .line 705
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/Object;Lcom/flurry/sdk/fm;Z)I

    move-result v0

    return v0
.end method

.method protected a(Ljava/lang/Object;Ljava/lang/Object;Lcom/flurry/sdk/fm;Z)I
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 712
    if-ne p1, p2, :cond_1

    .line 757
    :cond_0
    :goto_0
    :pswitch_0
    return v2

    .line 713
    :cond_1
    sget-object v1, Lcom/flurry/sdk/fs$1;->a:[I

    invoke-virtual {p3}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v3

    aget v1, v1, v3

    packed-switch v1, :pswitch_data_0

    .line 757
    :pswitch_1
    check-cast p1, Ljava/lang/Comparable;

    invoke-interface {p1, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v2

    goto :goto_0

    .line 715
    :pswitch_2
    invoke-virtual {p3}, Lcom/flurry/sdk/fm;->b()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm$f;

    .line 716
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->f()Lcom/flurry/sdk/fm$f$a;

    move-result-object v1

    sget-object v4, Lcom/flurry/sdk/fm$f$a;->c:Lcom/flurry/sdk/fm$f$a;

    if-eq v1, v4, :cond_2

    .line 718
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->b()I

    move-result v1

    .line 719
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->a()Ljava/lang/String;

    move-result-object v4

    .line 720
    invoke-virtual {p0, p1, v4, v1}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p0, p2, v4, v1}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->c()Lcom/flurry/sdk/fm;

    move-result-object v4

    invoke-virtual {p0, v5, v1, v4, p4}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/Object;Lcom/flurry/sdk/fm;Z)I

    move-result v1

    .line 723
    if-eqz v1, :cond_2

    .line 724
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->f()Lcom/flurry/sdk/fm$f$a;

    move-result-object v0

    sget-object v2, Lcom/flurry/sdk/fm$f$a;->b:Lcom/flurry/sdk/fm$f$a;

    if-ne v0, v2, :cond_3

    neg-int v0, v1

    :goto_1
    move v2, v0

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_1

    .line 728
    :pswitch_3
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/flurry/sdk/fm;->c(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Lcom/flurry/sdk/fm;->c(Ljava/lang/String;)I

    move-result v1

    sub-int v2, v0, v1

    goto :goto_0

    .line 730
    :pswitch_4
    check-cast p1, Ljava/util/Collection;

    .line 731
    check-cast p2, Ljava/util/Collection;

    .line 732
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 733
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 734
    invoke-virtual {p3}, Lcom/flurry/sdk/fm;->i()Lcom/flurry/sdk/fm;

    move-result-object v5

    .line 735
    :cond_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 736
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v1, v6, v5, p4}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/Object;Lcom/flurry/sdk/fm;Z)I

    move-result v1

    .line 737
    if-eqz v1, :cond_4

    move v2, v1

    goto/16 :goto_0

    .line 739
    :cond_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    :goto_2
    move v2, v0

    goto/16 :goto_0

    :cond_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 v0, -0x1

    goto :goto_2

    :cond_7
    move v0, v2

    goto :goto_2

    .line 741
    :pswitch_5
    if-eqz p4, :cond_8

    .line 742
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    move v2, v0

    goto/16 :goto_0

    .line 743
    :cond_8
    new-instance v0, Lcom/flurry/sdk/fk;

    const-string v1, "Can\'t compare maps!"

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 745
    :pswitch_6
    invoke-virtual {p0, p3, p1}, Lcom/flurry/sdk/fs;->a(Lcom/flurry/sdk/fm;Ljava/lang/Object;)I

    move-result v0

    .line 746
    invoke-virtual {p0, p3, p2}, Lcom/flurry/sdk/fs;->a(Lcom/flurry/sdk/fm;Ljava/lang/Object;)I

    move-result v1

    .line 747
    if-ne v0, v1, :cond_9

    invoke-virtual {p3}, Lcom/flurry/sdk/fm;->k()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    invoke-virtual {p0, p1, p2, v0, p4}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/Object;Lcom/flurry/sdk/fm;Z)I

    move-result v0

    :goto_3
    move v2, v0

    goto/16 :goto_0

    :cond_9
    sub-int/2addr v0, v1

    goto :goto_3

    .line 753
    :pswitch_7
    instance-of v0, p1, Lcom/flurry/sdk/gx;

    if-eqz v0, :cond_a

    check-cast p1, Lcom/flurry/sdk/gx;

    .line 754
    :goto_4
    instance-of v0, p2, Lcom/flurry/sdk/gx;

    if-eqz v0, :cond_b

    check-cast p2, Lcom/flurry/sdk/gx;

    .line 755
    :goto_5
    invoke-virtual {p1, p2}, Lcom/flurry/sdk/gx;->a(Lcom/flurry/sdk/gx;)I

    move-result v2

    goto/16 :goto_0

    .line 753
    :cond_a
    new-instance v0, Lcom/flurry/sdk/gx;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/gx;-><init>(Ljava/lang/String;)V

    move-object p1, v0

    goto :goto_4

    .line 754
    :cond_b
    new-instance v0, Lcom/flurry/sdk/gx;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/gx;-><init>(Ljava/lang/String;)V

    move-object p2, v0

    goto :goto_5

    .line 713
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_1
        :pswitch_7
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public a(Lcom/flurry/sdk/fm;)Lcom/flurry/sdk/gd;
    .locals 1

    .prologue
    .line 305
    new-instance v0, Lcom/flurry/sdk/ft;

    invoke-direct {v0, p1, p1, p0}, Lcom/flurry/sdk/ft;-><init>(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fs;)V

    return-object v0
.end method

.method protected a(Ljava/lang/Object;Lcom/flurry/sdk/fm;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 524
    const/4 v0, 0x0

    return-object v0
.end method

.method public a(Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 518
    check-cast p1, Lcom/flurry/sdk/fy;

    invoke-interface {p1, p3}, Lcom/flurry/sdk/fy;->a(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/Object;[BLcom/flurry/sdk/fm;)Ljava/lang/Object;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 860
    invoke-virtual {p0, p1, p3}, Lcom/flurry/sdk/fs;->c(Ljava/lang/Object;Lcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fw;

    .line 861
    invoke-interface {v0}, Lcom/flurry/sdk/fw;->b()[B

    move-result-object v1

    invoke-virtual {p3}, Lcom/flurry/sdk/fm;->l()I

    move-result v2

    invoke-static {p2, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 862
    return-object v0
.end method

.method public a(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 356
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 357
    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 358
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public a(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)V
    .locals 0

    .prologue
    .line 511
    check-cast p1, Lcom/flurry/sdk/fy;

    invoke-interface {p1, p3, p4}, Lcom/flurry/sdk/fy;->a(ILjava/lang/Object;)V

    .line 512
    return-void
.end method

.method protected a(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 528
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)V

    .line 529
    return-void
.end method

.method protected a(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 7

    .prologue
    const/4 v0, 0x0

    .line 362
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs;->d(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 363
    const-string v1, "{"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs;->e(Ljava/lang/Object;)Lcom/flurry/sdk/fm;

    move-result-object v2

    .line 366
    invoke-virtual {v2}, Lcom/flurry/sdk/fm;->b()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm$f;

    .line 367
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, p2}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 368
    const-string v4, ": "

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->b()I

    move-result v0

    invoke-virtual {p0, p1, v4, v0}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 370
    add-int/lit8 v0, v1, 0x1

    invoke-virtual {v2}, Lcom/flurry/sdk/fm;->b()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 371
    const-string v1, ", "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    move v1, v0

    goto :goto_0

    .line 373
    :cond_1
    const-string v0, "}"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    :goto_1
    return-void

    .line 374
    :cond_2
    instance-of v1, p1, Ljava/util/Collection;

    if-eqz v1, :cond_5

    .line 375
    check-cast p1, Ljava/util/Collection;

    .line 376
    const-string v1, "["

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    int-to-long v2, v1

    .line 379
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 380
    invoke-virtual {p0, v1, p2}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 381
    add-int/lit8 v1, v0, 0x1

    int-to-long v5, v0

    cmp-long v0, v5, v2

    if-gez v0, :cond_3

    .line 382
    const-string v0, ", "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    move v0, v1

    goto :goto_2

    .line 384
    :cond_4
    const-string v0, "]"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 385
    :cond_5
    instance-of v1, p1, Ljava/util/Map;

    if-eqz v1, :cond_8

    .line 386
    const-string v1, "{"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    check-cast p1, Ljava/util/Map;

    .line 390
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 391
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3, p2}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 392
    const-string v3, ": "

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 394
    add-int/lit8 v0, v1, 0x1

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    if-ge v0, v1, :cond_6

    .line 395
    const-string v1, ", "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6
    move v1, v0

    goto :goto_3

    .line 397
    :cond_7
    const-string v0, "}"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 398
    :cond_8
    instance-of v0, p1, Ljava/lang/CharSequence;

    if-nez v0, :cond_9

    instance-of v0, p1, Lcom/flurry/sdk/fv;

    if-eqz v0, :cond_a

    .line 400
    :cond_9
    const-string v0, "\""

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/flurry/sdk/fs;->a(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    .line 402
    const-string v0, "\""

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 403
    :cond_a
    instance-of v0, p1, Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_c

    .line 404
    const-string v0, "{\"bytes\": \""

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    check-cast p1, Ljava/nio/ByteBuffer;

    .line 406
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    :goto_4
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    if-ge v0, v1, :cond_b

    .line 407
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    int-to-char v1, v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 406
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 408
    :cond_b
    const-string v0, "\"}"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 410
    :cond_c
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto/16 :goto_1
.end method

.method public b(Ljava/lang/Object;Lcom/flurry/sdk/fm;)I
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 665
    if-nez p1, :cond_1

    .line 691
    :cond_0
    :goto_0
    :pswitch_0
    return v1

    .line 666
    :cond_1
    const/4 v0, 0x1

    .line 667
    sget-object v2, Lcom/flurry/sdk/fs$1;->a:[I

    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v3

    invoke-virtual {v3}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 691
    :pswitch_1
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_0

    .line 669
    :pswitch_2
    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->b()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm$f;

    .line 670
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->f()Lcom/flurry/sdk/fm$f$a;

    move-result-object v3

    sget-object v4, Lcom/flurry/sdk/fm$f$a;->c:Lcom/flurry/sdk/fm$f$a;

    if-eq v3, v4, :cond_2

    .line 672
    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->b()I

    move-result v4

    invoke-virtual {p0, p1, v3, v4}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$f;->c()Lcom/flurry/sdk/fm;

    move-result-object v0

    invoke-virtual {p0, v1, v3, v0}, Lcom/flurry/sdk/fs;->a(ILjava/lang/Object;Lcom/flurry/sdk/fm;)I

    move-result v0

    move v1, v0

    goto :goto_1

    .line 677
    :pswitch_3
    check-cast p1, Ljava/util/Collection;

    .line 678
    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->i()Lcom/flurry/sdk/fm;

    move-result-object v1

    .line 679
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 680
    invoke-virtual {p0, v0, v3, v1}, Lcom/flurry/sdk/fs;->a(ILjava/lang/Object;Lcom/flurry/sdk/fm;)I

    move-result v0

    goto :goto_2

    :cond_3
    move v1, v0

    .line 681
    goto :goto_0

    .line 683
    :pswitch_4
    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->k()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p2, p1}, Lcom/flurry/sdk/fs;->a(Lcom/flurry/sdk/fm;Ljava/lang/Object;)I

    move-result v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/fs;->b(Ljava/lang/Object;Lcom/flurry/sdk/fm;)I

    move-result v1

    goto :goto_0

    .line 685
    :pswitch_5
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/fm;->c(Ljava/lang/String;)I

    move-result v1

    goto :goto_0

    .line 689
    :pswitch_6
    instance-of v0, p1, Lcom/flurry/sdk/gx;

    if-eqz v0, :cond_4

    :goto_3
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto/16 :goto_0

    :cond_4
    new-instance v0, Lcom/flurry/sdk/gx;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/gx;-><init>(Ljava/lang/String;)V

    move-object p1, v0

    goto :goto_3

    .line 667
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_5
        :pswitch_3
        :pswitch_1
        :pswitch_4
        :pswitch_1
        :pswitch_6
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public b(Lcom/flurry/sdk/fm;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 771
    if-nez p2, :cond_1

    move-object p2, v0

    .line 839
    :cond_0
    :goto_0
    :pswitch_0
    return-object p2

    .line 774
    :cond_1
    sget-object v1, Lcom/flurry/sdk/fs$1;->a:[I

    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 842
    new-instance v0, Lcom/flurry/sdk/fk;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Deep copy failed for schema \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" and value \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 776
    :pswitch_1
    check-cast p2, Ljava/util/List;

    .line 777
    new-instance v0, Lcom/flurry/sdk/fs$a;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1, p1}, Lcom/flurry/sdk/fs$a;-><init>(ILcom/flurry/sdk/fm;)V

    .line 779
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 780
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->i()Lcom/flurry/sdk/fm;

    move-result-object v3

    invoke-virtual {p0, v3, v2}, Lcom/flurry/sdk/fs;->b(Lcom/flurry/sdk/fm;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    move-object p2, v0

    .line 782
    goto :goto_0

    .line 784
    :pswitch_2
    new-instance v0, Ljava/lang/Boolean;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Boolean;-><init>(Z)V

    move-object p2, v0

    goto :goto_0

    .line 786
    :pswitch_3
    check-cast p2, Ljava/nio/ByteBuffer;

    .line 787
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    new-array v0, v0, [B

    .line 788
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 789
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 790
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 791
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p2

    goto/16 :goto_0

    .line 793
    :pswitch_4
    new-instance v0, Ljava/lang/Double;

    check-cast p2, Ljava/lang/Double;

    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    move-object p2, v0

    goto/16 :goto_0

    .line 798
    :pswitch_5
    check-cast p2, Lcom/flurry/sdk/fw;

    invoke-interface {p2}, Lcom/flurry/sdk/fw;->b()[B

    move-result-object v1

    invoke-virtual {p0, v0, v1, p1}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;[BLcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object p2

    goto/16 :goto_0

    .line 800
    :pswitch_6
    new-instance v0, Ljava/lang/Float;

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    move-object p2, v0

    goto/16 :goto_0

    .line 802
    :pswitch_7
    new-instance v0, Ljava/lang/Integer;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    move-object p2, v0

    goto/16 :goto_0

    .line 804
    :pswitch_8
    new-instance v0, Ljava/lang/Long;

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    move-object p2, v0

    goto/16 :goto_0

    .line 806
    :pswitch_9
    check-cast p2, Ljava/util/Map;

    .line 807
    new-instance v2, Ljava/util/HashMap;

    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v0

    invoke-direct {v2, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 809
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 810
    sget-object v1, Lcom/flurry/sdk/fs;->b:Lcom/flurry/sdk/fm;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v1, v4}, Lcom/flurry/sdk/fs;->b(Lcom/flurry/sdk/fm;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->j()Lcom/flurry/sdk/fm;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v4, v0}, Lcom/flurry/sdk/fs;->b(Lcom/flurry/sdk/fm;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_3
    move-object p2, v2

    .line 813
    goto/16 :goto_0

    :pswitch_a
    move-object p2, v0

    .line 815
    goto/16 :goto_0

    .line 817
    :pswitch_b
    check-cast p2, Lcom/flurry/sdk/fy;

    .line 818
    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/fs;->d(Ljava/lang/Object;Lcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fy;

    .line 819
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->b()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flurry/sdk/fm$f;

    .line 820
    invoke-virtual {v1}, Lcom/flurry/sdk/fm$f;->b()I

    move-result v3

    invoke-virtual {v1}, Lcom/flurry/sdk/fm$f;->c()Lcom/flurry/sdk/fm;

    move-result-object v4

    invoke-virtual {v1}, Lcom/flurry/sdk/fm$f;->b()I

    move-result v1

    invoke-interface {p2, v1}, Lcom/flurry/sdk/fy;->a(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v4, v1}, Lcom/flurry/sdk/fs;->b(Lcom/flurry/sdk/fm;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Lcom/flurry/sdk/fy;->a(ILjava/lang/Object;)V

    goto :goto_3

    :cond_4
    move-object p2, v0

    .line 823
    goto/16 :goto_0

    .line 826
    :pswitch_c
    instance-of v0, p2, Ljava/lang/String;

    if-nez v0, :cond_0

    .line 832
    instance-of v0, p2, Lcom/flurry/sdk/gx;

    if-eqz v0, :cond_5

    .line 835
    new-instance v0, Lcom/flurry/sdk/gx;

    check-cast p2, Lcom/flurry/sdk/gx;

    invoke-direct {v0, p2}, Lcom/flurry/sdk/gx;-><init>(Lcom/flurry/sdk/gx;)V

    move-object p2, v0

    goto/16 :goto_0

    .line 837
    :cond_5
    new-instance v0, Lcom/flurry/sdk/gx;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/gx;-><init>(Ljava/lang/String;)V

    move-object p2, v0

    goto/16 :goto_0

    .line 839
    :pswitch_d
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->k()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/fs;->a(Lcom/flurry/sdk/fm;Ljava/lang/Object;)I

    move-result v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    invoke-virtual {p0, v0, p2}, Lcom/flurry/sdk/fs;->b(Lcom/flurry/sdk/fm;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    goto/16 :goto_0

    .line 774
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_0
        :pswitch_1
        :pswitch_9
        :pswitch_d
        :pswitch_5
        :pswitch_c
        :pswitch_3
        :pswitch_7
        :pswitch_8
        :pswitch_6
        :pswitch_4
        :pswitch_2
        :pswitch_a
    .end packed-switch
.end method

.method protected b(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 533
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected b(Ljava/lang/Object;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 548
    if-nez p1, :cond_0

    .line 549
    sget-object v0, Lcom/flurry/sdk/fm$v;->n:Lcom/flurry/sdk/fm$v;

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->a()Ljava/lang/String;

    move-result-object v0

    .line 573
    :goto_0
    return-object v0

    .line 550
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs;->d(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 551
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs;->e(Ljava/lang/Object;)Lcom/flurry/sdk/fm;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 552
    :cond_1
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs;->f(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 553
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs;->g(Ljava/lang/Object;)Lcom/flurry/sdk/fm;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 554
    :cond_2
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs;->c(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 555
    sget-object v0, Lcom/flurry/sdk/fm$v;->c:Lcom/flurry/sdk/fm$v;

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->a()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 556
    :cond_3
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs;->h(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 557
    sget-object v0, Lcom/flurry/sdk/fm$v;->d:Lcom/flurry/sdk/fm$v;

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->a()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 558
    :cond_4
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs;->i(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 559
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs;->j(Ljava/lang/Object;)Lcom/flurry/sdk/fm;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 560
    :cond_5
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs;->k(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 561
    sget-object v0, Lcom/flurry/sdk/fm$v;->g:Lcom/flurry/sdk/fm$v;

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->a()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 562
    :cond_6
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs;->l(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 563
    sget-object v0, Lcom/flurry/sdk/fm$v;->h:Lcom/flurry/sdk/fm$v;

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->a()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 564
    :cond_7
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_8

    .line 565
    sget-object v0, Lcom/flurry/sdk/fm$v;->i:Lcom/flurry/sdk/fm$v;

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->a()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 566
    :cond_8
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_9

    .line 567
    sget-object v0, Lcom/flurry/sdk/fm$v;->j:Lcom/flurry/sdk/fm$v;

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->a()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 568
    :cond_9
    instance-of v0, p1, Ljava/lang/Float;

    if-eqz v0, :cond_a

    .line 569
    sget-object v0, Lcom/flurry/sdk/fm$v;->k:Lcom/flurry/sdk/fm$v;

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->a()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 570
    :cond_a
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_b

    .line 571
    sget-object v0, Lcom/flurry/sdk/fm$v;->l:Lcom/flurry/sdk/fm$v;

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->a()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 572
    :cond_b
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_c

    .line 573
    sget-object v0, Lcom/flurry/sdk/fm$v;->m:Lcom/flurry/sdk/fm$v;

    invoke-virtual {v0}, Lcom/flurry/sdk/fm$v;->a()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 574
    :cond_c
    new-instance v0, Lcom/flurry/sdk/fk;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown datum type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public c(Ljava/lang/Object;Lcom/flurry/sdk/fm;)Ljava/lang/Object;
    .locals 2

    .prologue
    .line 851
    instance-of v0, p1, Lcom/flurry/sdk/fw;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/flurry/sdk/fw;

    invoke-interface {v0}, Lcom/flurry/sdk/fw;->b()[B

    move-result-object v0

    array-length v0, v0

    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->l()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 854
    :goto_0
    return-object p1

    :cond_0
    new-instance p1, Lcom/flurry/sdk/fs$c;

    invoke-direct {p1, p2}, Lcom/flurry/sdk/fs$c;-><init>(Lcom/flurry/sdk/fm;)V

    goto :goto_0
.end method

.method protected c(Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 608
    instance-of v0, p1, Ljava/util/Collection;

    return v0
.end method

.method public d(Ljava/lang/Object;Lcom/flurry/sdk/fm;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 874
    instance-of v0, p1, Lcom/flurry/sdk/fy;

    if-eqz v0, :cond_0

    .line 875
    check-cast p1, Lcom/flurry/sdk/fy;

    .line 876
    invoke-interface {p1}, Lcom/flurry/sdk/fy;->a()Lcom/flurry/sdk/fm;

    move-result-object v0

    if-ne v0, p2, :cond_0

    .line 879
    :goto_0
    return-object p1

    :cond_0
    new-instance p1, Lcom/flurry/sdk/fs$d;

    invoke-direct {p1, p2}, Lcom/flurry/sdk/fs$d;-><init>(Lcom/flurry/sdk/fm;)V

    goto :goto_0
.end method

.method protected d(Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 613
    instance-of v0, p1, Lcom/flurry/sdk/fy;

    return v0
.end method

.method protected e(Ljava/lang/Object;)Lcom/flurry/sdk/fm;
    .locals 1

    .prologue
    .line 620
    check-cast p1, Lcom/flurry/sdk/fr;

    invoke-interface {p1}, Lcom/flurry/sdk/fr;->a()Lcom/flurry/sdk/fm;

    move-result-object v0

    return-object v0
.end method

.method protected f(Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 625
    instance-of v0, p1, Lcom/flurry/sdk/fv;

    return v0
.end method

.method protected g(Ljava/lang/Object;)Lcom/flurry/sdk/fm;
    .locals 1

    .prologue
    .line 632
    check-cast p1, Lcom/flurry/sdk/fr;

    invoke-interface {p1}, Lcom/flurry/sdk/fr;->a()Lcom/flurry/sdk/fm;

    move-result-object v0

    return-object v0
.end method

.method protected h(Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 637
    instance-of v0, p1, Ljava/util/Map;

    return v0
.end method

.method protected i(Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 642
    instance-of v0, p1, Lcom/flurry/sdk/fw;

    return v0
.end method

.method protected j(Ljava/lang/Object;)Lcom/flurry/sdk/fm;
    .locals 1

    .prologue
    .line 649
    check-cast p1, Lcom/flurry/sdk/fr;

    invoke-interface {p1}, Lcom/flurry/sdk/fr;->a()Lcom/flurry/sdk/fm;

    move-result-object v0

    return-object v0
.end method

.method protected k(Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 654
    instance-of v0, p1, Ljava/lang/CharSequence;

    return v0
.end method

.method protected l(Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 659
    instance-of v0, p1, Ljava/nio/ByteBuffer;

    return v0
.end method
