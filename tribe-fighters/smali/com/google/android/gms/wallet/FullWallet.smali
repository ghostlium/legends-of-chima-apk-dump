.class public final Lcom/google/android/gms/wallet/FullWallet;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/wallet/FullWallet;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field BN:Ljava/lang/String;

.field BO:Ljava/lang/String;

.field BP:Lcom/google/android/gms/wallet/ProxyCard;

.field BQ:Ljava/lang/String;

.field BR:Lcom/google/android/gms/wallet/Address;

.field BS:Lcom/google/android/gms/wallet/Address;

.field BT:[Ljava/lang/String;

.field private final kZ:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/wallet/d;

    invoke-direct {v0}, Lcom/google/android/gms/wallet/d;-><init>()V

    sput-object v0, Lcom/google/android/gms/wallet/FullWallet;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/wallet/FullWallet;->kZ:I

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Ljava/lang/String;Lcom/google/android/gms/wallet/ProxyCard;Ljava/lang/String;Lcom/google/android/gms/wallet/Address;Lcom/google/android/gms/wallet/Address;[Ljava/lang/String;)V
    .locals 0
    .param p1, "versionCode"    # I
    .param p2, "googleTransactionId"    # Ljava/lang/String;
    .param p3, "merchantTransactionId"    # Ljava/lang/String;
    .param p4, "proxyCard"    # Lcom/google/android/gms/wallet/ProxyCard;
    .param p5, "email"    # Ljava/lang/String;
    .param p6, "billingAddress"    # Lcom/google/android/gms/wallet/Address;
    .param p7, "shippingAddress"    # Lcom/google/android/gms/wallet/Address;
    .param p8, "paymentDescriptions"    # [Ljava/lang/String;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/wallet/FullWallet;->kZ:I

    iput-object p2, p0, Lcom/google/android/gms/wallet/FullWallet;->BN:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/wallet/FullWallet;->BO:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/wallet/FullWallet;->BP:Lcom/google/android/gms/wallet/ProxyCard;

    iput-object p5, p0, Lcom/google/android/gms/wallet/FullWallet;->BQ:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/wallet/FullWallet;->BR:Lcom/google/android/gms/wallet/Address;

    iput-object p7, p0, Lcom/google/android/gms/wallet/FullWallet;->BS:Lcom/google/android/gms/wallet/Address;

    iput-object p8, p0, Lcom/google/android/gms/wallet/FullWallet;->BT:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getBillingAddress()Lcom/google/android/gms/wallet/Address;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/FullWallet;->BR:Lcom/google/android/gms/wallet/Address;

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/FullWallet;->BQ:Ljava/lang/String;

    return-object v0
.end method

.method public getGoogleTransactionId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/FullWallet;->BN:Ljava/lang/String;

    return-object v0
.end method

.method public getMerchantTransactionId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/FullWallet;->BO:Ljava/lang/String;

    return-object v0
.end method

.method public getPaymentDescriptions()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/FullWallet;->BT:[Ljava/lang/String;

    return-object v0
.end method

.method public getProxyCard()Lcom/google/android/gms/wallet/ProxyCard;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/FullWallet;->BP:Lcom/google/android/gms/wallet/ProxyCard;

    return-object v0
.end method

.method public getShippingAddress()Lcom/google/android/gms/wallet/Address;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/FullWallet;->BS:Lcom/google/android/gms/wallet/Address;

    return-object v0
.end method

.method public getVersionCode()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/wallet/FullWallet;->kZ:I

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/wallet/d;->a(Lcom/google/android/gms/wallet/FullWallet;Landroid/os/Parcel;I)V

    return-void
.end method
