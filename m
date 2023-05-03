Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D127C77B78
	for <linux-firmware@archiver.kernel.org>; Wed,  3 May 2023 13:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48995C433D2; Wed,  3 May 2023 13:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253F1C4339B
	for <linux-firmware@kernel.org>; Wed,  3 May 2023 13:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683119458;
	bh=vu6qsSSr3lWtbchT3fE16jGTK1ZTVJo6toaLZjZdpHg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=oo7yubDfJ3f5XtgNSK2IY2RuAlaaGptT01lju0h5IjZun7HO+Nou2gg5m1+a5cdiH
	 d4j2BBXLI0WQoypyduxtT/K1c8SLLKrlY38lkNEc/3xEtcvVxo0RZWzNUf1JRCy4wu
	 7Gn0VeujdpQTYgsUleVF2Ppy7Q4+QI4zMDra+ecIVJMxxVbybmAVwh91/Brv24rK6C
	 9AEKPQpula60i6KsdyC2cLjEXV3iMGihTR/N2tK5RJ3F2OSfxVrXDLcI+tDLMCXzku
	 y6y53Yn0Noq6VQiSPYfbrHYlsWZ2uudjjJq6LQic51Sb9/HwX4ubyZ8vYAN7Q/y5FD
	 RoJX40T9RI2cw==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so3211039276.1
        for <linux-firmware@kernel.org>; Wed, 03 May 2023 06:10:58 -0700 (PDT)
X-Gm-Message-State: AC+VfDzyxk329T4BuhNpMRZ6GRx0ea7DCPV3Bmr4dOzAxX50hfyruAGm
	DsYiHxAA0I+4iQLsQ4tyz9+rOHYKapb2SSsk11o=
X-Google-Smtp-Source: ACHHUZ5Zvql/H4yQRSErKwTwY9/nFEy/IoHBSrxJVfalspmIedDwH205KWhV3Gord6nifEzzXQvWae15fwNEZbRjs0I=
X-Received: by 2002:a25:46c4:0:b0:b8f:671d:1f13 with SMTP id
 t187-20020a2546c4000000b00b8f671d1f13mr2184393yba.1.1683119457037; Wed, 03
 May 2023 06:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230502094614.9148-1-hildawu@realtek.com>
In-Reply-To: <20230502094614.9148-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 3 May 2023 09:10:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4Ljdavb+2OzOzBU-XmxN-dZ9gu3G4REVJLKYPKvLm=bw@mail.gmail.com>
Message-ID: <CA+5PVA4Ljdavb+2OzOzBU-XmxN-dZ9gu3G4REVJLKYPKvLm=bw@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8761B BT UART firmware to 0x9DC6_D922
To: hildawu@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Larry.Finger@lwfinger.net, max.chou@realtek.com, 
	alex_lu@realsil.com.cn, mu_hua_chen@realtek.com, hsinyu_chang@realtek.com, 
	kidman@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Tue, May 2, 2023 at 5:46=E2=80=AFAM <hildawu@realtek.com> wrote:
>
> From: Hilda Wu <hildawu@realtek.com>
>
> This firmware patch update for Realtek RTL8761B BT UART controller.
>
> Release Version: 0x9DC6_D922
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8761b_fw.bin | Bin 44204 -> 45444 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8761b_fw.bin b/rtl_bt/rtl8761b_fw.bin
> index 4b04eb63a4fff3f22a0100eedb9a924619efbecb..aa99594136c73bb115c6d14af=
879cd4276bb559f 100644
> GIT binary patch
> delta 11476
> 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
>IT;j
> zY)oqG9`FHbOX>{jfHW(xkTi|z2$Kxz|7Ze83+Qa<C$j~X2A6E;CbI{X0rvrHZ0IGk
> zi|lOZB(rSj0&8vQ&FSswtm%yD;qo3!7_@Ea7_*G&ANK%kZRs7e9kl{(fZGhT46{w`
> z0NezW8k0e569E>JRckXK^{o(q|NsB||NsB}|Nr0r|Np=3DL|Nnpg1g`+F00001v!H9L
> z0t3bN9+OROhZ-mp5rC;r2Y{s)0f6<x0DuS?5`eiP0f70=3DlkRSgf5pcTfFJ<?wu}T4
> zfP4Y~whb`^fMxs;fRF+Jw)JBbVieI6&;V%!XIu~|;8LOsT2)}6@eFOa>M*kdY!dBt
> z<zuC8GmPslv~A?T@p_|f>P0GpXAsjXvOww))e)8d_aAIb?4a<Ztq_xg?VIHTU?sNI
> z<(uXI_aAD^>I7OYe_$W7a5RzP0Q3ND;`F%83Ty<_9<&A20Bi=3D-pz#b$nCl1A0c@l9
> z9d2Ru32zeXZQ=3Dm(e5(l4!0}q53DO|&K%ffJMyLzYQlJddQ=3DkpfRG<#hRiF>j4zfV%
> z`fUM8|7uL>An-t-L+PMl6_*r|6OaIE0PhQ90A(OL5`Zi?5)yzlX9a)&0096f6cK=3D_
> zPX~aLm~XTJ4U<i9p8*Av?QkW3X0$+@0ZIcRWwJo(0A&GcOX^{>K-&OpVzYq5VzWTQ
> zVzXkjK%0!}VziCw5NwO=3DjOqz&jp|>tjOt&sjp_mS0c?xxjOqgR0ZfhRK-*igVDMU^
> z5NmAe0xDUvK*IoPS+hXHS+hXHRkFbFSfT-IZ0ZgwR<gqMoTB_ojO*f)mvIw+PqG1P
> z0K#kQPO@OyPP37tPO<>P0%}X@jOtOtOtL`g0A)<FK<WTxOR`|`XQF^@tL?4pVDV?d
> zNVCAB1Z<7&z{5JT0PzaKpzx@}0BxY~sl(v$rh@=3Dg9bn+`rlSaJZ0#5=3DVDY4)J+=3D_=
=3D
> z0dH;XL2GO4Z0%t2q{3jH>+kG;>o~XU>tNmoYisMQ>y7JR@npgS5Hzwt>HuXlvOwwp
> zXfv_^!vAhFvH-#}v;b{0vOwwsPBO9p!ZNY|!W*){@K~Y&Yi#NYDlfDD_aAHk@&Ii>
> ztBmTc>Wu0@%PX`0_aAH!@BnQ<tE=3Dsd>aFUG>OjjUvT5=3DdYhcO+mjsX#0Ph210A(z=3D
> z5`f8?0Dv&K5`Zz24RR}g1-KG`2)Gh}&|MOM1h^7_we1jqk?RnE$S)FrATAPs#GnAM
> z|Ns8~@iha0`OXl45x5e7Jh&2oK)4csjp+b@Lb(!vL%9-wG!X!{HW2`}3=3Dsgf{bL1U
> z1kix2|7xu20rUfO|Mwql3XltvtnM3N0rUi14PXHD1a!dg2w(tz^aymo@Csl6^a6Ci
> z@Bm=3DU5CZT8YL4nSA_DXUbWLCa@B(xLV8IY%vb_*wvOwyDKxaS>OMs&hYD?;j>OjLF
> z@MNF~YD?;D>LBn$z+AGx@K~Y&Yi#NiDrZ0+OMs&XYK-bY!)HJsOMs&YYD?;j>OjM1
> zKqO0mqXlY9>Wu1tK*J7fuxCVWeh^KxpzzkD#K55Nm!u1BNWg$Jtn7j`g}?!9i|mHL
> z1#E}F3v7wNO2DvZfWr=3DKW)Kfv9brJSVDMU^0&I-x7b5XatnQ%k3~E^JJhBq*S>|By
> zu#OOFTI~TU<>)}JM8H6<672x?pfv#YqcuMepz;`MSne`^v=3DZt`<bd#qiV$jA>;Wp}
> z=3Dq$7V@uj2y@#LhSHSO)7HJ~-4HKR2W>HzjYG642NGD7VHV7KA`_MkNo5CHL_qyX`Q
> zq<}Q7?0__YG=3DnsQG=3Dk~?Z3SS9;sEwQH30UbHK6hsYFO?VvJ&oD=3D0NgNu0+5<@=3D~r=
s
> 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
@
> zng&u8VU6emYy{LQv<1|OYzEXYG>zk6s{?EZ(g)M|Z9wz@Zlv=3DLZzHlm>HuXRvoJDA
> z<3Xx`Yi#NWA_Qs->IEWzYD?-(=3D>KX=3D=3DrA)IvPt6rYhc=3D8+5u_-N&jnX=3D@40+VG=
y%`
> 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
>
> delta 10152
> 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
l>WHW8z
> zK=3D5#je=3D`x&XFvo?WHW8zK=3D5#je=3D`!(XFvr@WHW8zK=3D5#je=3D`%)XFvu^WHW8z=
K=3D5#j
> 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
> W0!Nv|-u6t<U#SF>5jQ}Se6a{OLfPm5
>
> --
> 2.17.1
>
