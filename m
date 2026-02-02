Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DC6E7315B
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Feb 2026 12:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58959C19421; Mon,  2 Feb 2026 12:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433DDC116D0
	for <linux-firmware@kernel.org>; Mon,  2 Feb 2026 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770034734;
	bh=+RwdKDmCR8zXddxypkyZz9enzTSdG7WgS/hQzX3YzZ0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JWxpYfjCbXuxVfUPoF9MPcaJpROyrSbTR4TViyUV3CTqYAYXm5RYCm7CJxiTnk3UB
	 DF7IgFqXukpjio5kp75QWYjPHJQC9WQN5Z8YGnSlILzwdeYTVi//6wMboVJcx/mPAS
	 lmPDl1Lnnvj/4JKcjHFTtujc6ITQ/FU/52HSgm0gEABCDskLDofsiKkvBez5/SN+BV
	 KSv7mlwvjNnhT38qGnhZbXluloHzoThg/fdYgRuGlCs2lvz52DR7QwKwZlf43EzBXY
	 PdPn8xnQst+zFbTWEIwt9gK/iQgncrcSKIx3FMptT+lUqAp0B0pRUT3yc58sy8qoWb
	 e+uqQt0+HUxNw==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79427f739b0so41564767b3.3
        for <linux-firmware@kernel.org>; Mon, 02 Feb 2026 04:18:54 -0800 (PST)
X-Gm-Message-State: AOJu0YyiRSh9Mx8pZQ4HgRCSTQZ4J4nJskkj4p5D28TrcTvdz+MkH6ds
	owU3rhCXzZDoFMiEcznAvO3Tw2mx8MkNUj/3VKPk8+9hblNwIMOb4u4fsVhglMuGgB06b7HH27v
	dXyTtge6tbSqGLvuCG7KRPkk/CqJ7T2I=
X-Received: by 2002:a05:690c:63c8:b0:794:84ee:9aa5 with SMTP id
 00721157ae682-7949dfd9c21mr86733957b3.47.1770034733337; Mon, 02 Feb 2026
 04:18:53 -0800 (PST)
MIME-Version: 1.0
References: <20260128032535.124-1-javen_xu@realsil.com.cn>
In-Reply-To: <20260128032535.124-1-javen_xu@realsil.com.cn>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 Feb 2026 07:18:41 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6VfCZGwSZVG3pOhPcw8OC_yyzipW9W_KFiJEuNdmPj1Q@mail.gmail.com>
X-Gm-Features: AZwV_Qgr-3qHBHohVQCpTCxYNnrNBgpB8UB3ra80eOsaIPvu1S-DEHyt57ezvEw
Message-ID: <CA+5PVA6VfCZGwSZVG3pOhPcw8OC_yyzipW9W_KFiJEuNdmPj1Q@mail.gmail.com>
Subject: Re: [PATCH] rtl_nic: add firmware rtl8125cp-1 for RTL8125cp
To: javen <javen_xu@realsil.com.cn>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hkallweit1@gmail.com, nic_swsd@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/890

josh

On Tue, Jan 27, 2026 at 10:25=E2=80=AFPM javen <javen_xu@realsil.com.cn> wr=
ote:
>
> From: Javen Xu <javen_xu@realsil.com.cn>
>
> This adds firmware rtl8125cp-1 for RTL8125cp.
>
> Signed-off-by: Javen Xu <javen_xu@realsil.com.cn>
> ---
>  WHENCE                 |   3 +++
>  rtl_nic/rtl8125cp-1.fw | Bin 0 -> 1728 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100755 rtl_nic/rtl8125cp-1.fw
>
> diff --git a/WHENCE b/WHENCE
> index 9f6a9f52..f148485c 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3675,6 +3675,9 @@ Version: 0.0.4
>  File: rtl_nic/rtl8125k-1.fw
>  Version: 0.0.1
>
> +File: rtl_nic/rtl8125cp-1.fw
> +Version: 0.0.1
> +
>  File: rtl_nic/rtl9151a-1.fw
>  Version: 0.0.1
>
> diff --git a/rtl_nic/rtl8125cp-1.fw b/rtl_nic/rtl8125cp-1.fw
> new file mode 100755
> index 0000000000000000000000000000000000000000..210f14c38488faf51c072d3e3=
c819e5800e06345
> GIT binary patch
> literal 1728
> zcmai!UufG^6vuDUG^<$`LwlCRTH2p&C}nP0lCE7T>Vi`d@lUB^%v!r<NlTS=3DhEUs8
> zMmg5D>pF!F^uZVD=3DBA+Ho&*uJ8c<&*Zc^Es{Cp66a)L0cg7I^cUzr2NwujI6o_p>&
> z_n!OfHO83Y<gwmVx;t0cojQ_CBojSOGPNhYZ%?|1Nq!30S)Vaa+>CUJqf?2jGm*_X
> z+2eVqFh1i<<X&*bo-IyHXN#jwAv>8HcXH3?N1b$6U%I<*Z_3o#T%^gAZf{j%I<Yz|
> zgw<nVEP^#)f<>_y)`T@<EtrF~VR5WOYm9M?396DW;u;m#uTeLkF*m49Zk;x}A#HK%
> z)p5hx=3D0-H`HfV<{+UZ7hryJ8<Zj&b5W=3D*;+8u;8%e~H{5$F(=3D!q0y_I>i=3D@5nooC=
8
> zD}hd;)9AhE9&|6d4}A~%K6D0sKl%amL+FRmkDwn#KaTE451<dC51|jE2hl_5Ve|<4
> zC_0ZGLyx1MLmxvQM;FjV^dx!;eFFU=3D`XqW5t>`&zFU;#5W>K4JmedI^Yo*s3)Sh^q
> z`YJs)nYpdD{}FyGf1hb(Yzo|sYh4){oiYB^yfG`r)FuyvTD4sp)wGKyK58V7sLip$
> zec8F_Ds%W6;KmkFfxgS4V|Pi#U%k&;^}xACZT5>EgazUb!Sa65!yX4c4tX5*IO4G%
> z)=3D<;dcD&lQj;(ECq7kJYywl^|9#bCod0hAxhVUg9L~H6r{oBd)D*AQuT@&pe5p~|J
> z=3D6-UU=3DoWl8GNQiIq5<?-=3D7TS@?u_Wl9B~oR$HG-kH&kP$XRGVKV7<+mW4+z$b~}c#
> zO+UHp_-*!K`Hm&=3D?O90PIQizkrXIehtPeKB-^;hoTmKNb{=3D~mb{N{bwbu(ktb@xJh
> zmgte{_{wmV2Uzzj>-JN-JILA3(T{mi+ar5Ed)6Rl&BIgV_Fu&4opYYJw?s2oXq6b-
> zOCMwWE0{xkfI0tr@Pg=3D9S4AJZQmy$kHUFZf!~Ets?Os1*Z+0KM?LJ--U9xAv{|xbe
> z5P!ywy}sD^H;A`=3Ddy_R```r*z?=3Dj@D4xVN{2+zX+Y~04a;2Jb=3D07hV|5k1NG{|V=3D=
t
> zg$tKNFMUT}882EL=3DS~*?TX()My1rHPHNWV>8Z|aVOWfCOAMo9-i>~#HZjdX>{8~x$
> zd(KtSKZt&#<fg_iKZy>IXXd(S?Qf#xpV{NL)Fj`vHoimFt)GJIb<pMs@x8F868+e5
> znON%Bdk77({)T85Im;*T)0<(=3D^dn~&fm2<gN1^Rm-s7UjC6CJ<U-8%r?f;~G8zPmr
> ld`IPdsJtDX-*|6Ei#BTfrq5h28;807eTy=3D@H|8Hde*-ZO6(0Zq
>
> literal 0
> HcmV?d00001
>
> --
> 2.43.0
>
