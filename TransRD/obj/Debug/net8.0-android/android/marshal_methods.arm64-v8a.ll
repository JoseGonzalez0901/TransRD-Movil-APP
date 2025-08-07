; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [342 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [684 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 252
	i64 40218994123153105, ; 1: ExCSS.dll => 0x8ee2f649ef1ed1 => 174
	i64 98382396393917666, ; 2: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 201
	i64 120698629574877762, ; 3: Mono.Android => 0x1accec39cafe242 => 170
	i64 131669012237370309, ; 4: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 206
	i64 184471870596806994, ; 5: Svg.Skia => 0x28f60305df97952 => 221
	i64 196720943101637631, ; 6: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 57
	i64 210515253464952879, ; 7: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 239
	i64 225432268808147330, ; 8: Microcharts.Maui => 0x320e5743f385182 => 182
	i64 229794953483747371, ; 9: System.ValueTuple.dll => 0x330654aed93802b => 150
	i64 232391251801502327, ; 10: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 280
	i64 291396202933226840, ; 11: Microsoft.Web.Infrastructure.dll => 0x40b3f4d7cbb8d58 => 208
	i64 295915112840604065, ; 12: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 283
	i64 316157742385208084, ; 13: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 246
	i64 350667413455104241, ; 14: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 131
	i64 404665707914610830, ; 15: Svg.Custom => 0x59da9513d08488e => 219
	i64 422779754995088667, ; 16: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 55
	i64 435118502366263740, ; 17: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 282
	i64 444513321921118114, ; 18: Microsoft.EntityFrameworkCore.InMemory => 0x62b3a82db097fa2 => 190
	i64 545109961164950392, ; 19: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 314
	i64 559848537545527438, ; 20: Mapsui.Nts.dll => 0x7c4fb47586c508e => 179
	i64 560278790331054453, ; 21: System.Reflection.Primitives => 0x7c6829760de3975 => 94
	i64 634308326490598313, ; 22: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 265
	i64 649145001856603771, ; 23: System.Security.SecureString => 0x90239f09b62167b => 128
	i64 697337172320443931, ; 24: TransRD => 0x9ad7076acd5de1b => 0
	i64 750875890346172408, ; 25: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 144
	i64 798450721097591769, ; 26: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 240
	i64 799765834175365804, ; 27: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 849051935479314978, ; 28: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 317
	i64 872800313462103108, ; 29: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 251
	i64 895210737996778430, ; 30: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 266
	i64 940822596282819491, ; 31: System.Transactions => 0xd0e792aa81923a3 => 149
	i64 960778385402502048, ; 32: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 103
	i64 1010599046655515943, ; 33: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 94
	i64 1082814315758742004, ; 34: System.Web.Razor.dll => 0xf06ede21881e9f4 => 183
	i64 1120440138749646132, ; 35: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 295
	i64 1121665720830085036, ; 36: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 325
	i64 1268860745194512059, ; 37: System.Drawing.dll => 0x119be62002c19ebb => 35
	i64 1301626418029409250, ; 38: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 27
	i64 1315114680217950157, ; 39: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 235
	i64 1369545283391376210, ; 40: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 273
	i64 1404195534211153682, ; 41: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 49
	i64 1425944114962822056, ; 42: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 114
	i64 1476839205573959279, ; 43: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 69
	i64 1486715745332614827, ; 44: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 203
	i64 1492954217099365037, ; 45: System.Net.HttpListener => 0x14b809f350210aad => 64
	i64 1513467482682125403, ; 46: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 169
	i64 1537168428375924959, ; 47: System.Threading.Thread.dll => 0x15551e8a954ae0df => 144
	i64 1556147632182429976, ; 48: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 323
	i64 1576750169145655260, ; 49: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 294
	i64 1609952734080886819, ; 50: System.Web.WebPages.Razor => 0x1657b37b540f6823 => 186
	i64 1624659445732251991, ; 51: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 234
	i64 1628611045998245443, ; 52: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 269
	i64 1636321030536304333, ; 53: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 259
	i64 1651782184287836205, ; 54: System.Globalization.Calendars => 0x16ec4f2524cb982d => 39
	i64 1659332977923810219, ; 55: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 88
	i64 1682513316613008342, ; 56: System.Net.dll => 0x17597cf276952bd6 => 80
	i64 1735388228521408345, ; 57: System.Net.Mail.dll => 0x181556663c69b759 => 65
	i64 1743969030606105336, ; 58: System.Memory.dll => 0x1833d297e88f2af8 => 61
	i64 1767386781656293639, ; 59: System.Private.Uri.dll => 0x188704e9f5582107 => 85
	i64 1795316252682057001, ; 60: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 233
	i64 1825687700144851180, ; 61: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 105
	i64 1835311033149317475, ; 62: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 313
	i64 1836611346387731153, ; 63: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 280
	i64 1854145951182283680, ; 64: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 101
	i64 1875417405349196092, ; 65: System.Drawing.Primitives => 0x1a06d2319b6c713c => 34
	i64 1875917498431009007, ; 66: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 230
	i64 1881198190668717030, ; 67: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 335
	i64 1897575647115118287, ; 68: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 282
	i64 1920760634179481754, ; 69: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 204
	i64 1930726298510463061, ; 70: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 173
	i64 1959996714666907089, ; 71: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 335
	i64 1972385128188460614, ; 72: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 118
	i64 1981742497975770890, ; 73: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 267
	i64 1983698669889758782, ; 74: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 309
	i64 2019660174692588140, ; 75: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 327
	i64 2040001226662520565, ; 76: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 141
	i64 2062890601515140263, ; 77: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 140
	i64 2064708342624596306, ; 78: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 303
	i64 2080945842184875448, ; 79: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 52
	i64 2102659300918482391, ; 80: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 34
	i64 2106033277907880740, ; 81: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 140
	i64 2108673896768817157, ; 82: NetTopologySuite => 0x1d4383bca40b4805 => 209
	i64 2165310824878145998, ; 83: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 227
	i64 2165725771938924357, ; 84: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 237
	i64 2188974421706709258, ; 85: SkiaSharp.HarfBuzz.dll => 0x1e60cca38c3e990a => 214
	i64 2192948757939169934, ; 86: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 189
	i64 2200176636225660136, ; 87: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 199
	i64 2262844636196693701, ; 88: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 251
	i64 2287834202362508563, ; 89: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 90: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2302323944321350744, ; 91: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 331
	i64 2304837677853103545, ; 92: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 279
	i64 2315304989185124968, ; 93: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 50
	i64 2329709569556905518, ; 94: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 262
	i64 2335503487726329082, ; 95: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 135
	i64 2337758774805907496, ; 96: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 100
	i64 2470498323731680442, ; 97: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 244
	i64 2479423007379663237, ; 98: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 289
	i64 2497223385847772520, ; 99: System.Runtime => 0x22a7eb7046413568 => 115
	i64 2547086958574651984, ; 100: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 228
	i64 2592350477072141967, ; 101: System.Xml.dll => 0x23f9e10627330e8f => 162
	i64 2602673633151553063, ; 102: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 334
	i64 2624866290265602282, ; 103: mscorlib.dll => 0x246d65fbde2db8ea => 165
	i64 2632269733008246987, ; 104: System.Net.NameResolution => 0x2487b36034f808cb => 66
	i64 2656907746661064104, ; 105: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 195
	i64 2661036759164816096, ; 106: System.Web.Razor => 0x24ede6d56c468ae0 => 183
	i64 2662981627730767622, ; 107: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 309
	i64 2706075432581334785, ; 108: System.Net.WebSockets => 0x258de944be6c0701 => 79
	i64 2783046991838674048, ; 109: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 100
	i64 2787234703088983483, ; 110: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 284
	i64 2815524396660695947, ; 111: System.Security.AccessControl => 0x2712c0857f68238b => 116
	i64 2895129759130297543, ; 112: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 314
	i64 2923871038697555247, ; 113: Jsr305Binding => 0x2893ad37e69ec52f => 296
	i64 3017136373564924869, ; 114: System.Net.WebProxy => 0x29df058bd93f63c5 => 77
	i64 3017704767998173186, ; 115: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 295
	i64 3106852385031680087, ; 116: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 113
	i64 3110390492489056344, ; 117: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 120
	i64 3135773902340015556, ; 118: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 47
	i64 3254037935674351285, ; 119: SkiaSharp.Views.Maui.Controls.Compatibility.dll => 0x2d28aa430983deb5 => 217
	i64 3281594302220646930, ; 120: System.Security.Principal => 0x2d8a90a198ceba12 => 127
	i64 3289520064315143713, ; 121: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 260
	i64 3303437397778967116, ; 122: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 231
	i64 3311221304742556517, ; 123: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 81
	i64 3325875462027654285, ; 124: System.Runtime.Numerics => 0x2e27e21c8958b48d => 109
	i64 3328853167529574890, ; 125: System.Net.Sockets.dll => 0x2e327651a008c1ea => 74
	i64 3344514922410554693, ; 126: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 306
	i64 3414639567687375782, ; 127: SkiaSharp.Views.Maui.Controls => 0x2f633c9863ffdba6 => 216
	i64 3429672777697402584, ; 128: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 206
	i64 3437845325506641314, ; 129: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 52
	i64 3461602852075779363, ; 130: SkiaSharp.HarfBuzz => 0x300a15741f74b523 => 214
	i64 3493805808809882663, ; 131: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 286
	i64 3494946837667399002, ; 132: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 193
	i64 3508450208084372758, ; 133: System.Net.Ping => 0x30b084e02d03ad16 => 68
	i64 3522470458906976663, ; 134: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 285
	i64 3523004241079211829, ; 135: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 192
	i64 3531994851595924923, ; 136: System.Numerics => 0x31042a9aade235bb => 82
	i64 3534913438787245389, ; 137: Microsoft.Web.Infrastructure => 0x310e890b36ab154d => 208
	i64 3551103847008531295, ; 138: System.Private.CoreLib.dll => 0x31480e226177735f => 171
	i64 3567343442040498961, ; 139: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 329
	i64 3571415421602489686, ; 140: System.Runtime.dll => 0x319037675df7e556 => 115
	i64 3613036455761131359, ; 141: System.Web.WebPages.Deployment => 0x322415838a2db75f => 185
	i64 3638003163729360188, ; 142: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 194
	i64 3647754201059316852, ; 143: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 155
	i64 3655542548057982301, ; 144: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 193
	i64 3658489898830683555, ; 145: Svg.Skia.dll => 0x32c5912df2285da3 => 221
	i64 3659371656528649588, ; 146: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 225
	i64 3696698938527704835, ; 147: Mapsui.Rendering.Skia.dll => 0x334d50194081e703 => 180
	i64 3716579019761409177, ; 148: netstandard.dll => 0x3393f0ed5c8c5c99 => 166
	i64 3727469159507183293, ; 149: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 278
	i64 3772598417116884899, ; 150: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 252
	i64 3869221888984012293, ; 151: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 197
	i64 3869649043256705283, ; 152: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 31
	i64 3890352374528606784, ; 153: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 204
	i64 3919223565570527920, ; 154: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 121
	i64 3933965368022646939, ; 155: System.Net.Requests => 0x369840a8bfadc09b => 71
	i64 3966267475168208030, ; 156: System.Memory => 0x370b03412596249e => 61
	i64 4006972109285359177, ; 157: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 160
	i64 4009997192427317104, ; 158: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 112
	i64 4073500526318903918, ; 159: System.Private.Xml.dll => 0x3887fb25779ae26e => 87
	i64 4073631083018132676, ; 160: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 202
	i64 4120493066591692148, ; 161: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 340
	i64 4148881117810174540, ; 162: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 104
	i64 4154383907710350974, ; 163: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 164: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 145
	i64 4168469861834746866, ; 165: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 117
	i64 4187479170553454871, ; 166: System.Linq.Expressions => 0x3a1cea1e912fa117 => 57
	i64 4201423742386704971, ; 167: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 246
	i64 4205801962323029395, ; 168: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4235503420553921860, ; 169: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 51
	i64 4282138915307457788, ; 170: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 91
	i64 4356591372459378815, ; 171: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 337
	i64 4373617458794931033, ; 172: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 54
	i64 4397634830160618470, ; 173: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 128
	i64 4477672992252076438, ; 174: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 151
	i64 4484706122338676047, ; 175: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 40
	i64 4533124835995628778, ; 176: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 91
	i64 4612482779465751747, ; 177: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 189
	i64 4636684751163556186, ; 178: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 290
	i64 4672453897036726049, ; 179: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 49
	i64 4679594760078841447, ; 180: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 307
	i64 4716677666592453464, ; 181: System.Xml.XmlSerializer => 0x417501590542f358 => 161
	i64 4743821336939966868, ; 182: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 183: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 264
	i64 4794310189461587505, ; 184: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 228
	i64 4795410492532947900, ; 185: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 285
	i64 4809057822547766521, ; 186: System.Drawing => 0x42bd349c3145ecf9 => 35
	i64 4814660307502931973, ; 187: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 66
	i64 4853321196694829351, ; 188: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 108
	i64 5021733859154519675, ; 189: System.Web.Helpers.dll => 0x45b0c856af74e67b => 184
	i64 5040854987801998111, ; 190: Mapsui.Tiling => 0x45f4b6e76031b31f => 181
	i64 5055365687667823624, ; 191: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 229
	i64 5081566143765835342, ; 192: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 98
	i64 5099468265966638712, ; 193: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 98
	i64 5103417709280584325, ; 194: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5182934613077526976, ; 195: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 196: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 271
	i64 5244375036463807528, ; 197: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 198: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 127
	i64 5278787618751394462, ; 199: System.Net.WebClient.dll => 0x4942055efc68329e => 75
	i64 5280980186044710147, ; 200: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 263
	i64 5290786973231294105, ; 201: System.Runtime.Loader => 0x496ca6b869b72699 => 108
	i64 5306356071055648198, ; 202: Svg.Model.dll => 0x49a3f6bb7b0265c6 => 220
	i64 5376510917114486089, ; 203: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 289
	i64 5408338804355907810, ; 204: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 287
	i64 5423376490970181369, ; 205: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 105
	i64 5440320908473006344, ; 206: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 207: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 208: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 242
	i64 5457765010617926378, ; 209: System.Xml.Serialization => 0x4bbde05c557002ea => 156
	i64 5471532531798518949, ; 210: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 333
	i64 5507995362134886206, ; 211: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 212: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 336
	i64 5527431512186326818, ; 213: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 48
	i64 5570799893513421663, ; 214: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 42
	i64 5573260873512690141, ; 215: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 125
	i64 5574231584441077149, ; 216: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 232
	i64 5591791169662171124, ; 217: System.Linq.Parallel => 0x4d9a087135e137f4 => 58
	i64 5650097808083101034, ; 218: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 118
	i64 5692067934154308417, ; 219: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 292
	i64 5724799082821825042, ; 220: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 255
	i64 5757522595884336624, ; 221: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 241
	i64 5783556987928984683, ; 222: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5896680224035167651, ; 223: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 261
	i64 5959344983920014087, ; 224: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 281
	i64 5979151488806146654, ; 225: System.Formats.Asn1 => 0x52fa3699a489d25e => 37
	i64 5984759512290286505, ; 226: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 123
	i64 6068057819846744445, ; 227: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 330
	i64 6102788177522843259, ; 228: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 281
	i64 6200764641006662125, ; 229: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 330
	i64 6222399776351216807, ; 230: System.Text.Json.dll => 0x565a67a0ffe264a7 => 136
	i64 6251069312384999852, ; 231: System.Transactions.Local => 0x56c0426b870da1ac => 148
	i64 6278736998281604212, ; 232: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 84
	i64 6284145129771520194, ; 233: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 89
	i64 6319713645133255417, ; 234: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 265
	i64 6354612700029906737, ; 235: ShimSkiaSharp.dll => 0x58301e951e77ef31 => 212
	i64 6357457916754632952, ; 236: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 341
	i64 6363787360044722189, ; 237: ShimSkiaSharp => 0x5850b6e31d96280d => 212
	i64 6401687960814735282, ; 238: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 262
	i64 6478287442656530074, ; 239: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 318
	i64 6504860066809920875, ; 240: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 237
	i64 6548213210057960872, ; 241: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 248
	i64 6557084851308642443, ; 242: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 293
	i64 6560151584539558821, ; 243: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 200
	i64 6578679687502081502, ; 244: System.Web.WebPages.Deployment.dll => 0x5b4c2a5208a3adde => 185
	i64 6589202984700901502, ; 245: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 298
	i64 6591971792923354531, ; 246: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 263
	i64 6617685658146568858, ; 247: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 132
	i64 6671798237668743565, ; 248: SkiaSharp => 0x5c96fd260152998d => 213
	i64 6713440830605852118, ; 249: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 95
	i64 6739853162153639747, ; 250: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 251: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 326
	i64 6772837112740759457, ; 252: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 104
	i64 6777482997383978746, ; 253: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 329
	i64 6786606130239981554, ; 254: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 32
	i64 6798329586179154312, ; 255: System.Windows => 0x5e5884bd523ca188 => 153
	i64 6814185388980153342, ; 256: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 157
	i64 6871200191326838356, ; 257: System.Web.WebPages => 0x5f5b682b38a1de54 => 187
	i64 6876862101832370452, ; 258: System.Xml.Linq => 0x5f6f85a57d108914 => 154
	i64 6894844156784520562, ; 259: System.Numerics.Vectors => 0x5faf683aead1ad72 => 81
	i64 7011053663211085209, ; 260: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 257
	i64 7060896174307865760, ; 261: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 142
	i64 7083547580668757502, ; 262: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 86
	i64 7101497697220435230, ; 263: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 264: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 258
	i64 7112547816752919026, ; 265: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 50
	i64 7192745174564810625, ; 266: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 227
	i64 7220009545223068405, ; 267: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 333
	i64 7270811800166795866, ; 268: System.Linq => 0x64e71ccf51a90a5a => 60
	i64 7299370801165188114, ; 269: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 53
	i64 7314237870106916923, ; 270: SkiaSharp.Views.Maui.Core.dll => 0x65816497226eb83b => 218
	i64 7316205155833392065, ; 271: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7338192458477945005, ; 272: System.Reflection => 0x65d67f295d0740ad => 96
	i64 7349431895026339542, ; 273: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 226
	i64 7377312882064240630, ; 274: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7488575175965059935, ; 275: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 154
	i64 7489048572193775167, ; 276: System.ObjectModel => 0x67ee71ff6b419e3f => 83
	i64 7592577537120840276, ; 277: System.Diagnostics.Process => 0x695e410af5b2aa54 => 28
	i64 7637303409920963731, ; 278: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 44
	i64 7654504624184590948, ; 279: System.Net.Http => 0x6a3a4366801b8264 => 63
	i64 7694700312542370399, ; 280: System.Net.Mail => 0x6ac9112a7e2cda5f => 65
	i64 7708790323521193081, ; 281: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 324
	i64 7714652370974252055, ; 282: System.Private.CoreLib => 0x6b0ff375198b9c17 => 171
	i64 7723873813026311384, ; 283: SkiaSharp.Views.Maui.Controls.dll => 0x6b30b64f63600cd8 => 216
	i64 7725404731275645577, ; 284: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 266
	i64 7735176074855944702, ; 285: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 286: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 301
	i64 7791074099216502080, ; 287: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 46
	i64 7792632648484821929, ; 288: Topten.RichTextKit.dll => 0x6c24fe1b4e0c9ba9 => 223
	i64 7820441508502274321, ; 289: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 290: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 234
	i64 7927939710195668715, ; 291: SkiaSharp.Views.Android.dll => 0x6e05b32992ed16eb => 215
	i64 7972383140441761405, ; 292: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 191
	i64 8025517457475554965, ; 293: WindowsBase => 0x6f605d9b4786ce95 => 164
	i64 8031450141206250471, ; 294: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 107
	i64 8064050204834738623, ; 295: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 296: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 260
	i64 8085230611270010360, ; 297: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 62
	i64 8087206902342787202, ; 298: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 222
	i64 8103644804370223335, ; 299: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 300: System.Reflection.Extensions => 0x70995ab73cf916ec => 92
	i64 8167236081217502503, ; 301: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 167
	i64 8185542183669246576, ; 302: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 303: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 305
	i64 8246048515196606205, ; 304: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 207
	i64 8264926008854159966, ; 305: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 28
	i64 8290740647658429042, ; 306: System.Runtime.Extensions => 0x730ea0b15c929a72 => 102
	i64 8318905602908530212, ; 307: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8357409459873968396, ; 308: Mapsui.Nts => 0x73fb7b9fd246f10c => 179
	i64 8368701292315763008, ; 309: System.Security.Cryptography => 0x7423997c6fd56140 => 125
	i64 8398329775253868912, ; 310: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 243
	i64 8400357532724379117, ; 311: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 275
	i64 8410671156615598628, ; 312: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 90
	i64 8426919725312979251, ; 313: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 264
	i64 8518412311883997971, ; 314: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8563666267364444763, ; 315: System.Private.Uri => 0x76d841191140ca5b => 85
	i64 8598790081731763592, ; 316: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 254
	i64 8601935802264776013, ; 317: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 287
	i64 8614108721271900878, ; 318: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 328
	i64 8623059219396073920, ; 319: System.Net.Quic.dll => 0x77ab42ac514299c0 => 70
	i64 8626175481042262068, ; 320: Java.Interop => 0x77b654e585b55834 => 167
	i64 8638972117149407195, ; 321: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 322: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 274
	i64 8645670454055795788, ; 323: Microsoft.EntityFrameworkCore.InMemory.dll => 0x77fb9778a315fc4c => 190
	i64 8648495978913578441, ; 324: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8677882282824630478, ; 325: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 328
	i64 8684531736582871431, ; 326: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 43
	i64 8725526185868997716, ; 327: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 222
	i64 8834232125107082525, ; 328: ExCSS => 0x7a997f4fe05a151d => 174
	i64 8853378295825400934, ; 329: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 302
	i64 8941376889969657626, ; 330: System.Xml.XDocument => 0x7c1626e87187471a => 157
	i64 8951477988056063522, ; 331: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 277
	i64 8954753533646919997, ; 332: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 111
	i64 9018325420426354176, ; 333: Topten.RichTextKit => 0x7d27873051635e00 => 223
	i64 9045785047181495996, ; 334: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 338
	i64 9111603110219107042, ; 335: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 192
	i64 9119672718617465806, ; 336: Mapsui.Rendering.Skia => 0x7e8f9604fd03d3ce => 180
	i64 9138683372487561558, ; 337: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 120
	i64 9248940107580716988, ; 338: Svg.Custom.dll => 0x805ad6065d3637bc => 219
	i64 9250544137016314866, ; 339: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 188
	i64 9312692141327339315, ; 340: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 292
	i64 9324707631942237306, ; 341: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 233
	i64 9324884822702401407, ; 342: NetTopologySuite.IO.GeoJSON4STJ.dll => 0x8168a557449ba77f => 211
	i64 9468215723722196442, ; 343: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 158
	i64 9554839972845591462, ; 344: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 130
	i64 9575902398040817096, ; 345: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 297
	i64 9584643793929893533, ; 346: System.IO.dll => 0x85037ebfbbd7f69d => 56
	i64 9659729154652888475, ; 347: System.Text.RegularExpressions => 0x860e407c9991dd9b => 137
	i64 9662334977499516867, ; 348: System.Numerics.dll => 0x8617827802b0cfc3 => 82
	i64 9667360217193089419, ; 349: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 29
	i64 9678050649315576968, ; 350: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 244
	i64 9702891218465930390, ; 351: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9780093022148426479, ; 352: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 294
	i64 9808709177481450983, ; 353: Mono.Android.dll => 0x881f890734e555e7 => 170
	i64 9825649861376906464, ; 354: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 241
	i64 9834056768316610435, ; 355: System.Transactions.dll => 0x8879968718899783 => 149
	i64 9836529246295212050, ; 356: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 93
	i64 9907349773706910547, ; 357: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 254
	i64 9933555792566666578, ; 358: System.Linq.Queryable.dll => 0x89db145cf475c552 => 59
	i64 9956195530459977388, ; 359: Microsoft.Maui => 0x8a2b8315b36616ac => 205
	i64 9974604633896246661, ; 360: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 156
	i64 9991543690424095600, ; 361: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 313
	i64 10017511394021241210, ; 362: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 199
	i64 10038780035334861115, ; 363: System.Net.Http.dll => 0x8b50e941206af13b => 63
	i64 10051358222726253779, ; 364: System.Private.Xml => 0x8b7d990c97ccccd3 => 87
	i64 10077284195238799794, ; 365: BruTile.dll => 0x8bd9b49575dde9b2 => 172
	i64 10078727084704864206, ; 366: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 78
	i64 10089571585547156312, ; 367: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 46
	i64 10092835686693276772, ; 368: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 203
	i64 10105485790837105934, ; 369: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 142
	i64 10143853363526200146, ; 370: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 310
	i64 10226222362177979215, ; 371: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 303
	i64 10229024438826829339, ; 372: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 248
	i64 10236703004850800690, ; 373: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 73
	i64 10245369515835430794, ; 374: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 90
	i64 10321854143672141184, ; 375: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 300
	i64 10360651442923773544, ; 376: System.Text.Encoding => 0x8fc86d98211c1e68 => 134
	i64 10364469296367737616, ; 377: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 89
	i64 10376576884623852283, ; 378: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 286
	i64 10406448008575299332, ; 379: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 306
	i64 10430153318873392755, ; 380: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 245
	i64 10477170333765956741, ; 381: System.Web.Helpers => 0x916662e87b617485 => 184
	i64 10506226065143327199, ; 382: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 308
	i64 10546663366131771576, ; 383: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 111
	i64 10566960649245365243, ; 384: System.Globalization.dll => 0x92a562b96dcd13fb => 41
	i64 10595762989148858956, ; 385: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 158
	i64 10670374202010151210, ; 386: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 387: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 102
	i64 10785150219063592792, ; 388: System.Net.Primitives => 0x95ac8cfb68830758 => 69
	i64 10822644899632537592, ; 389: System.Linq.Queryable => 0x9631c23204ca5ff8 => 59
	i64 10830817578243619689, ; 390: System.Formats.Tar => 0x964ecb340a447b69 => 38
	i64 10847732767863316357, ; 391: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 235
	i64 10899834349646441345, ; 392: System.Web => 0x9743fd975946eb81 => 152
	i64 10943875058216066601, ; 393: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 55
	i64 10964653383833615866, ; 394: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 33
	i64 11002576679268595294, ; 395: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 198
	i64 11009005086950030778, ; 396: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 205
	i64 11019817191295005410, ; 397: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 232
	i64 11023048688141570732, ; 398: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 399: System.Xml => 0x992e31d0412bf7fc => 162
	i64 11071824625609515081, ; 400: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 298
	i64 11103970607964515343, ; 401: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 319
	i64 11136029745144976707, ; 402: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 296
	i64 11162124722117608902, ; 403: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 291
	i64 11188319605227840848, ; 404: System.Threading.Overlapped => 0x9b44e5671724e550 => 139
	i64 11216600183782743182, ; 405: Svg.Model => 0x9ba95e7065f39c8e => 220
	i64 11220793807500858938, ; 406: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 322
	i64 11226290749488709958, ; 407: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 200
	i64 11235648312900863002, ; 408: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 88
	i64 11329751333533450475, ; 409: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 146
	i64 11340910727871153756, ; 410: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 247
	i64 11347436699239206956, ; 411: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 161
	i64 11392833485892708388, ; 412: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 276
	i64 11428185064259490994, ; 413: Mapsui.UI.Maui.dll => 0x9e9911c44e9c94b2 => 178
	i64 11432101114902388181, ; 414: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 415: Mono.Android.Export => 0x9edabf8623efc131 => 168
	i64 11448276831755070604, ; 416: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 30
	i64 11478254788954680069, ; 417: NetTopologySuite.Features => 0x9f4af3ea8911eb05 => 210
	i64 11481869442598199266, ; 418: Microcharts.Maui.dll => 0x9f57cb6cab7a5fe2 => 182
	i64 11485890710487134646, ; 419: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 106
	i64 11508496261504176197, ; 420: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 257
	i64 11518296021396496455, ; 421: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 320
	i64 11529969570048099689, ; 422: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 291
	i64 11530571088791430846, ; 423: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 197
	i64 11580057168383206117, ; 424: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 230
	i64 11591352189662810718, ; 425: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 284
	i64 11597940890313164233, ; 426: netstandard => 0xa0f429ca8d1805c9 => 166
	i64 11654170636109853844, ; 427: System.Web.WebPages.Razor.dll => 0xa1bbee72751db494 => 186
	i64 11672361001936329215, ; 428: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 258
	i64 11692977985522001935, ; 429: System.Threading.Overlapped.dll => 0xa245cd869980680f => 139
	i64 11705530742807338875, ; 430: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 316
	i64 11707554492040141440, ; 431: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 58
	i64 11743665907891708234, ; 432: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 143
	i64 11991047634523762324, ; 433: System.Net => 0xa668c24ad493ae94 => 80
	i64 12040886584167504988, ; 434: System.Net.ServicePoint => 0xa719d28d8e121c5c => 73
	i64 12063623837170009990, ; 435: System.Security => 0xa76a99f6ce740786 => 129
	i64 12096697103934194533, ; 436: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 437: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 438: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 92
	i64 12137774235383566651, ; 439: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 288
	i64 12145679461940342714, ; 440: System.Text.Json => 0xa88e1f1ebcb62fba => 136
	i64 12191646537372739477, ; 441: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 224
	i64 12201331334810686224, ; 442: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 112
	i64 12247834191021032507, ; 443: NetTopologySuite.Features.dll => 0xa9f90c4e0fb1443b => 210
	i64 12269460666702402136, ; 444: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12332222936682028543, ; 445: System.Runtime.Handles => 0xab24db6c07db5dff => 103
	i64 12375446203996702057, ; 446: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12451044538927396471, ; 447: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 256
	i64 12466513435562512481, ; 448: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 270
	i64 12475113361194491050, ; 449: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 341
	i64 12487638416075308985, ; 450: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 250
	i64 12517810545449516888, ; 451: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 32
	i64 12538491095302438457, ; 452: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 238
	i64 12550732019250633519, ; 453: System.IO.Compression => 0xae2d28465e8e1b2f => 45
	i64 12681088699309157496, ; 454: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 321
	i64 12699999919562409296, ; 455: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 29
	i64 12700543734426720211, ; 456: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 239
	i64 12708238894395270091, ; 457: System.IO => 0xb05cbbf17d3ba3cb => 56
	i64 12708922737231849740, ; 458: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 133
	i64 12717050818822477433, ; 459: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 113
	i64 12753841065332862057, ; 460: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 293
	i64 12823819093633476069, ; 461: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 334
	i64 12828192437253469131, ; 462: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 304
	i64 12835242264250840079, ; 463: System.IO.Pipes => 0xb21ff0d5d6c0740f => 54
	i64 12843321153144804894, ; 464: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 201
	i64 12843770487262409629, ; 465: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 466: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 76
	i64 12982280885948128408, ; 467: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 249
	i64 13068258254871114833, ; 468: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 110
	i64 13106026140046202731, ; 469: HarfBuzzSharp.dll => 0xb5e1f555ee70176b => 176
	i64 13129914918964716986, ; 470: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 253
	i64 13173818576982874404, ; 471: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 101
	i64 13221551921002590604, ; 472: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 308
	i64 13222659110913276082, ; 473: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 322
	i64 13343850469010654401, ; 474: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 169
	i64 13370592475155966277, ; 475: System.Runtime.Serialization => 0xb98de304062ea945 => 114
	i64 13381594904270902445, ; 476: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 316
	i64 13401370062847626945, ; 477: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 288
	i64 13404347523447273790, ; 478: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 243
	i64 13431476299110033919, ; 479: System.Net.WebClient => 0xba663087f18829ff => 75
	i64 13454009404024712428, ; 480: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 299
	i64 13463706743370286408, ; 481: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 84
	i64 13465488254036897740, ; 482: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 301
	i64 13467053111158216594, ; 483: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 336
	i64 13491513212026656886, ; 484: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 236
	i64 13540124433173649601, ; 485: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 337
	i64 13545416393490209236, ; 486: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 320
	i64 13572454107664307259, ; 487: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 278
	i64 13578472628727169633, ; 488: System.Xml.XPath => 0xbc706ce9fba5c261 => 159
	i64 13580399111273692417, ; 489: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 490: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 249
	i64 13646648927693774012, ; 491: BruTile => 0xbd62a2e58da71cbc => 172
	i64 13647894001087880694, ; 492: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 493: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 229
	i64 13702626353344114072, ; 494: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 31
	i64 13710614125866346983, ; 495: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 116
	i64 13713329104121190199, ; 496: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 36
	i64 13717397318615465333, ; 497: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13755568601956062840, ; 498: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 315
	i64 13768883594457632599, ; 499: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 51
	i64 13814445057219246765, ; 500: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 318
	i64 13828521679616088467, ; 501: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 302
	i64 13881769479078963060, ; 502: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13911222732217019342, ; 503: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 122
	i64 13928444506500929300, ; 504: System.Windows.dll => 0xc14bc67b8bba9714 => 153
	i64 13929311175625981361, ; 505: Mapsui.UI.Maui => 0xc14edab6ad10bdb1 => 178
	i64 13959074834287824816, ; 506: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 256
	i64 14075334701871371868, ; 507: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 130
	i64 14100563506285742564, ; 508: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 310
	i64 14124974489674258913, ; 509: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 238
	i64 14125464355221830302, ; 510: System.Threading.dll => 0xc407bafdbc707a9e => 147
	i64 14133832980772275001, ; 511: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 188
	i64 14178052285788134900, ; 512: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 225
	i64 14212104595480609394, ; 513: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 119
	i64 14220608275227875801, ; 514: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 27
	i64 14226382999226559092, ; 515: System.ServiceProcess => 0xc56e43f6938e2a74 => 131
	i64 14232023429000439693, ; 516: System.Resources.Writer.dll => 0xc5824de7789ba78d => 99
	i64 14254574811015963973, ; 517: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 133
	i64 14261073672896646636, ; 518: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 276
	i64 14298246716367104064, ; 519: System.Web.dll => 0xc66d93a217f4e840 => 152
	i64 14327695147300244862, ; 520: System.Reflection.dll => 0xc6d632d338eb4d7e => 96
	i64 14327709162229390963, ; 521: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 124
	i64 14331727281556788554, ; 522: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 226
	i64 14346402571976470310, ; 523: System.Net.Ping.dll => 0xc718a920f3686f26 => 68
	i64 14461014870687870182, ; 524: System.Net.Requests.dll => 0xc8afd8683afdece6 => 71
	i64 14464374589798375073, ; 525: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 331
	i64 14486659737292545672, ; 526: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 261
	i64 14495724990987328804, ; 527: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 279
	i64 14522721392235705434, ; 528: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 312
	i64 14551742072151931844, ; 529: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 135
	i64 14552901170081803662, ; 530: SkiaSharp.Views.Maui.Core => 0xc9f64a827617ad8e => 218
	i64 14561513370130550166, ; 531: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 123
	i64 14574160591280636898, ; 532: System.Net.Quic => 0xca41d1d72ec783e2 => 70
	i64 14622043554576106986, ; 533: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 110
	i64 14641944974530824122, ; 534: Mapsui => 0xcb32a360c3b9c7ba => 177
	i64 14644440854989303794, ; 535: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 271
	i64 14669215534098758659, ; 536: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 195
	i64 14690985099581930927, ; 537: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 151
	i64 14705122255218365489, ; 538: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 323
	i64 14744092281598614090, ; 539: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 339
	i64 14792063746108907174, ; 540: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 299
	i64 14832630590065248058, ; 541: System.Security.Claims => 0xcdd816ef5d6e873a => 117
	i64 14852515768018889994, ; 542: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 247
	i64 14889905118082851278, ; 543: GoogleGson.dll => 0xcea391d0969961ce => 175
	i64 14892012299694389861, ; 544: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 340
	i64 14904040806490515477, ; 545: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 307
	i64 14912225920358050525, ; 546: System.Security.Principal.Windows => 0xcef2de7759506add => 126
	i64 14931407803744742450, ; 547: HarfBuzzSharp => 0xcf3704499ab36c32 => 176
	i64 14935719434541007538, ; 548: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 132
	i64 14954917835170835695, ; 549: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 196
	i64 14984936317414011727, ; 550: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 76
	i64 14987728460634540364, ; 551: System.IO.Compression.dll => 0xcfff1ba06622494c => 45
	i64 14988210264188246988, ; 552: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 250
	i64 15015154896917945444, ; 553: System.Net.Security.dll => 0xd0608bd33642dc64 => 72
	i64 15024878362326791334, ; 554: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 62
	i64 15071021337266399595, ; 555: System.Resources.Reader.dll => 0xd127060e7a18a96b => 97
	i64 15076659072870671916, ; 556: System.ObjectModel.dll => 0xd13b0d8c1620662c => 83
	i64 15111608613780139878, ; 557: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 324
	i64 15115185479366240210, ; 558: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 42
	i64 15133485256822086103, ; 559: System.Linq.dll => 0xd204f0a9127dd9d7 => 60
	i64 15150743910298169673, ; 560: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 277
	i64 15227001540531775957, ; 561: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 194
	i64 15234786388537674379, ; 562: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 36
	i64 15250465174479574862, ; 563: System.Globalization.Calendars.dll => 0xd3a489469852174e => 39
	i64 15272359115529052076, ; 564: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 240
	i64 15279429628684179188, ; 565: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 305
	i64 15299439993936780255, ; 566: System.Xml.XPath.dll => 0xd452879d55019bdf => 159
	i64 15338463749992804988, ; 567: System.Resources.Reader => 0xd4dd2b839286f27c => 97
	i64 15370334346939861994, ; 568: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 245
	i64 15391712275433856905, ; 569: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 196
	i64 15490797300032259768, ; 570: System.Web.WebPages.dll => 0xd6fa5e121400c6b8 => 187
	i64 15526743539506359484, ; 571: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 134
	i64 15527772828719725935, ; 572: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 573: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 64
	i64 15536481058354060254, ; 574: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 311
	i64 15541854775306130054, ; 575: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 124
	i64 15557562860424774966, ; 576: System.Net.Sockets => 0xd7e790fe7a6dc536 => 74
	i64 15582737692548360875, ; 577: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 269
	i64 15609085926864131306, ; 578: System.dll => 0xd89e9cf3334914ea => 163
	i64 15661133872274321916, ; 579: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 155
	i64 15664356999916475676, ; 580: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 311
	i64 15710114879900314733, ; 581: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15743187114543869802, ; 582: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 319
	i64 15755368083429170162, ; 583: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 48
	i64 15777549416145007739, ; 584: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 283
	i64 15783653065526199428, ; 585: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 312
	i64 15817206913877585035, ; 586: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 143
	i64 15847085070278954535, ; 587: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 138
	i64 15885744048853936810, ; 588: System.Resources.Writer => 0xdc75800bd0b6eaaa => 99
	i64 15928521404965645318, ; 589: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 202
	i64 15934062614519587357, ; 590: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 122
	i64 15937190497610202713, ; 591: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 119
	i64 15963349826457351533, ; 592: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 141
	i64 15971679995444160383, ; 593: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 38
	i64 16018552496348375205, ; 594: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 67
	i64 16054465462676478687, ; 595: System.Globalization.Extensions => 0xdecceb47319bdadf => 40
	i64 16154507427712707110, ; 596: System => 0xe03056ea4e39aa26 => 163
	i64 16219561732052121626, ; 597: System.Net.Security => 0xe1177575db7c781a => 72
	i64 16288847719894691167, ; 598: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 325
	i64 16315482530584035869, ; 599: WindowsBase.dll => 0xe26c3ceb1e8d821d => 164
	i64 16321164108206115771, ; 600: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 198
	i64 16324796876805858114, ; 601: SkiaSharp.dll => 0xe28d5444586b6342 => 213
	i64 16337011941688632206, ; 602: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 126
	i64 16361933716545543812, ; 603: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 255
	i64 16423015068819898779, ; 604: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 304
	i64 16454459195343277943, ; 605: System.Net.NetworkInformation => 0xe459fb756d988f77 => 67
	i64 16496768397145114574, ; 606: Mono.Android.Export.dll => 0xe4f04b741db987ce => 168
	i64 16589693266713801121, ; 607: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 268
	i64 16621146507174665210, ; 608: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 242
	i64 16648892297579399389, ; 609: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 173
	i64 16649148416072044166, ; 610: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 207
	i64 16677317093839702854, ; 611: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 275
	i64 16702652415771857902, ; 612: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 150
	i64 16709499819875633724, ; 613: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 44
	i64 16737807731308835127, ; 614: System.Runtime.Intrinsics => 0xe848a3736f733137 => 107
	i64 16758309481308491337, ; 615: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 47
	i64 16762783179241323229, ; 616: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 95
	i64 16765015072123548030, ; 617: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 30
	i64 16784503143832536112, ; 618: TransRD.dll => 0xe8ee88ae6390c430 => 0
	i64 16822611501064131242, ; 619: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 620: mscorlib => 0xe99c30c1484d7f4f => 165
	i64 16856067890322379635, ; 621: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16890310621557459193, ; 622: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 137
	i64 16933958494752847024, ; 623: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 77
	i64 16942731696432749159, ; 624: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 332
	i64 16977952268158210142, ; 625: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 53
	i64 16989020923549080504, ; 626: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 268
	i64 16998075588627545693, ; 627: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 273
	i64 17008137082415910100, ; 628: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17024911836938395553, ; 629: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 231
	i64 17031351772568316411, ; 630: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 272
	i64 17037200463775726619, ; 631: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 259
	i64 17062143951396181894, ; 632: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17084484735261948889, ; 633: NetTopologySuite.IO.GeoJSON4STJ => 0xed18485967df3bd9 => 211
	i64 17089008752050867324, ; 634: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 339
	i64 17118171214553292978, ; 635: System.Threading.Channels => 0xed8ff6060fc420b2 => 138
	i64 17187273293601214786, ; 636: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 637: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 638: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 121
	i64 17230721278011714856, ; 639: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 86
	i64 17234219099804750107, ; 640: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 148
	i64 17260702271250283638, ; 641: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17333249706306540043, ; 642: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 33
	i64 17338386382517543202, ; 643: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 78
	i64 17342750010158924305, ; 644: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 317
	i64 17360349973592121190, ; 645: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 297
	i64 17438153253682247751, ; 646: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 332
	i64 17452310354824359952, ; 647: Mapsui.Tiling.dll => 0xf2330fcd292d7010 => 181
	i64 17470386307322966175, ; 648: System.Threading.Timer => 0xf27347c8d0d5709f => 146
	i64 17509662556995089465, ; 649: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 79
	i64 17514990004910432069, ; 650: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 315
	i64 17522591619082469157, ; 651: GoogleGson => 0xf32cc03d27a5bf25 => 175
	i64 17590473451926037903, ; 652: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 224
	i64 17623389608345532001, ; 653: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 327
	i64 17627500474728259406, ; 654: System.Globalization => 0xf4a176498a351f4e => 41
	i64 17671790519499593115, ; 655: SkiaSharp.Views.Android => 0xf53ecfd92be3959b => 215
	i64 17685921127322830888, ; 656: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 657: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 338
	i64 17704177640604968747, ; 658: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 270
	i64 17710060891934109755, ; 659: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 267
	i64 17712670374920797664, ; 660: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 106
	i64 17777860260071588075, ; 661: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 109
	i64 17838668724098252521, ; 662: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17891337867145587222, ; 663: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 300
	i64 17928294245072900555, ; 664: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 43
	i64 17992315986609351877, ; 665: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 160
	i64 18017743553296241350, ; 666: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 191
	i64 18025913125965088385, ; 667: System.Threading => 0xfa28e87b91334681 => 147
	i64 18096531542100961995, ; 668: NetTopologySuite.dll => 0xfb23cb8ed9946acb => 209
	i64 18099568558057551825, ; 669: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 326
	i64 18116111925905154859, ; 670: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 236
	i64 18121036031235206392, ; 671: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 272
	i64 18132221390331549284, ; 672: SkiaSharp.Views.Maui.Controls.Compatibility => 0xfba297492f739664 => 217
	i64 18146411883821974900, ; 673: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 37
	i64 18146811631844267958, ; 674: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18225059387460068507, ; 675: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 145
	i64 18245806341561545090, ; 676: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 677: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 253
	i64 18305135509493619199, ; 678: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 274
	i64 18318849532986632368, ; 679: System.Security.dll => 0xfe39a097c37fa8b0 => 129
	i64 18324163916253801303, ; 680: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 321
	i64 18380184030268848184, ; 681: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 290
	i64 18421022575907732603, ; 682: Mapsui.dll => 0xffa49e6f1c6e7c7b => 177
	i64 18439108438687598470 ; 683: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 93
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [684 x i32] [
	i32 252, ; 0
	i32 174, ; 1
	i32 201, ; 2
	i32 170, ; 3
	i32 206, ; 4
	i32 221, ; 5
	i32 57, ; 6
	i32 239, ; 7
	i32 182, ; 8
	i32 150, ; 9
	i32 280, ; 10
	i32 208, ; 11
	i32 283, ; 12
	i32 246, ; 13
	i32 131, ; 14
	i32 219, ; 15
	i32 55, ; 16
	i32 282, ; 17
	i32 190, ; 18
	i32 314, ; 19
	i32 179, ; 20
	i32 94, ; 21
	i32 265, ; 22
	i32 128, ; 23
	i32 0, ; 24
	i32 144, ; 25
	i32 240, ; 26
	i32 18, ; 27
	i32 317, ; 28
	i32 251, ; 29
	i32 266, ; 30
	i32 149, ; 31
	i32 103, ; 32
	i32 94, ; 33
	i32 183, ; 34
	i32 295, ; 35
	i32 325, ; 36
	i32 35, ; 37
	i32 27, ; 38
	i32 235, ; 39
	i32 273, ; 40
	i32 49, ; 41
	i32 114, ; 42
	i32 69, ; 43
	i32 203, ; 44
	i32 64, ; 45
	i32 169, ; 46
	i32 144, ; 47
	i32 323, ; 48
	i32 294, ; 49
	i32 186, ; 50
	i32 234, ; 51
	i32 269, ; 52
	i32 259, ; 53
	i32 39, ; 54
	i32 88, ; 55
	i32 80, ; 56
	i32 65, ; 57
	i32 61, ; 58
	i32 85, ; 59
	i32 233, ; 60
	i32 105, ; 61
	i32 313, ; 62
	i32 280, ; 63
	i32 101, ; 64
	i32 34, ; 65
	i32 230, ; 66
	i32 335, ; 67
	i32 282, ; 68
	i32 204, ; 69
	i32 173, ; 70
	i32 335, ; 71
	i32 118, ; 72
	i32 267, ; 73
	i32 309, ; 74
	i32 327, ; 75
	i32 141, ; 76
	i32 140, ; 77
	i32 303, ; 78
	i32 52, ; 79
	i32 34, ; 80
	i32 140, ; 81
	i32 209, ; 82
	i32 227, ; 83
	i32 237, ; 84
	i32 214, ; 85
	i32 189, ; 86
	i32 199, ; 87
	i32 251, ; 88
	i32 8, ; 89
	i32 14, ; 90
	i32 331, ; 91
	i32 279, ; 92
	i32 50, ; 93
	i32 262, ; 94
	i32 135, ; 95
	i32 100, ; 96
	i32 244, ; 97
	i32 289, ; 98
	i32 115, ; 99
	i32 228, ; 100
	i32 162, ; 101
	i32 334, ; 102
	i32 165, ; 103
	i32 66, ; 104
	i32 195, ; 105
	i32 183, ; 106
	i32 309, ; 107
	i32 79, ; 108
	i32 100, ; 109
	i32 284, ; 110
	i32 116, ; 111
	i32 314, ; 112
	i32 296, ; 113
	i32 77, ; 114
	i32 295, ; 115
	i32 113, ; 116
	i32 120, ; 117
	i32 47, ; 118
	i32 217, ; 119
	i32 127, ; 120
	i32 260, ; 121
	i32 231, ; 122
	i32 81, ; 123
	i32 109, ; 124
	i32 74, ; 125
	i32 306, ; 126
	i32 216, ; 127
	i32 206, ; 128
	i32 52, ; 129
	i32 214, ; 130
	i32 286, ; 131
	i32 193, ; 132
	i32 68, ; 133
	i32 285, ; 134
	i32 192, ; 135
	i32 82, ; 136
	i32 208, ; 137
	i32 171, ; 138
	i32 329, ; 139
	i32 115, ; 140
	i32 185, ; 141
	i32 194, ; 142
	i32 155, ; 143
	i32 193, ; 144
	i32 221, ; 145
	i32 225, ; 146
	i32 180, ; 147
	i32 166, ; 148
	i32 278, ; 149
	i32 252, ; 150
	i32 197, ; 151
	i32 31, ; 152
	i32 204, ; 153
	i32 121, ; 154
	i32 71, ; 155
	i32 61, ; 156
	i32 160, ; 157
	i32 112, ; 158
	i32 87, ; 159
	i32 202, ; 160
	i32 340, ; 161
	i32 104, ; 162
	i32 18, ; 163
	i32 145, ; 164
	i32 117, ; 165
	i32 57, ; 166
	i32 246, ; 167
	i32 17, ; 168
	i32 51, ; 169
	i32 91, ; 170
	i32 337, ; 171
	i32 54, ; 172
	i32 128, ; 173
	i32 151, ; 174
	i32 40, ; 175
	i32 91, ; 176
	i32 189, ; 177
	i32 290, ; 178
	i32 49, ; 179
	i32 307, ; 180
	i32 161, ; 181
	i32 13, ; 182
	i32 264, ; 183
	i32 228, ; 184
	i32 285, ; 185
	i32 35, ; 186
	i32 66, ; 187
	i32 108, ; 188
	i32 184, ; 189
	i32 181, ; 190
	i32 229, ; 191
	i32 98, ; 192
	i32 98, ; 193
	i32 11, ; 194
	i32 11, ; 195
	i32 271, ; 196
	i32 25, ; 197
	i32 127, ; 198
	i32 75, ; 199
	i32 263, ; 200
	i32 108, ; 201
	i32 220, ; 202
	i32 289, ; 203
	i32 287, ; 204
	i32 105, ; 205
	i32 2, ; 206
	i32 26, ; 207
	i32 242, ; 208
	i32 156, ; 209
	i32 333, ; 210
	i32 21, ; 211
	i32 336, ; 212
	i32 48, ; 213
	i32 42, ; 214
	i32 125, ; 215
	i32 232, ; 216
	i32 58, ; 217
	i32 118, ; 218
	i32 292, ; 219
	i32 255, ; 220
	i32 241, ; 221
	i32 3, ; 222
	i32 261, ; 223
	i32 281, ; 224
	i32 37, ; 225
	i32 123, ; 226
	i32 330, ; 227
	i32 281, ; 228
	i32 330, ; 229
	i32 136, ; 230
	i32 148, ; 231
	i32 84, ; 232
	i32 89, ; 233
	i32 265, ; 234
	i32 212, ; 235
	i32 341, ; 236
	i32 212, ; 237
	i32 262, ; 238
	i32 318, ; 239
	i32 237, ; 240
	i32 248, ; 241
	i32 293, ; 242
	i32 200, ; 243
	i32 185, ; 244
	i32 298, ; 245
	i32 263, ; 246
	i32 132, ; 247
	i32 213, ; 248
	i32 95, ; 249
	i32 3, ; 250
	i32 326, ; 251
	i32 104, ; 252
	i32 329, ; 253
	i32 32, ; 254
	i32 153, ; 255
	i32 157, ; 256
	i32 187, ; 257
	i32 154, ; 258
	i32 81, ; 259
	i32 257, ; 260
	i32 142, ; 261
	i32 86, ; 262
	i32 19, ; 263
	i32 258, ; 264
	i32 50, ; 265
	i32 227, ; 266
	i32 333, ; 267
	i32 60, ; 268
	i32 53, ; 269
	i32 218, ; 270
	i32 4, ; 271
	i32 96, ; 272
	i32 226, ; 273
	i32 17, ; 274
	i32 154, ; 275
	i32 83, ; 276
	i32 28, ; 277
	i32 44, ; 278
	i32 63, ; 279
	i32 65, ; 280
	i32 324, ; 281
	i32 171, ; 282
	i32 216, ; 283
	i32 266, ; 284
	i32 1, ; 285
	i32 301, ; 286
	i32 46, ; 287
	i32 223, ; 288
	i32 24, ; 289
	i32 234, ; 290
	i32 215, ; 291
	i32 191, ; 292
	i32 164, ; 293
	i32 107, ; 294
	i32 12, ; 295
	i32 260, ; 296
	i32 62, ; 297
	i32 222, ; 298
	i32 23, ; 299
	i32 92, ; 300
	i32 167, ; 301
	i32 12, ; 302
	i32 305, ; 303
	i32 207, ; 304
	i32 28, ; 305
	i32 102, ; 306
	i32 14, ; 307
	i32 179, ; 308
	i32 125, ; 309
	i32 243, ; 310
	i32 275, ; 311
	i32 90, ; 312
	i32 264, ; 313
	i32 9, ; 314
	i32 85, ; 315
	i32 254, ; 316
	i32 287, ; 317
	i32 328, ; 318
	i32 70, ; 319
	i32 167, ; 320
	i32 1, ; 321
	i32 274, ; 322
	i32 190, ; 323
	i32 5, ; 324
	i32 328, ; 325
	i32 43, ; 326
	i32 222, ; 327
	i32 174, ; 328
	i32 302, ; 329
	i32 157, ; 330
	i32 277, ; 331
	i32 111, ; 332
	i32 223, ; 333
	i32 338, ; 334
	i32 192, ; 335
	i32 180, ; 336
	i32 120, ; 337
	i32 219, ; 338
	i32 188, ; 339
	i32 292, ; 340
	i32 233, ; 341
	i32 211, ; 342
	i32 158, ; 343
	i32 130, ; 344
	i32 297, ; 345
	i32 56, ; 346
	i32 137, ; 347
	i32 82, ; 348
	i32 29, ; 349
	i32 244, ; 350
	i32 10, ; 351
	i32 294, ; 352
	i32 170, ; 353
	i32 241, ; 354
	i32 149, ; 355
	i32 93, ; 356
	i32 254, ; 357
	i32 59, ; 358
	i32 205, ; 359
	i32 156, ; 360
	i32 313, ; 361
	i32 199, ; 362
	i32 63, ; 363
	i32 87, ; 364
	i32 172, ; 365
	i32 78, ; 366
	i32 46, ; 367
	i32 203, ; 368
	i32 142, ; 369
	i32 310, ; 370
	i32 303, ; 371
	i32 248, ; 372
	i32 73, ; 373
	i32 90, ; 374
	i32 300, ; 375
	i32 134, ; 376
	i32 89, ; 377
	i32 286, ; 378
	i32 306, ; 379
	i32 245, ; 380
	i32 184, ; 381
	i32 308, ; 382
	i32 111, ; 383
	i32 41, ; 384
	i32 158, ; 385
	i32 4, ; 386
	i32 102, ; 387
	i32 69, ; 388
	i32 59, ; 389
	i32 38, ; 390
	i32 235, ; 391
	i32 152, ; 392
	i32 55, ; 393
	i32 33, ; 394
	i32 198, ; 395
	i32 205, ; 396
	i32 232, ; 397
	i32 21, ; 398
	i32 162, ; 399
	i32 298, ; 400
	i32 319, ; 401
	i32 296, ; 402
	i32 291, ; 403
	i32 139, ; 404
	i32 220, ; 405
	i32 322, ; 406
	i32 200, ; 407
	i32 88, ; 408
	i32 146, ; 409
	i32 247, ; 410
	i32 161, ; 411
	i32 276, ; 412
	i32 178, ; 413
	i32 6, ; 414
	i32 168, ; 415
	i32 30, ; 416
	i32 210, ; 417
	i32 182, ; 418
	i32 106, ; 419
	i32 257, ; 420
	i32 320, ; 421
	i32 291, ; 422
	i32 197, ; 423
	i32 230, ; 424
	i32 284, ; 425
	i32 166, ; 426
	i32 186, ; 427
	i32 258, ; 428
	i32 139, ; 429
	i32 316, ; 430
	i32 58, ; 431
	i32 143, ; 432
	i32 80, ; 433
	i32 73, ; 434
	i32 129, ; 435
	i32 25, ; 436
	i32 7, ; 437
	i32 92, ; 438
	i32 288, ; 439
	i32 136, ; 440
	i32 224, ; 441
	i32 112, ; 442
	i32 210, ; 443
	i32 9, ; 444
	i32 103, ; 445
	i32 19, ; 446
	i32 256, ; 447
	i32 270, ; 448
	i32 341, ; 449
	i32 250, ; 450
	i32 32, ; 451
	i32 238, ; 452
	i32 45, ; 453
	i32 321, ; 454
	i32 29, ; 455
	i32 239, ; 456
	i32 56, ; 457
	i32 133, ; 458
	i32 113, ; 459
	i32 293, ; 460
	i32 334, ; 461
	i32 304, ; 462
	i32 54, ; 463
	i32 201, ; 464
	i32 6, ; 465
	i32 76, ; 466
	i32 249, ; 467
	i32 110, ; 468
	i32 176, ; 469
	i32 253, ; 470
	i32 101, ; 471
	i32 308, ; 472
	i32 322, ; 473
	i32 169, ; 474
	i32 114, ; 475
	i32 316, ; 476
	i32 288, ; 477
	i32 243, ; 478
	i32 75, ; 479
	i32 299, ; 480
	i32 84, ; 481
	i32 301, ; 482
	i32 336, ; 483
	i32 236, ; 484
	i32 337, ; 485
	i32 320, ; 486
	i32 278, ; 487
	i32 159, ; 488
	i32 2, ; 489
	i32 249, ; 490
	i32 172, ; 491
	i32 24, ; 492
	i32 229, ; 493
	i32 31, ; 494
	i32 116, ; 495
	i32 36, ; 496
	i32 16, ; 497
	i32 315, ; 498
	i32 51, ; 499
	i32 318, ; 500
	i32 302, ; 501
	i32 20, ; 502
	i32 122, ; 503
	i32 153, ; 504
	i32 178, ; 505
	i32 256, ; 506
	i32 130, ; 507
	i32 310, ; 508
	i32 238, ; 509
	i32 147, ; 510
	i32 188, ; 511
	i32 225, ; 512
	i32 119, ; 513
	i32 27, ; 514
	i32 131, ; 515
	i32 99, ; 516
	i32 133, ; 517
	i32 276, ; 518
	i32 152, ; 519
	i32 96, ; 520
	i32 124, ; 521
	i32 226, ; 522
	i32 68, ; 523
	i32 71, ; 524
	i32 331, ; 525
	i32 261, ; 526
	i32 279, ; 527
	i32 312, ; 528
	i32 135, ; 529
	i32 218, ; 530
	i32 123, ; 531
	i32 70, ; 532
	i32 110, ; 533
	i32 177, ; 534
	i32 271, ; 535
	i32 195, ; 536
	i32 151, ; 537
	i32 323, ; 538
	i32 339, ; 539
	i32 299, ; 540
	i32 117, ; 541
	i32 247, ; 542
	i32 175, ; 543
	i32 340, ; 544
	i32 307, ; 545
	i32 126, ; 546
	i32 176, ; 547
	i32 132, ; 548
	i32 196, ; 549
	i32 76, ; 550
	i32 45, ; 551
	i32 250, ; 552
	i32 72, ; 553
	i32 62, ; 554
	i32 97, ; 555
	i32 83, ; 556
	i32 324, ; 557
	i32 42, ; 558
	i32 60, ; 559
	i32 277, ; 560
	i32 194, ; 561
	i32 36, ; 562
	i32 39, ; 563
	i32 240, ; 564
	i32 305, ; 565
	i32 159, ; 566
	i32 97, ; 567
	i32 245, ; 568
	i32 196, ; 569
	i32 187, ; 570
	i32 134, ; 571
	i32 20, ; 572
	i32 64, ; 573
	i32 311, ; 574
	i32 124, ; 575
	i32 74, ; 576
	i32 269, ; 577
	i32 163, ; 578
	i32 155, ; 579
	i32 311, ; 580
	i32 5, ; 581
	i32 319, ; 582
	i32 48, ; 583
	i32 283, ; 584
	i32 312, ; 585
	i32 143, ; 586
	i32 138, ; 587
	i32 99, ; 588
	i32 202, ; 589
	i32 122, ; 590
	i32 119, ; 591
	i32 141, ; 592
	i32 38, ; 593
	i32 67, ; 594
	i32 40, ; 595
	i32 163, ; 596
	i32 72, ; 597
	i32 325, ; 598
	i32 164, ; 599
	i32 198, ; 600
	i32 213, ; 601
	i32 126, ; 602
	i32 255, ; 603
	i32 304, ; 604
	i32 67, ; 605
	i32 168, ; 606
	i32 268, ; 607
	i32 242, ; 608
	i32 173, ; 609
	i32 207, ; 610
	i32 275, ; 611
	i32 150, ; 612
	i32 44, ; 613
	i32 107, ; 614
	i32 47, ; 615
	i32 95, ; 616
	i32 30, ; 617
	i32 0, ; 618
	i32 23, ; 619
	i32 165, ; 620
	i32 22, ; 621
	i32 137, ; 622
	i32 77, ; 623
	i32 332, ; 624
	i32 53, ; 625
	i32 268, ; 626
	i32 273, ; 627
	i32 10, ; 628
	i32 231, ; 629
	i32 272, ; 630
	i32 259, ; 631
	i32 16, ; 632
	i32 211, ; 633
	i32 339, ; 634
	i32 138, ; 635
	i32 13, ; 636
	i32 15, ; 637
	i32 121, ; 638
	i32 86, ; 639
	i32 148, ; 640
	i32 22, ; 641
	i32 33, ; 642
	i32 78, ; 643
	i32 317, ; 644
	i32 297, ; 645
	i32 332, ; 646
	i32 181, ; 647
	i32 146, ; 648
	i32 79, ; 649
	i32 315, ; 650
	i32 175, ; 651
	i32 224, ; 652
	i32 327, ; 653
	i32 41, ; 654
	i32 215, ; 655
	i32 26, ; 656
	i32 338, ; 657
	i32 270, ; 658
	i32 267, ; 659
	i32 106, ; 660
	i32 109, ; 661
	i32 7, ; 662
	i32 300, ; 663
	i32 43, ; 664
	i32 160, ; 665
	i32 191, ; 666
	i32 147, ; 667
	i32 209, ; 668
	i32 326, ; 669
	i32 236, ; 670
	i32 272, ; 671
	i32 217, ; 672
	i32 37, ; 673
	i32 15, ; 674
	i32 145, ; 675
	i32 8, ; 676
	i32 253, ; 677
	i32 274, ; 678
	i32 129, ; 679
	i32 321, ; 680
	i32 290, ; 681
	i32 177, ; 682
	i32 93 ; 683
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
