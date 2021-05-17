.class public Lnet/minidev/json/JSONStyle;
.super Ljava/lang/Object;
.source "JSONStyle.java"


# static fields
.field public static final FLAG_AGRESSIVE:I = 0x8

.field public static final FLAG_PROTECT_4WEB:I = 0x2

.field public static final FLAG_PROTECT_KEYS:I = 0x1

.field public static final FLAG_PROTECT_VALUES:I = 0x4

.field public static final LT_COMPRESS:Lnet/minidev/json/JSONStyle;

.field public static final MAX_COMPRESS:Lnet/minidev/json/JSONStyle;

.field public static final NO_COMPRESS:Lnet/minidev/json/JSONStyle;


# instance fields
.field private _protect4Web:Z

.field private _protectKeys:Z

.field private _protectValues:Z

.field private esc:Lnet/minidev/json/JStylerObj$StringProtector;

.field private mpKey:Lnet/minidev/json/JStylerObj$MustProtect;

.field private mpValue:Lnet/minidev/json/JStylerObj$MustProtect;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 43
    new-instance v0, Lnet/minidev/json/JSONStyle;

    invoke-direct {v0}, Lnet/minidev/json/JSONStyle;-><init>()V

    sput-object v0, Lnet/minidev/json/JSONStyle;->NO_COMPRESS:Lnet/minidev/json/JSONStyle;

    .line 44
    new-instance v0, Lnet/minidev/json/JSONStyle;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Lnet/minidev/json/JSONStyle;-><init>(I)V

    sput-object v0, Lnet/minidev/json/JSONStyle;->MAX_COMPRESS:Lnet/minidev/json/JSONStyle;

    .line 48
    new-instance v0, Lnet/minidev/json/JSONStyle;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lnet/minidev/json/JSONStyle;-><init>(I)V

    sput-object v0, Lnet/minidev/json/JSONStyle;->LT_COMPRESS:Lnet/minidev/json/JSONStyle;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 87
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lnet/minidev/json/JSONStyle;-><init>(I)V

    .line 88
    return-void
.end method

.method public constructor <init>(I)V
    .locals 4
    .param p1, "FLAG"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    and-int/lit8 v1, p1, 0x1

    if-nez v1, :cond_0

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lnet/minidev/json/JSONStyle;->_protectKeys:Z

    .line 61
    and-int/lit8 v1, p1, 0x4

    if-nez v1, :cond_1

    move v1, v2

    :goto_1
    iput-boolean v1, p0, Lnet/minidev/json/JSONStyle;->_protectValues:Z

    .line 62
    and-int/lit8 v1, p1, 0x2

    if-nez v1, :cond_2

    :goto_2
    iput-boolean v2, p0, Lnet/minidev/json/JSONStyle;->_protect4Web:Z

    .line 65
    and-int/lit8 v1, p1, 0x8

    if-lez v1, :cond_3

    .line 66
    sget-object v0, Lnet/minidev/json/JStylerObj;->MP_AGGRESIVE:Lnet/minidev/json/JStylerObj$MPAgressive;

    .line 70
    .local v0, "mp":Lnet/minidev/json/JStylerObj$MustProtect;
    :goto_3
    iget-boolean v1, p0, Lnet/minidev/json/JSONStyle;->_protectValues:Z

    if-eqz v1, :cond_4

    .line 71
    sget-object v1, Lnet/minidev/json/JStylerObj;->MP_TRUE:Lnet/minidev/json/JStylerObj$MPTrue;

    iput-object v1, p0, Lnet/minidev/json/JSONStyle;->mpValue:Lnet/minidev/json/JStylerObj$MustProtect;

    .line 75
    :goto_4
    iget-boolean v1, p0, Lnet/minidev/json/JSONStyle;->_protectKeys:Z

    if-eqz v1, :cond_5

    .line 76
    sget-object v1, Lnet/minidev/json/JStylerObj;->MP_TRUE:Lnet/minidev/json/JStylerObj$MPTrue;

    iput-object v1, p0, Lnet/minidev/json/JSONStyle;->mpKey:Lnet/minidev/json/JStylerObj$MustProtect;

    .line 80
    :goto_5
    iget-boolean v1, p0, Lnet/minidev/json/JSONStyle;->_protect4Web:Z

    if-eqz v1, :cond_6

    .line 81
    sget-object v1, Lnet/minidev/json/JStylerObj;->ESCAPE4Web:Lnet/minidev/json/JStylerObj$Escape4Web;

    iput-object v1, p0, Lnet/minidev/json/JSONStyle;->esc:Lnet/minidev/json/JStylerObj$StringProtector;

    .line 84
    :goto_6
    return-void

    .end local v0    # "mp":Lnet/minidev/json/JStylerObj$MustProtect;
    :cond_0
    move v1, v3

    .line 60
    goto :goto_0

    :cond_1
    move v1, v3

    .line 61
    goto :goto_1

    :cond_2
    move v2, v3

    .line 62
    goto :goto_2

    .line 68
    :cond_3
    sget-object v0, Lnet/minidev/json/JStylerObj;->MP_SIMPLE:Lnet/minidev/json/JStylerObj$MPSimple;

    .restart local v0    # "mp":Lnet/minidev/json/JStylerObj$MustProtect;
    goto :goto_3

    .line 73
    :cond_4
    iput-object v0, p0, Lnet/minidev/json/JSONStyle;->mpValue:Lnet/minidev/json/JStylerObj$MustProtect;

    goto :goto_4

    .line 78
    :cond_5
    iput-object v0, p0, Lnet/minidev/json/JSONStyle;->mpKey:Lnet/minidev/json/JStylerObj$MustProtect;

    goto :goto_5

    .line 83
    :cond_6
    sget-object v1, Lnet/minidev/json/JStylerObj;->ESCAPE_LT:Lnet/minidev/json/JStylerObj$EscapeLT;

    iput-object v1, p0, Lnet/minidev/json/JSONStyle;->esc:Lnet/minidev/json/JStylerObj$StringProtector;

    goto :goto_6
.end method


# virtual methods
.method public escape(Ljava/lang/String;Ljava/lang/Appendable;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "out"    # Ljava/lang/Appendable;

    .prologue
    .line 115
    iget-object v0, p0, Lnet/minidev/json/JSONStyle;->esc:Lnet/minidev/json/JStylerObj$StringProtector;

    invoke-interface {v0, p1, p2}, Lnet/minidev/json/JStylerObj$StringProtector;->escape(Ljava/lang/String;Ljava/lang/Appendable;)V

    .line 116
    return-void
.end method

.method public indent()Z
    .locals 1

    .prologue
    .line 103
    const/4 v0, 0x0

    return v0
.end method

.method public mustProtectKey(Ljava/lang/String;)Z
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 107
    iget-object v0, p0, Lnet/minidev/json/JSONStyle;->mpKey:Lnet/minidev/json/JStylerObj$MustProtect;

    invoke-interface {v0, p1}, Lnet/minidev/json/JStylerObj$MustProtect;->mustBeProtect(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public mustProtectValue(Ljava/lang/String;)Z
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 111
    iget-object v0, p0, Lnet/minidev/json/JSONStyle;->mpValue:Lnet/minidev/json/JStylerObj$MustProtect;

    invoke-interface {v0, p1}, Lnet/minidev/json/JStylerObj$MustProtect;->mustBeProtect(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public protect4Web()Z
    .locals 1

    .prologue
    .line 99
    iget-boolean v0, p0, Lnet/minidev/json/JSONStyle;->_protect4Web:Z

    return v0
.end method

.method public protectKeys()Z
    .locals 1

    .prologue
    .line 91
    iget-boolean v0, p0, Lnet/minidev/json/JSONStyle;->_protectKeys:Z

    return v0
.end method

.method public protectValues()Z
    .locals 1

    .prologue
    .line 95
    iget-boolean v0, p0, Lnet/minidev/json/JSONStyle;->_protectValues:Z

    return v0
.end method
